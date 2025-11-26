# Plano de Avaliação - Quanto à Portabilidade

## Introdução

Nesta etapa do projeto, vamos especificar como iremos implementar e executar as métricas definidas na metodologia Goal-Question-Metric (GQM) da fase anterior ([Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/3-portabilidade/)) para avaliar objetivamente a **Portabilidade** do módulo `file-exr` do GIMP.

O processo de coleta e análise focará na capacidade do módulo de ser executado, instalado e adaptado em diferentes ambientes. Serão utilizados ambientes virtualizados e nativos (Windows e Linux) para comparar o comportamento funcional e de desempenho. Além disso, serão realizados testes de instalação/desinstalação e tentativas controladas de substituição de dependências (bibliotecas `OpenEXR`) para mensurar o esforço de adaptação.

## Métricas a Serem Implementadas

Com base no planejamento da fase anterior ([Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/3-portabilidade/)), serão coletados dados para as seguintes métricas de Adaptabilidade, Instalabilidade e Substituibilidade:

| ID | Métrica | Atributo de Qualidade |
| :--- | :--- | :--- |
| **1.1** | Taxa de Sessões Livres de Falhas entre Plataformas | Adaptabilidade |
| **1.2** | Desvio de Desempenho entre diferentes plataformas | Adaptabilidade |
| **2.1** | Taxa de Sucesso na Instalação | Instalabilidade |
| **2.2** | Taxa de Sucesso na Desinstalação | Instalabilidade |
| **3.1** | Taxa de Sucesso de Instalação por Ambiente | Instalabilidade |
| **3.2** | Desvio Relativo de Sucesso entre Ambientes | Instalabilidade |
| **3.3** | Diferença no Tempo e Tipos de Falha entre Ambientes | Instalabilidade |
| **4.1** | Taxa de Compatibilidade com Versões Alternativas | Substituibilidade |
| **4.2** | Esforço de Adaptação para Novas Dependências | Substituibilidade |
| **4.3** | Taxa de Sucesso em Testes após Substituição | Substituibilidade |

## Ferramentas e Métodos de Coleta

### Ambiente de Teste

Para garantir a análise de portabilidade, os testes serão executados em pelo menos dois ambientes distintos, conforme detalhado abaixo:

| Categoria | Ambiente A (Principal) | Ambiente B (Secundário) | Artefatos Comuns |
| :--- | :--- | :--- | :--- |
| **S.O.** | Windows 10/11 (64 bits) | Linux (Ubuntu 22.04 LTS ou Fedora via WSL/VirtualBox) | Código fonte do GIMP (branch estável) |
| **Ferramentas** | PowerShell, MSYS2/MinGW (para compilação) | Bash, GCC, Make/CMake | Dependências do `OpenEXR` (versões padrão e alternativas) |
| **Hardware** | CPU 4 núcleos, 8GB RAM | Virtualizado com recursos similares ao Ambiente A (ou nativo se disponível) | Dataset de imagens `.exr` para validação de funcionamento |

### Instrumentos de Medição

O processo de medição para cada métrica será conduzido com os seguintes instrumentos e métodos de coleta de dados:

| Métrica(s) | Atributo | Instrumento/Método | Dados Coletados |
| :--- | :--- | :--- | :--- |
| **1.1 e 1.2** | Adaptabilidade (Falhas e Desempenho) | Script de Execução Cruzada (PowerShell/Bash) | Contagem de *crashes*/erros de execução; Medição de tempo de processamento (`time`, `Measure-Command`). |
| **2.1, 2.2, 3.1, 3.2, 3.3** | Instalabilidade | Scripts de Build Automatizado (`./configure`, `make`), Coleta de Logs, Cronometragem. | Logs de saída (`stderr`, `stdout`); Tempo exato de instalação/desinstalação; Status de Sucesso/Falha. |
| **4.1, 4.2 e 4.3** | Substituibilidade (Dependências) | Controle de Versão (Git), Registro de Tempo Humano, Suite de Testes de Regressão. | Linhas de código modificadas (`git diff --stat`); Horas gastas pela equipe na adaptação; Taxa de Sucesso dos testes funcionais. |

### Passo a Passo de Coleta

Primeiro passo: **Preparação dos Ambientes**
1. Configurar o ambiente Windows com as dependências necessárias.
2. Configurar a VM/WSL Linux com as dependências necessárias.
3. Clonar o repositório e separar as versões da biblioteca `openexr` a serem testadas.

Segundo passo: **Execução (Iterar nos Ambientes A e B)**
1. **Instalação:** Rodar script de build/install 10 vezes em cada ambiente. Registrar sucessos, falhas e tempos.
2. **Adaptabilidade:** Rodar bateria de testes com 18 imagens `.exr`. Registrar se houve crash e o tempo total da operação.
3. **Desinstalação:** Rodar comando de desinstalação. Verificar se o binário foi removido.

Terceiro passo: **Teste de Substituibilidade (Apenas Ambiente de Desenvolvimento)**
1. Alterar a referência da biblioteca `openexr` para uma versão alternativa.
2. Tentar compilar. Se falhar, corrigir o código.
3. Registrar o tempo gasto e usar `git diff` para medir o esforço (linhas alteradas).
4. Rodar os testes funcionais com a nova biblioteca.

Quarto passo: **Consolidação**
- Preencher a planilha `resultados_portabilidade.csv` comparando os dados do Ambiente A vs. Ambiente B.

## Localização dos Dados de Avaliação

| Artefato | Conteúdo | Finalidade |
| :--- | :--- | :--- |
| **planilha_portabilidade.csv** | Tabela comparativa de resultados, incluindo tempos e status. | Consolidação dos resultados das métricas 1.2, 2.1, 2.2, 3.x. |
| **Pastas de Logs** | Saídas de `stderr` e `stdout` dos processos de build. | Análise das **Diferenças no Tempo e Tipos de Falha** (Métrica 3.3). |
| `/logs_windows/install_logs/` | Logs de instalação no Ambiente A. | |
| `/logs_linux/install_logs/` | Logs de instalação no Ambiente B. | |
| `/logs_replaceability/diffs/` | Saída de `git diff --stat`. | Mensurar o **Esforço de Adaptação** (Métrica 4.2). |
| **Relatório de Adaptação** | Documento de texto. | Descreve as dificuldades encontradas na troca de versão da biblioteca (Métrica 4.2). |

### **Histórico de Versão**

| Versão | Data | Descrição | Autor | Revisor |
| :--- | :--- | :--- | :--- | :--- |
| 1.0 | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio) | [Vinicius Castelo](https://github.com/Vini47) |
| 2.0 | 19/11/2025 | Adicionado informações ao Documento | [Vinicius Castelo](https://github.com/Vini47) | [Caio Venâncio](https://www.github.com/caio-venancio) |