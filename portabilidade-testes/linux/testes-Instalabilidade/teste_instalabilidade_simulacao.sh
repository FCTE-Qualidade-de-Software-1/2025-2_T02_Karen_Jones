#!/bin/bash

# =================================================================
# CONFIGURAÇÃO DE VARIÁVEIS E SIMULAÇÃO
# =================================================================

# Diretório onde o plugin 'instalado' seria colocado (simulação)
TARGET_DIR="./simulacao_plugin_dir" 

# Nome do arquivo binário do plugin (simulação)
PLUGIN_BIN="file-exr.so" 

# Diretório para Logs e Resultados
LOGS_DIR="./resultados/logs/install_linux"
CSV_OUT="./resultados/instalabilidade/dados_instalabilidade_ubuntu_$(date +%Y%m%d_%H%M%S).csv"

# Número de Repetições conforme Plano de Avaliação (Fase 3)
NUM_REPETICOES=10

# Variáveis de Contagem (Métricas 2.1 e 2.2)
SUCESSO_INSTALACAO=0
SUCESSO_DESINSTALACAO=0

# =================================================================
# FUNÇÃO DE CRONOMETRAGEM EM MILISSEGUNDOS
# =================================================================
get_ms() {
    date +%s%3N
}

# =================================================================
# FUNÇÃO DE EXECUÇÃO DO CICLO
# =================================================================

executar_ciclo() {
    local CICLO_NUM=$1
    local TEMPO_INSTAL_MS=0
    local TEMPO_DESINSTAL_MS=0
    local INSTAL_STATUS="FALHA"
    local DESINSTAL_STATUS="FALHA"
    
    local LOG_FILE="$LOGS_DIR/ciclo_${CICLO_NUM}.log"
    local FULL_PATH="$TARGET_DIR/$PLUGIN_BIN"

    echo "--- INICIANDO CICLO $CICLO_NUM DE $NUM_REPETICOES ---" | tee "$LOG_FILE"
    
    # --- 1. INSTALAÇÃO (Métrica 2.1 e M3.3) ---
    echo "$(date +%Y-%m-%d_%H:%M:%S.%3N) [INSTALACAO] Iniciando simulação..." | tee -a "$LOG_FILE"
    local START_INSTALL=$(get_ms)
    
    # SIMULAÇÃO: Criação de arquivo dummy (0 bytes) e cópia para o destino
    touch "$PLUGIN_BIN"
    cp "$PLUGIN_BIN" "$TARGET_DIR/" 2>&1 | tee -a "$LOG_FILE"
    
    local INSTALL_EXIT=$?
    
    local END_INSTALL=$(get_ms)
    TEMPO_INSTAL_MS=$((END_INSTALL - START_INSTALL))
    
    if [ $INSTALL_EXIT -eq 0 ] && [ -f "$FULL_PATH" ]; then
        INSTAL_STATUS="SUCESSO"
        SUCESSO_INSTALACAO=$((SUCESSO_INSTALACAO + 1))
    fi
    echo "$(date +%Y-%m-%d_%H:%M:%S.%3N) [INSTALACAO] Fim. Status: $INSTAL_STATUS. Tempo: ${TEMPO_INSTAL_MS}ms" | tee -a "$LOG_FILE"

    # --- 2. DESINSTALAÇÃO (Métrica 2.2 e M3.3) ---
    echo "$(date +%Y-%m-%d_%H:%M:%S.%3N) [DESINSTALACAO] Iniciando simulação..." | tee -a "$LOG_FILE"
    local START_UNINSTALL=$(get_ms)
    
    # SIMULAÇÃO: Remoção do arquivo do diretório de destino
    rm "$FULL_PATH" 2>&1 | tee -a "$LOG_FILE"
    
    local UNINSTALL_EXIT=$?

    local END_UNINSTALL=$(get_ms)
    TEMPO_DESINSTAL_MS=$((END_UNINSTALL - START_UNINSTALL))

    if [ $UNINSTALL_EXIT -eq 0 ] && [ ! -f "$FULL_PATH" ]; then
        DESINSTAL_STATUS="SUCESSO"
        SUCESSO_DESINSTALACAO=$((SUCESSO_DESINSTALACAO + 1))
    fi
    echo "$(date +%Y-%m-%d_%H:%M:%S.%3N) [DESINSTALACAO] Fim. Status: $DESINSTAL_STATUS. Tempo: ${TEMPO_DESINSTAL_MS}ms" | tee -a "$LOG_FILE"

    # --- REGISTRO NO CSV ---
    echo "$CICLO_NUM;INSTALACAO;$INSTAL_STATUS;$TEMPO_INSTAL_MS" >> "$CSV_OUT"
    echo "$CICLO_NUM;DESINSTALACAO;$DESINSTAL_STATUS;$TEMPO_DESINSTAL_MS" >> "$CSV_OUT"

    echo "--- CICLO $CICLO_NUM CONCLUÍDO ---"
}

# =================================================================
# EXECUÇÃO PRINCIPAL
# =================================================================

# Preparações iniciais
mkdir -p "$LOGS_DIR"
mkdir -p "$(dirname "$CSV_OUT")"
mkdir -p "$TARGET_DIR"

# Cabeçalho do CSV
echo "Ciclo;Operacao;Status;Tempo_ms" > "$CSV_OUT"

echo "Iniciando Teste de Instalabilidade SIMULADO em Ubuntu. Total de $NUM_REPETICOES ciclos."

# Loop de 10 repetições
for (( i=1; i<=$NUM_REPETICOES; i++ ))
do
    executar_ciclo $i
done

# Limpeza e Relatório Final
rm "$PLUGIN_BIN" 2>/dev/null
rmdir "$TARGET_DIR" 2>/dev/null

TAXA_INSTAL=$(awk "BEGIN {printf \"%.2f\", ($SUCESSO_INSTALACAO / $NUM_REPETICOES) * 100}")
TAXA_DESINSTAL=$(awk "BEGIN {printf \"%.2f\", ($SUCESSO_DESINSTALACAO / $NUM_REPETICOES) * 100}")

echo "--------------------------------------------------------"
echo "✅ Teste de Instalabilidade (SIMULADO) Concluído (Ubuntu)."
echo "Sucesso na Instalação (M2.1/M3.1): ${TAXA_INSTAL}%"
echo "Sucesso na Desinstalação (M2.2): ${TAXA_DESINSTAL}%"
echo "Dados de Tempo (M3.3) brutos em: $CSV_OUT"
echo "--------------------------------------------------------"