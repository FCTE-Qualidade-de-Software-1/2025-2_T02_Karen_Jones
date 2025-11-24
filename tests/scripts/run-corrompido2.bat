@echo off
setlocal EnableDelayedExpansion

rem Pasta onde os .exr estão (um nível acima)
set "EXR_FOLDER=%~dp0..\validos"

rem Pasta de saída
set "OUT=%~dp0..\corrompidos"
if not exist "%OUT%" mkdir "%OUT%"

set /a count=0

echo Lendo arquivos .exr em: %EXR_FOLDER%
echo.

for %%F in ("%EXR_FOLDER%\*.exr") do (
    set /a count+=1
    if !count! gtr 20 goto :done

    set "OUTFILE=%OUT%\corrompido_%%~nxF"
    echo [!count!] Copiando: %%F
    copy "%%F" "!OUTFILE!" >nul

    call :m!count! "!OUTFILE!"
)

:done
echo.
echo Concluido. Processados %count% arquivo(s) .exr (ou menos, se havia menos de 20).
goto :eof


rem =========================
rem Métodos de corrupção
rem =========================

:m1
rem Método 1: zerar os 4 primeiros bytes (magic number quebrado)
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 4){0..3 | ForEach-Object{ $b[$_]=0 }}; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m2
rem Método 2: colocar 0xFF nos 4 primeiros bytes
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 4){0..3 | ForEach-Object{ $b[$_]=0xFF }}; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m3
rem Método 3: zerar bytes 16 a 31 (parte do header)
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 32){16..31 | ForEach-Object{ $b[$_]=0 }}; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m4
rem Método 4: sobrescrever bytes 64 a 127 com 0xAA
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 128){64..127 | ForEach-Object{ $b[$_]=0xAA }}; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m5
rem Método 5: zerar 1024 bytes no meio do arquivo
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$start=[int]($len/2); $size=[Math]::Min(1024,$len-$start); for($i=0;$i -lt $size;$i++){ $b[$start+$i]=0 }; [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m6
rem Método 6: truncar para 75%% do tamanho original
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -gt 0){$new=[int]($b.Length*0.75); if($new -lt 1){$new=1}; $b=$b[0..($new-1)]; [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m7
rem Método 7: truncar para 50%% do tamanho original
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -gt 0){$new=[int]($b.Length*0.5); if($new -lt 1){$new=1}; $b=$b[0..($new-1)]; [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m8
rem Método 8: acrescentar 512 bytes aleatórios no fim
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $rand=New-Object Random; $extra=New-Object byte[] 512; $rand.NextBytes($extra); $b=$b + $extra; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m9
rem Método 9: acrescentar 2048 bytes aleatórios no fim
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $rand=New-Object Random; $extra=New-Object byte[] 2048; $rand.NextBytes($extra); $b=$b + $extra; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m10
rem Método 10: inverter (xor) a cada 1000º byte
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); for($i=0;$i -lt $b.Length;$i+=1000){$b[$i] = $b[$i] -bxor 0xFF}; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m11
rem Método 11: inverter 100 bytes em posições aleatórias
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$r=New-Object Random; 1..100 | ForEach-Object{ $i=$r.Next(0,$len); $b[$i] = $b[$i] -bxor 0xFF }; [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m12
rem Método 12: zerar os últimos 512 bytes
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$size=[Math]::Min(512,$len); for($i=0;$i -lt $size;$i++){ $b[$len-1-$i]=0 }; [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m13
rem Método 13: sobrescrever bytes 8–15 com padrão crescente
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); for($i=8;$i -lt [Math]::Min(16,$b.Length);$i++){ $b[$i]=[byte]$i }; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m14
rem Método 14: duplicar os primeiros 1024 bytes no fim
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -gt 0){$copyLen=[Math]::Min(1024,$b.Length); $extra=$b[0..($copyLen-1)]; $b=$b + $extra; [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m15
rem Método 15: inverter a ordem dos primeiros 512 bytes
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $max=[Math]::Min(512,$b.Length); if($max -gt 1){$sub=$b[0..($max-1)]; [Array]::Reverse($sub); $sub.CopyTo($b,0); [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m16
rem Método 16: inverter a ordem dos últimos 512 bytes
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; $max=[Math]::Min(512,$len); if($max -gt 1){$start=$len-$max; $sub=$b[$start..($len-1)]; [Array]::Reverse($sub); $sub.CopyTo($b,$start); [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m17
rem Método 17: zerar um bloco aleatório de 256 bytes
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$size=[Math]::Min(256,$len); $r=New-Object Random; $start=$r.Next(0,$len-$size+1); for($i=0;$i -lt $size;$i++){ $b[$start+$i]=0 }; [IO.File]::WriteAllBytes($p,$b)}"
goto :eof

:m18
rem Método 18: definir cada 10º byte como 0xFF
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); for($i=0;$i -lt $b.Length;$i+=10){ $b[$i]=0xFF }; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m19
rem Método 19: se >10000 bytes, manter apenas os últimos 10000; senão zerar o primeiro quarto
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 10000){$b=$b[($len-10000)..($len-1)]} else { $q=[int]($len/4); for($i=0;$i -lt $q;$i++){ $b[$i]=0 } }; [IO.File]::WriteAllBytes($p,$b)"
goto :eof

:m20
rem Método 20: zerar bytes 4–7 e 100–199 (se existirem)
set "FILE=%~1"
powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 8){4..7   | ForEach-Object{ $b[$_]=0 }}; if($b.Length -ge 200){100..199 | ForEach-Object{ $b[$_]=0 }}; [IO.File]::WriteAllBytes($p,$b)"
goto :eof
