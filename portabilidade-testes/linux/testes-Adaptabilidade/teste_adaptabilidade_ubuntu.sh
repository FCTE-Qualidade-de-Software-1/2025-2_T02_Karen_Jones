#!/bin/bash

# =================================================================
# CONFIGURAÇÃO DE CAMINHOS
# =================================================================

# ⚠️ CAMINHO AJUSTADO: Usa o diretório 'images' dentro da pasta 'testes'
INPUT_DIR="./images" 

# Diretório onde os arquivos processados serão salvos
OUTPUT_DIR="./resultados/adaptabilidade/ubuntu_output"

# Arquivo de Saída CSV: Contém o resultado de cada execução (M1.1 e M1.2)
CSV_OUT="./resultados/adaptabilidade/dados_ubuntu_$(date +%Y%m%d_%H%M%S).csv"

# Log detalhado
LOG_FILE="./resultados/logs/ubuntu_log_$(date +%Y%m%d_%H%M%S).txt"

# Binário do GIMP (assume-se que está no PATH)
GIMP_BIN="gimp" 

# Variáveis de Contagem
FALHAS=0
TOTAL_ARQUIVOS=0

# =================================================================
# FUNÇÃO DE CRONOMETRAGEM EM MILISSEGUNDOS
# =================================================================
# Obtém o tempo atual em milissegundos para precisão (Métrica 1.2)
get_ms() {
    # Usamos o comando 'date' com formato de milissegundos (%3N)
    date +%s%3N
}

# =================================================================
# FUNÇÃO DE PROCESSAMENTO BATCH (por arquivo)
# =================================================================

processar_imagem() {
    local ARQUIVO_ENTRADA="$1"
    local NOME_BASE=$(basename "$ARQUIVO_ENTRADA" .exr)
    local ARQUIVO_SAIDA="$OUTPUT_DIR/${NOME_BASE}_edited.exr"
    local OP="open_edit_save"
    
    echo "--- Processando: $ARQUIVO_ENTRADA" >> "$LOG_FILE"

    # --- INÍCIO DA CRONOMETRAGEM ---
    local START_MS=$(get_ms)
    local HORARIO_COMECO=$(date +%Y-%m-%d_%H:%M:%S.%3N)

    # Comando BATCH: Abre, aplica ajuste de níveis (edição mínima) e salva.
    # O GIMP usará o plugin file-exr padrão/instalado.
    "$GIMP_BIN" -i -b "(let* ((image (car (gimp-file-load RUN-NONINTERACTIVE \"$ARQUIVO_ENTRADA\" \"$ARQUIVO_ENTRADA\"))) (drawable (car (gimp-image-get-active-layer image)))) (gimp-levels-auto drawable) (gimp-file-save RUN-NONINTERACTIVE image drawable \"$ARQUIVO_SAIDA\" \"$ARQUIVO_SAIDA\") (gimp-image-delete image))" -b "(gimp-quit 0)" 2>> "$LOG_FILE" 

    local STATUS=$? # Captura o código de saída do GIMP (Métrica 1.1)

    # --- FIM DA CRONOMETRAGEM ---
    local END_MS=$(get_ms)
    local HORARIO_FIM=$(date +%Y-%m-%d_%H:%M:%S.%3N)

    local TEMPO_MS=$((END_MS - START_MS))
    
    local RESULTADO="SUCESSO"
    if [ $STATUS -ne 0 ]; then
        RESULTADO="FALHA (CRASH ou Exit Code: $STATUS)"
        FALHAS=$((FALHAS + 1))
        echo "🚨 $RESULTADO para $ARQUIVO_ENTRADA" >> "$LOG_FILE"
    fi

    # Gravação no CSV
    echo "$ARQUIVO_ENTRADA;$OP;$HORARIO_COMECO;$HORARIO_FIM;$TEMPO_MS;$RESULTADO" >> "$CSV_OUT"

    return 0
}

# =================================================================
# EXECUÇÃO PRINCIPAL
# =================================================================

# Preparação de diretórios
mkdir -p "$OUTPUT_DIR"
mkdir -p "$(dirname "$LOG_FILE")"
mkdir -p "$(dirname "$CSV_OUT")"

# Cabeçalho do CSV
echo "arquivo;operacao;horario_comeco;horario_fim;tempo_ms;resultado" > "$CSV_OUT"

echo "Iniciando Teste de Adaptabilidade (Ubuntu)."
echo "Logs em: $LOG_FILE"
echo "CSV em: $CSV_OUT"

# Loop sobre os arquivos .exr no diretório 'images'
for ARQUIVO in "$INPUT_DIR"/*.exr; do
    if [ -f "$ARQUIVO" ]; then
        TOTAL_ARQUIVOS=$((TOTAL_ARQUIVOS + 1))
        processar_imagem "$ARQUIVO"
    fi
done

# Consolidação Final e Relatório (M1.1)
SUCESSOS=$((TOTAL_ARQUIVOS - FALHAS))
if [ $TOTAL_ARQUIVOS -gt 0 ]; then
    TAXA_SUCESSO=$(awk "BEGIN {printf \"%.2f\", ($SUCESSOS / $TOTAL_ARQUIVOS) * 100}")
else
    TAXA_SUCESSO=0
fi

echo "--------------------------------------------------------" 
echo "✅ Teste Finalizado. Resumo:"
echo "Arquivos Processados: $TOTAL_ARQUIVOS"
echo "Falhas/Crashes (M1.1): $FALHAS"
echo "Taxa de Sessões Livres de Falhas (M1.1): ${TAXA_SUCESSO}%"
echo "--------------------------------------------------------"
echo "O tempo total para M1.2 (Desempenho) deve ser calculado somando a coluna 'tempo_ms' no CSV gerado em: $CSV_OUT"