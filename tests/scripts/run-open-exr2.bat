@echo off
setlocal ENABLEDELAYEDEXPANSION

REM *** AJUSTE ESTES CAMINHOS ***
set "GIMP_EXE=C:\Users\caiov\AppData\Local\Programs\GIMP 3\bin\gimp-console-3.0.exe"
set "EXR_DIR=%~dp0..\validos"
set "CSV_OUT=%~dp0..\resultados\teste.csv"

REM Cabeçalho
echo arquivo;operacao;horario_comeco;horario_fim;tempo_ms;resultado;>"%CSV_OUT%"

echo.
echo === Iniciando testes em %EXR_DIR% ===
echo Saida em: %CSV_OUT%
echo.

REM Loop por todos os .exr
for %%F in ("%EXR_DIR%\*.exr") do (
    set "FILE_WIN=%%~fF"
    set "FILE_UNIX=!FILE_WIN:\=/!"

    set "OP=open-exr"

    REM =========== HORÁRIO INICIAL ===========
    REM for /f "tokens=2 delims==" %%t in ('wmic os get localdatetime /value') do set "dt1=%%t"
    REM set "dt1=!dt1: =!"   REM tira espacos
    for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt1=%%a"

    REM Extract components and format the timestamp
    set "YYYY=%dt1:~0,4%"
    set "MM=%dt1:~4,2%"
    set "DD=%dt1:~6,2%"
    set "HH=%dt1:~8,2%"
    set "Min=%dt1:~10,2%"
    set "Sec=%dt1:~12,2%"

    set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

    REM Display or use the timestamp
    echo Full Timestamp: %fullstamp%

    REM Guarda horario de texto (com ponto e timezone mesmo)
    set "HORARIO_COMECO=!%fullstamp%!"

    REM Converte para ms usando só AAAAMMDDhhmmss
    call :ToMs dt1 START_MS

    echo Testando !FILE_UNIX!

    REM Rodar GIMP
    "%GIMP_EXE%" --batch-interpreter=plug-in-script-fu-eval "--batch=(open-exr \"!FILE_UNIX!\")" --quit

    set "STATUS=!ERRORLEVEL!"

    REM =========== HORÁRIO FINAL ===========
    REM for /f "tokens=2 delims==" %%t in ('wmic os get localdatetime /value') do set "dt2=%%t"
    REM set "dt2=!dt2: =!"
    for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt2=%%a"

    REM Extract components and format the timestamp
    set "YYYY=%dt2:~0,4%"
    set "MM=%dt2:~4,2%"
    set "DD=%dt2:~6,2%"
    set "HH=%dt2:~8,2%"
    set "Min=%dt2:~10,2%"
    set "Sec=%dt2:~12,2%"

    set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

    set "HORARIO_FIM=!%fullstamp%!"
    call :ToMs dt2 END_MS

    REM Calcular tempo total
    set /a TEMPO_MS=END_MS-START_MS

    REM Registrar
    echo !FILE_UNIX!;!OP!;!HORARIO_COMECO!;!HORARIO_FIM!;!TEMPO_MS!;!STATUS!>>"%CSV_OUT%"
)

echo.
echo === Fim dos testes. Veja "%CSV_OUT%" ===
echo.
pause
exit /b


REM =========================================
REM  Sub-rotina: converte AAAAMMDDhhmmss... em ms absolutos
REM  (ignora frações e timezone; consideramos segundos)
REM =========================================
:ToMs
setlocal ENABLEDELAYEDEXPANSION
set "TS=!%1!"

REM TS vem como: 20251123102449.122000-180
REM Mantemos apenas a parte antes do ponto: 20251123102449
for /f "tokens=1 delims=." %%a in ("!TS!") do set "TS=%%a"

set "Y=!TS:~0,4!"
set "MO=!TS:~4,2!"
set "D=!TS:~6,2!"
set "H=!TS:~8,2!"
set "MI=!TS:~10,2!"
set "S=!TS:~12,2!"
set "MS=0"

REM Converter tudo para ms (aproximação: 1 mes = 30 dias)
set /a TOTAL = ((((((1%Y%*12+1%MO%)*30+1%D%)*24+1%H%)*60+1%MI%)*60+1%S%)*1000 + MS)

endlocal & set "%2=%TOTAL%"
exit /b
