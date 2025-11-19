# Plano de Avaliação - Quanto à Confiabilidade

## Introdução

Nesta etapa do projeto, vamos especificar como iremos implementar e executar as métricas definidas na metodologia Goal-Question-Metric (GQM) da [Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/fase2/) para avaliar objetivamente a Confiabilidade do módulo file-exr do GIMP. 

O processo de coleta e análise seguirá utilizando o próprio ambiente do GIMP para execução de casos de teste (abertura, edição e salvamento), o uso de um dataset controlado de arquivos EXR (incluindo arquivos íntegros de alta complexidade e arquivos corrompidos para injeção de falhas), além de capturas de tela e logs do sistema para evidenciar o que estará sendo testado. Por fim, serão realizados os cálculos das fórmulas definidas anteriormente para analisar os dados, garantindo a rastreabilidade e a reprodutibilidade dos resultados obtidos.

## Métricas a Serem Implementadas

Com base no planejamento da [Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/fase2/), serão coletados dados para as seguintes métricas:

<!-- Task: se quiser, colocar hiperlink para as métricas. -->
- Métrica 1.1: Taxa de Falhas (Failure Rate)
- Métrica 1.2: Tempo Médio Entre Falhas (MTBF)
- Métrica 2.1: Taxa de Sucesso sob Carga
- Métrica 2.2: Taxa de Tratamento de Entradas Inválidas
- Métrica 3.1: Taxa de Recuperação Automática
- Métrica 3.2: Tempo Médio para Reparo (MTTR)
- Métrica 3.3: Taxa de Diagnóstico (Logs)

## Ferramentas e Métodos de Coleta

### Ambiente de Teste
- **Sistema Operacional:** Windows 10/11 (64 bits)  
- **Aplicação Avaliada:** GIMP 3.0.4 com módulo `file-exr`  
- **Hardware Utilizado:**  
    - CPU: 4 núcleos  
    - Memória RAM: 8 GB  
    - Armazenamento: SSD  
- **Arquivos de Teste:**  
    - Conjunto de imagens EXR válidas (diferentes resoluções e tamanhos)  
    - Arquivos EXR corrompidos ou truncados  
    - Arquivos inválidos renomeados com extensão `.exr`  
    - EXRs de grande porte (>50 MB) para simular carga  
- **Pré-requisitos:**  
    - PowerShell 5.1 ou PowerShell 7+  
    - Acesso ao executável do GIMP  
    - Ferramentas Sysinternals (opcional para diagnóstico avançado)

---

### Instrumentos de Medição

#### Métrica 1.1 — Taxa de Falhas (Failure Rate)
- Scripts PowerShell para repetidas tentativas de abertura de arquivos.  
- Logs gerados com o comando:  
  ```powershell
  gimp-3.0.4.exe --verbose *> logs.txt
  ```
- Contador de falhas por tentativa.

#### Métrica 1.2 — Tempo Médio Entre Falhas (MTBF)
- Scripts PowerShell com registro de timestamps.
- Arquivo de coleta contendo tentativas, tempos e erros.

#### Métrica 2.1 — Taxa de Sucesso sob Carga
- Execução paralela via PowerShell 7+ com:
- Múltiplas instâncias via `Start-Process`.
- Monitoramento com:
- Resource Monitor (resmon.exe)
- Performance Monitor (perfmon.exe)

#### Métrica 2.2 — Taxa de Tratamento de Entradas Inválidas
- Criação de arquivos inválidos:
- Registro da reação do módulo `file-exr`:
- Erro tratado
- Travamento
- Mensagem inadequada

#### Métrica 3.1 — Taxa de Recuperação Automática
- Scripts que alternam arquivos válidos e inválidos.
- Verificação após falha para detectar se o GIMP continua funcional.

#### Métrica 3.2 — Tempo Médio para Reparo (MTTR)
- Medição de latência com PowerShell:
- Registro do tempo necessário para restaurar a operação.

#### Métrica 3.3 — Taxa de Diagnóstico (Qualidade dos Logs)
- Logs via `--verbose`.
- Ferramentas Sysinternals:
- Process Monitor (ProcMon)
- Process Explorer
- Classificação dos logs por tipo (erro, aviso, informativo).

---

### Passo a Passo de Coleta

Primeiro passo: **Preparação**

Organizar os arquivos em pastas:

  - `/validos/`
  
  - `/corrompidos/`
  
  - `/invalidos/`

Iniciar GIMP em modo detalhado:
  
```
gimp-3.0.4.exe --verbose *> logs.txt
```
  
Segundo passo: **Execução**

  - Para **Taxa de Falhas**: abrir automaticamente dezenas de EXRs.
  - Para **MTBF**: registrar tempos entre ocorrências de falhas.
  - Para **Carga**: abrir vários EXRs simultaneamente via PowerShell.
  - Para **Entradas Inválidas**: testar arquivos vazios, truncados e renomeados.
  - Para **Recuperação**: alternar um arquivo inválido seguido de um válido.
  - Para **MTTR**: medir tempo entre falha e operação normal.
  - Para **Diagnóstico**: analisar detalhamento das mensagens nos logs.

Terceiro passo: **Registro**

 - Consolidar resultados em arquivo CSV contendo:
   - Tipo de teste
   - Resultado (sucesso/falha)
   - Tempo medido

---

## Localização dos Dados de Avaliação
- **planilha_resultados.csv** — registro tabulado das métricas
- **Pastas de teste:**
- `validos/`
- `corrompidos/`
- `invalidos/`
- **Capturas manuais e anotações**

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|     [Arthur Evangelista](https://www.github.com/arthurevg)   |
| 1.1    | 18/11/2025 | Adição da versão inicial do Plano de Avaliação    |[Caio Venâncio](https://www.github.com/caio-venancio), [Arthur Evangelista](https://www.github.com/arthurevg)||