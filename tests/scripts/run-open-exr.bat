@echo off
setlocal ENABLEDELAYEDEXPANSION

REM *** AJUSTE ESTES CAMINHOS ***
set "GIMP_EXE=C:\Users\caiov\AppData\Local\Programs\GIMP 3\bin\gimp-console-3.0.exe"
set "EXR_DIR=C:\Users\caiov\Downloads"
set "CSV_OUT=C:\Users\caiov\resultados-open-exr.csv"

REM Cabeçalho do CSV
echo arquivo;exit_code;datetime>"%CSV_OUT%"

echo.
echo === Iniciando testes em %EXR_DIR% ===
echo Saída em: %CSV_OUT%
echo.

REM Loop por todos os .exr da pasta
for %%F in ("%EXR_DIR%\*.exr") do (
    REM Caminho completo em formato Windows
    set "FILE_WIN=%%~fF"

    REM Converter \ para / para o Scheme
    set "FILE_UNIX=!FILE_WIN:\=/!"

    echo Testando !FILE_UNIX!

    REM Chamar o GIMP console com open-exr
    "%GIMP_EXE%" --batch-interpreter=plug-in-script-fu-eval "--batch=(open-exr \"!FILE_UNIX!\")" --quit

    REM Capturar código de saída
    set "STATUS=!ERRORLEVEL!"

    REM Data/hora atual
    set "NOW=!date! !time!"

    REM Registrar no CSV: arquivo;exit_code;datetime
    echo !FILE_UNIX!;!STATUS!;!NOW!>>"%CSV_OUT%"
)

echo.
echo === Fim dos testes. Veja "%CSV_OUT%" ===

endlocal
pause
