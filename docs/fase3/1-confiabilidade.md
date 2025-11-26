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

## Ferramentas e Métodos de Coleta

### Ambiente de Teste
- **Sistema Operacional:** Windows 10/11 (64 bits)  
- **Aplicação Avaliada:** GIMP 3.0.6 com módulo `file-exr`  
- **Hardware Utilizado:**  
    - CPU: 4 núcleos  
    - Memória RAM: 8 GB  
    - Armazenamento: SSD  
- **Arquivos de Teste:**  
    - Conjunto de imagens EXR válidas (diferentes resoluções e tamanhos)  
    - Arquivos EXR corrompidos ou truncados   
- **Pré-requisitos:**  
    - cmd.exe com versão a partir do Windows 7
    - Acesso ao executável do GIMP com gimp-console-3.0.exe disponível

---

### Instrumentos de Medição

#### Métrica 1.1 — Taxa de Falhas (Failure Rate)
- Criação de arquivos válidos a partir de site oficial de arquivos variados do OpenEXR [[2]](#REF2).
- Execução de script `tests/scripts/run-open-exr3.bat` por 10 horas ou mais para satisfazer métrica.
- Contabilização de arquivos `.csv` e `.log`.

#### Métrica 1.2 — Tempo Médio Entre Falhas (MTBF)
- Criação de arquivos válidos a partir de site oficial de arquivos variados do OpenEXR [[2]](#REF2).
- Execução de script `tests/scripts/run-open-exr3.bat` por 10 horas ou mais para satisfazer métrica.
- Contabilização de arquivos `.csv` e `.log`.

#### Métrica 2.1 — Taxa de Sucesso sob Carga
- Criação de arquivos válidos a partir de site oficial de arquivos variados do OpenEXR [[2]](#REF2).
- Execução de script `tests/scripts/run-open-exr3.bat` por 10 horas ou mais para satisfazer métrica.
- Contabilização de arquivos `.csv` e `.log`.

#### Métrica 2.2 — Taxa de Tratamento de Entradas Inválidas
- Criação de arquivos inválidos atravéis de script disponível em `tests/scripts/run-corrompido2.bat`
- Uso de arquivos inválidos no módulo `file-exr`
- Análise da reação do módulo `file-exr`(erro tratado, travamento, etc):


#### Métrica 3.1 — Taxa de Recuperação Automática
- Uso de arquivos válidos e inválidos.
- Verificação após `simulação de falha` para detectar se o GIMP continua funcional e retornouu ao estado que estava antes do crash.

#### Métrica 3.2 — Tempo Médio para Reparo (MTTR)
- Simulação de Falhas durante uma tarefa:
- Registro do tempo necessário para restaurar a tarefa.

---

### Passo a Passo de Coleta

Primeiro passo: **Preparação**

Organizar os arquivos em pastas:

  - `/validos/`
  
  - `/corrompidos/`

Iniciar scripts a partir da pasta `tests` no terminal do Windows:
  
```
.\scripts\run-open-exr3.bat *> .\logs\run.log
```
  
Segundo passo: **Execução**

Executar via script:

  - Para **Taxa de Falhas**: abrir automaticamente dezenas de EXRs.
  - Para **MTBF**: registrar tempos entre ocorrências de falhas.
  - Para **Carga**: abrir vários EXRs simultaneamente via terminal.

  Executar manualmente:

  - Para **Entradas Inválidas**: testar arquivos vazios, truncados, renomeados, etc.
  - Para **Recuperação**: alternar arquivos válidos e inválidos.
  - Para **MTTR**: medir tempo entre falha e a recuperação da operação.

Terceiro passo: **Registro**

Contabilizar resultados de arquivo CSV e LOG contendo:

   - Quantidade de operações
   - Quantidade de falhas
   - Tempo medido

---

## Localização dos Dados de Avaliação
- **Pastas de resultados:** <br>`tests/resultados` e `tests/logs`— registro tabulado das execuções em `.csv` e saída do terminal em `.log`
- **Pastas de arquivos teste:** <br>
  `tests/validos/`, `tests/corrompidos/` — pasta contendo arquivos da extensão `.exr`
- **Pastas de scripts:**
  `tests/scripts/` — responsável pelos arquivos `.bat` para execução e criação de arquivos corrompidos.
- **Capturas manuais e anotações** <br> - Presente no documento em forma de imagens, links para vídeos, documentos, etc.

## Referências

<a id="REF1">1.</a> GIMP. GIMP — Manual da Ferramenta em Linha de Comando (gimp man page). Disponível em: https://www.gimp.org/man/gimp.html
. Acesso em: 25 nov. 2025.

<a id="REF2">2.</a> OPENEXR. OpenEXR Test Images — Official Test Suite. Disponível em: https://openexr.com/en/latest/test_images/index.html
. Acesso em: 25 nov. 2025.

<a id="REF3">3.</a> GIMP DOCUMENTATION TEAM. Starting GIMP — Launching the Application. GIMP Documentation 3.0. Disponível em: https://docs.gimp.org/3.0/en/gimp-fire-up.html
. Acesso em: 25 nov. 2025.

<a id="REF4">4.</a> GIMP DOCUMENTATION TEAM. Script-Fu Tutorial: Writing Your First Script. GIMP Documentation 3.0. Disponível em: https://docs.gimp.org/3.0/en/gimp-using-script-fu-tutorial-first-script.html
. Acesso em: 25 nov. 2025.

<a id="REF5">5.</a> GIMP DEVELOPER DOCUMENTATION. Script-Fu Programmer’s Reference. Disponível em: https://testing.developer.gimp.org/resource/script-fu/programmers-reference
. Acesso em: 25 nov. 2025.

<a id="REF6">6.</a> GIMP DEVELOPER DOCUMENTATION. Script-Fu Tools and Resources. Disponível em: https://testing.developer.gimp.org/resource/script-fu/scriptfu-tools/
. Acesso em: 25 nov. 2025.

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|     [Arthur Evangelista](https://www.github.com/arthurevg)   |
| 1.1    | 18/11/2025 | Adição da versão inicial do Plano de Avaliação    |[Caio Venâncio](https://www.github.com/caio-venancio), [Arthur Evangelista](https://www.github.com/arthurevg)||
| 1.2    | 24/11/2025 | Adicionar referências. | [Caio Venâncio](https://www.github.com/caio-venancio)|     [Arthur Evangelista](https://www.github.com/arthurevg)   |
| 1.3    | 24/11/2025 | Correções após verificar alguns problemas na Fase 4 |[Arthur Evangelista](https://www.github.com/arthurevg) |   [Caio Venâncio](https://www.github.com/caio-venancio)     |
| 1.4  | 24/11/2025 | Novas Correções após verificar alguns problemas na Fase 4 |[Caio Venâncio](https://www.github.com/caio-venancio) | [Arthur Evangelista](https://www.github.com/arthurevg) |