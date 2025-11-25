# Plano de Avaliação - Quanto à Portabilidade

## Introdução

Nesta etapa do projeto, vamos especificar como iremos implementar e executar as métricas definidas na metodologia Goal-Question-Metric (GQM) da fase anterior ([Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/3-portabilidade/))para avaliar objetivamente a **Portabilidade** do módulo `file-exr` do GIMP.

O processo de coleta e análise focará na capacidade do módulo de ser executado, instalado e adaptado em diferentes ambientes. Serão utilizados ambientes virtualizados e nativos (Windows e Linux) para comparar o comportamento funcional e de desempenho. Além disso, serão realizados testes de instalação/desinstalação e tentativas controladas de substituição de dependências (bibliotecas `OpenEXR`) para mensurar o esforço de adaptação.

## Métricas a Serem Implementadas

Com base no planejamento da fase anterior ([Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/3-portabilidade/)), serão coletados dados para as seguintes métricas de Adaptabilidade, Instalabilidade e Substituibilidade:

- **Métrica 1.1:** Taxa de Sessões Livres de Falhas entre Plataformas
- **Métrica 1.2:** Desvio de Desempenho entre diferentes plataformas
- **Métrica 2.1:** Taxa de Sucesso na Instalação
- **Métrica 2.2:** Taxa de Sucesso na Desinstalação
- **Métrica 3.1:** Taxa de Sucesso de Instalação por Ambiente
- **Métrica 3.2:** Desvio Relativo de Sucesso entre Ambientes
- **Métrica 3.3:** Diferença no Tempo e Tipos de Falha entre Ambientes
- **Métrica 4.1:** Taxa de Compatibilidade com Versões Alternativas
- **Métrica 4.2:** Esforço de Adaptação para Novas Dependências
- **Métrica 4.3:** Taxa de Sucesso em Testes após Substituição

## Ferramentas e Métodos de Coleta

### Ambiente de Teste

Para garantir a análise de portabilidade, os testes serão executados em pelo menos dois ambientes distintos:

**Ambiente A (Principal):**
- **Sistema Operacional:** Windows 10/11 (64 bits)
- **Ferramentas:** PowerShell, MSYS2/MinGW (para compilação).
- **Hardware:** CPU 4 núcleos, 8GB RAM.

**Ambiente B (Secundário):**
- **Sistema Operacional:** Linux (Ubuntu 22.04 LTS ou Fedora via WSL/VirtualBox)
- **Ferramentas:** Bash, GCC, Make/CMake.
- **Hardware:** Virtualizado com recursos similares ao Ambiente A (ou nativo se disponível).

**Artefatos Comuns:**
- Código fonte do GIMP (branch estável).
- Dependências do `OpenEXR` (versões padrão e alternativas).
- Dataset de imagens `.exr` para validação de funcionamento.

### Instrumentos de Medição

#### Métrica 1.1 e 1.2 — Adaptabilidade (Falhas e Desempenho)
- **Script de Execução Cruzada:** Um script (adaptado para PowerShell no Windows e Bash no Linux) que abre, edita e salva um lote de arquivos `.exr`.
- **Instrumentação:**
    - Contagem de *crashes* ou erros de execução em cada OS.
    - Medição de tempo de processamento (via `Measure-Command` no Windows e `time` no Linux) para calcular o desvio de desempenho.

#### Métrica 2.1, 2.2, 3.1, 3.2 e 3.3 — Instalabilidade
- **Scripts de Build Automatizado:** Scripts que executam a configuração (`./configure` ou `cmake`), compilação (`make`) e instalação (`make install`) apenas do módulo `file-exr`.
- **Coleta de Logs:** Redirecionamento da saída padrão e de erro (`stderr`, `stdout`) para arquivos de texto.
- **Cronometragem:** Registro do tempo exato desde o início até o fim do processo de instalação em cada ambiente para cálculo da *Diferença de Tempo*.

#### Métrica 4.1, 4.2 e 4.3 — Substituibilidade (Dependências)
- **Controle de Versão (Git):** Utilização do `git diff --stat` para contar linhas de código modificadas (**Métrica 4.2**) ao tentar compilar o módulo com uma versão diferente da biblioteca `libopenexr` (ex: migrar da v2.x para v3.x).
- **Registro de Tempo Humano:** Anotação manual das horas gastas pela equipe para adaptar o código.
- **Suite de Testes de Regressão:** Execução do script de teste funcional após a troca da biblioteca para verificar a *Taxa de Sucesso* (**Métrica 4.3**).

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

- **planilha_portabilidade.csv** — Tabela comparativa entre OSs e registros de tempos.
- **Pastas de Logs:**
    - `/logs_windows/install_logs/`
    - `/logs_linux/install_logs/`
    - `/logs_replaceability/diffs/`
- **Relatório de Adaptação:** Documento de texto descrevendo as dificuldades encontradas na troca de versão da biblioteca se houver.

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor                                          | Revisor                                        |
| :----- | :--------- | :------------------------------------------------ | :--------------------------------------------- | :--------------------------------------------- |
| 1.0    | 13/11/2025 | Criação do Documento.                             | [Caio Venâncio](https://www.github.com/caio-venancio) | [Vinicius Castelo](https://github.com/Vini47)  |
| 2.0    | 19/11/2025 | Adicionado informações ao Documento (Portabilidade). | [Vinicius Castelo](https://github.com/Vini47)  | [Caio Venâncio](https://www.github.com/caio-venancio) |