# =============================================
# TESTE DE ADAPTABILIDADE - WINDOWS + GIMP 2.10
# =============================================

$GIMP_BIN = "C:\Program Files\GIMP 2\bin\gimp-2.10.exe"
$IMAGENS_PATH = "C:\Users\PC - U\Desktop\testes\images"
$OUT_DIR      = ".\resultados\adaptabilidade"
$LOG_DIR      = ".\resultados\logs"

# Criar pastas necessárias
New-Item -ItemType Directory -Force -Path $OUT_DIR | Out-Null
New-Item -ItemType Directory -Force -Path $LOG_DIR | Out-Null

# Arquivos de saída
$timestamp = (Get-Date).ToString("yyyyMMdd_HHmmss")
$LOG_FILE  = "$LOG_DIR\windows_log_$timestamp.txt"
$CSV_FILE  = "$LOG_DIR\adaptabilidade_windows_$timestamp.csv"

# Criar/Inicializar CSV
"imagem,resultado,tempo_ms" | Out-File -FilePath $CSV_FILE -Encoding utf8

# Função para medir desempenho
function Medir-Tempo {
    param([scriptblock]$codigo)
    $sw = [System.Diagnostics.Stopwatch]::StartNew()
    & $codigo
    $sw.Stop()
    return $sw.ElapsedMilliseconds
}

# Listar imagens
$imagens = Get-ChildItem -Path $IMAGENS_PATH -Filter *.png

$TOTAL = $imagens.Count
$FALHAS = 0

Write-Host "Processando $TOTAL arquivos..." -ForegroundColor Cyan

foreach ($img in $imagens) {
    Write-Host "→ Processando: $($img.Name)" -ForegroundColor Yellow

    $saida = Join-Path $OUT_DIR $img.Name

    $tempo = Medir-Tempo {
        try {
            $processo = Start-Process -FilePath $GIMP_BIN `
                -ArgumentList "-i -b \"(let* ((image (car (gimp-file-load RUN-NONINTERACTIVE \"$($img.FullName.Replace("\\","/"))\" \"$($img.FullName.Replace("\\","/"))\")))) (gimp-file-save RUN-NONINTERACTIVE image (car (gimp-image-get-active-layer image)) \"$($saida.Replace("\\","/"))\" \"$($saida.Replace("\\","/"))\"))\" -b \"(gimp-quit 0)\"" `
                -Wait -PassThru -ErrorAction Stop

            if ($processo.ExitCode -ne 0) { throw "Erro no processamento" }
        }
        catch {
            $global:FALHAS++
            Add-Content -Path $LOG_FILE -Value "FALHA: $($img.Name) — $_"
        }
    }

    $resultado = if ($?) { "ok" } else { "falha" }

    "$($img.Name),$resultado,$tempo" | Out-File -FilePath $CSV_FILE -Append -Encoding utf8
}

$SUCESSO = $TOTAL - $FALHAS
$TAXA = [math]::Round(($SUCESSO / $TOTAL) * 100, 2)

Write-Host "" 
Write-Host "---------------------------------------------"
Write-Host "✓ Teste Finalizado. Resumo:"
Write-Host "Arquivos Processados: $TOTAL"
Write-Host "Falhas/Crashes (M1.1): $FALHAS"
Write-Host "Taxa de Sucesso: $TAXA%"
Write-Host "---------------------------------------------"
Write-Host ""
Write-Host "CSV salvo em:"
Write-Host "$CSV_FILE"
Write-Host ""