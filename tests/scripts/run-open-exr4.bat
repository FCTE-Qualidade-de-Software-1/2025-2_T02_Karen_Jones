@echo off
setlocal ENABLEDELAYEDEXPANSION

REM *** AJUSTE ESTES CAMINHOS ***
set "GIMP_EXE=C:\Users\caiov\AppData\Local\Programs\GIMP 3\bin\gimp-console-3.0.exe"
set "EXR_DIR=%~dp0..\corrompidos"

REM Caminho do script Scheme que implementa (open-exr ...)
set "OPEN_EXR_SCM=%~dp0open-exr.scm"
set "OPEN_EXR_SCM_UNIX=%OPEN_EXR_SCM:\=/%"

REM ========= TIMESTAMP DA EXECUÇÃO (PARA O NOME DO CSV) =========
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "run_dt=%%a"

set "RYYYY=%run_dt:~0,4%"
set "RMM=%run_dt:~4,2%"
set "RDD=%run_dt:~6,2%"
set "RHH=%run_dt:~8,2%"
set "RMin=%run_dt:~10,2%"
set "RSec=%run_dt:~12,2%"

set "RUN_TS=%RYYYY%-%RMM%-%RDD%_%RHH%-%RMin%-%RSec%"

set "CSV_OUT=%~dp0..\resultados\teste_%RUN_TS%.csv"

REM Cabeçalho
echo arquivo;operacao;horario_comeco;horario_fim;tempo_ms;resultado;>"%CSV_OUT%"

echo.
echo === Iniciando testes em %EXR_DIR% ===
echo Saida em: %CSV_OUT%
echo.
echo (Pressione CTRL+C para interromper)
echo.

:loop
REM Para cada .exr, chamamos a sub-rotina ProcessOne
for %%F in ("%EXR_DIR%\*.exr") do call :ProcessOne "%%~fF"

REM Recomeça o loop até você dar CTRL+C
goto :loop


REM =========================================
REM  Sub-rotina: processa UM arquivo EXR
REM =========================================
:ProcessOne
REM sem setlocal aqui, usamos o setlocal global do topo

set "FILE_WIN=%~1"
set "FILE_UNIX=!FILE_WIN:\=/%!"
set "OP=open-exr"

REM =========== HORÁRIO INICIAL ===========
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt1=%%a"

set "YYYY=!dt1:~0,4!"
set "MM=!dt1:~4,2!"
set "DD=!dt1:~6,2!"
set "HH=!dt1:~8,2!"
set "Min=!dt1:~10,2!"
set "Sec=!dt1:~12,2!"

set "fullstamp=!YYYY!-!MM!-!DD!_!HH!-!Min!-!Sec!"
echo Full Timestamp (inicio): !fullstamp!

set "HORARIO_COMECO=!fullstamp!"

call :ToMs dt1 START_MS

echo Testando !FILE_UNIX!

REM Rodar GIMP
"%GIMP_EXE%" --batch-interpreter=plug-in-script-fu-eval "--batch=(load \"!OPEN_EXR_SCM_UNIX!\")" "--batch=(open-exr \"!FILE_UNIX!\")" --quit

set "STATUS=!ERRORLEVEL!"

REM =========== HORÁRIO FINAL ===========
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt2=%%a"

set "YYYY=!dt2:~0,4!"
set "MM=!dt2:~4,2!"
set "DD=!dt2:~6,2!"
set "HH=!dt2:~8,2!"
set "Min=!dt2:~10,2!"
set "Sec=!dt2:~12,2!"

set "fullstamp=!YYYY!-!MM!-!DD!_!HH!-!Min!-!Sec!"
set "HORARIO_FIM=!fullstamp!"

call :ToMs dt2 END_MS

set /a TEMPO_MS=END_MS-START_MS

REM Agora escreve direto no CSV
echo !FILE_UNIX!;!OP!;!HORARIO_COMECO!;!HORARIO_FIM!;!TEMPO_MS!;!STATUS!>>"%CSV_OUT%"

goto :eof


REM =========================================
REM  Sub-rotina: converte AAAAMMDDhhmmss... em ms (desde o início do dia)
REM =========================================
:ToMs
setlocal ENABLEDELAYEDEXPANSION
set "TS=!%1!"

REM TS vem como: 20251123102449.122000-180
REM Mantemos apenas a parte antes do ponto: 20251123102449
for /f "tokens=1 delims=." %%a in ("!TS!") do set "TS=%%a"

set "H=!TS:~8,2!"
set "MI=!TS:~10,2!"
set "S=!TS:~12,2!"

REM Remover zeros à esquerda
set /a HN=1%H%-100, MINN=1%MI%-100, SN=1%S%-100

set /a TOTAL=((HN*60+MINN)*60+SN)*1000

endlocal & set "%2=%TOTAL%"
goto :eof
