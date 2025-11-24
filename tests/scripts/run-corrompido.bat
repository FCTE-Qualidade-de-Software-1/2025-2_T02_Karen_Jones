@echo off
setlocal EnableDelayedExpansion

rem Pasta onde os .exr estão (um nível acima)
set "EXR_FOLDER=%~dp0..\validos"

rem Pasta de saída
set "OUT=%~dp0..\corrompidos"

echo %EXR_FOLDER%
echo %OUT%

REM if not exist "%OUT%" mkdir "%OUT%"
REM
REM set /a count=0
REM 
REM echo Lendo arquivos .exr em: %EXR_FOLDER%
REM echo.
REM 
REM for %%F in ("%EXR_FOLDER%\*.exr") do (
REM     set /a count+=1
REM     if !count! gtr 20 goto :done
REM 
REM     set "OUTFILE=%OUT%\corrompido_%%~nxF"
REM     echo [!count!] Copiando: %%F
REM     copy "%%F" "!OUTFILE!" >nul
REM 
REM     call :m!count! "!OUTFILE!"
REM )
REM 
REM :done
REM echo.
REM echo Concluido. Processados %count% arquivo(s) .exr (ou menos, se havia menos de 20).
REM goto :eof
REM 
REM 
REM rem =========================
REM rem Métodos de corrupção
REM rem =========================
REM 
REM :m1
REM rem Método 1: zerar os 4 primeiros bytes (magic number quebrado)
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 4){0..3 | ForEach-Object{ $b[$_]=0 }}; [IO.REM File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m2
REM rem Método 2: colocar 0xFF nos 4 primeiros bytes
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 4){0..3 | ForEach-Object{ $b[$_]=0xFF }}; [IO.REM File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m3
REM rem Método 3: zerar bytes 16 a 31 (parte do header)
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 32){16..31 | ForEach-Object{ $b[$_]=0 }}; [IO.REM File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m4
REM rem Método 4: sobrescrever bytes 64 a 127 com 0xAA
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 128){64..127 | ForEach-Object{ $b[$_]=0xAA }}; REM [IO.File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m5
REM rem Método 5: zerar 1024 bytes no meio do arquivo
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$start=[int]($len/2); $size=REM [Math]::Min(1024,$len-$start); for($i=0;$i -lt $size;$i++){ $b[$start+$i]=0 }; [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m6
REM rem Método 6: truncar para 75%% do tamanho original
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -gt 0){$new=[int]($b.Length*0.75); if($new -lt 1)REM {$new=1}; $b=$b[0..($new-1)]; [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m7
REM rem Método 7: truncar para 50%% do tamanho original
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -gt 0){$new=[int]($b.Length*0.5); if($new -lt 1)REM {$new=1}; $b=$b[0..($new-1)]; [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m8
REM rem Método 8: acrescentar 512 bytes aleatórios no fim
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $rand=New-Object Random; $extra=New-Object byte[] 512; $rand.REM NextBytes($extra); $b=$b + $extra; [IO.File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m9
REM rem Método 9: acrescentar 2048 bytes aleatórios no fim
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $rand=New-Object Random; $extra=New-Object byte[] 2048; $rand.REM NextBytes($extra); $b=$b + $extra; [IO.File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m10
REM rem Método 10: inverter (xor) a cada 1000º byte
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); for($i=0;$i -lt $b.Length;$i+=1000){$b[$i] = $b[$i] -bxor REM 0xFF}; [IO.File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m11
REM rem Método 11: inverter 100 bytes em posições aleatórias
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$r=New-Object Random; 1..100 | REM ForEach-Object{ $i=$r.Next(0,$len); $b[$i] = $b[$i] -bxor 0xFF }; [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m12
REM rem Método 12: zerar os últimos 512 bytes
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$size=[Math]::Min(512,$len); forREM ($i=0;$i -lt $size;$i++){ $b[$len-1-$i]=0 }; [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m13
REM rem Método 13: sobrescrever bytes 8–15 com padrão crescente
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); for($i=8;$i -lt [Math]::Min(16,$b.Length);$i++){ $b[$i]=[byte]REM $i }; [IO.File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m14
REM rem Método 14: duplicar os primeiros 1024 bytes no fim
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -gt 0){$copyLen=[Math]::Min(1024,$b.Length); REM $extra=$b[0..($copyLen-1)]; $b=$b + $extra; [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m15
REM rem Método 15: inverter a ordem dos primeiros 512 bytes
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $max=[Math]::Min(512,$b.Length); if($max -gt 1){$sub=$b[0..REM ($max-1)]; [Array]::Reverse($sub); $sub.CopyTo($b,0); [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m16
REM rem Método 16: inverter a ordem dos últimos 512 bytes
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; $max=[Math]::Min(512,$len); if($max -gt 1)REM {$start=$len-$max; $sub=$b[$start..($len-1)]; [Array]::Reverse($sub); $sub.CopyTo($b,$start); [IO.File]::WriteAllBytes($p,$b)}"
REM goto :eof
REM 
REM :m17
REM rem Método 17: zerar um bloco aleatório de 256 bytes
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 0){$size=[Math]::Min(256,$len); REM $r=New-Object Random; $start=$r.Next(0,$len-$size+1); for($i=0;$i -lt $size;$i++){ $b[$start+$i]=0 }; [IO.File]::WriteAllBytes($p,REM $b)}"
REM goto :eof
REM 
REM :m18
REM rem Método 18: definir cada 10º byte como 0xFF
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); for($i=0;$i -lt $b.Length;$i+=10){ $b[$i]=0xFF }; [IO.File]REM ::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m19
REM rem Método 19: se >10000 bytes, manter apenas os últimos 10000; senão zerar o primeiro quarto
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); $len=$b.Length; if($len -gt 10000){$b=$b[($len-10000)..REM ($len-1)]} else { $q=[int]($len/4); for($i=0;$i -lt $q;$i++){ $b[$i]=0 } }; [IO.File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 
REM :m20
REM rem Método 20: zerar bytes 4–7 e 100–199 (se existirem)
REM set "FILE=%~1"
REM powershell -Command "$p='%FILE%'; $b=[IO.File]::ReadAllBytes($p); if($b.Length -ge 8){4..7   | ForEach-Object{ $b[$_]=0 }}; if($b.REM Length -ge 200){100..199 | ForEach-Object{ $b[$_]=0 }}; [IO.File]::WriteAllBytes($p,$b)"
REM goto :eof
REM 