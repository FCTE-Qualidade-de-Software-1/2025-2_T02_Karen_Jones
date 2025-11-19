# Execução do Plano de Avaliação - Quanto à Compatibilidade

A Fase 4 consiste na aplicação rigorosa dos roteiros definidos na [Fase 3](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase3/2-compatibilidade/), o que transforma as métricas abstratas em dados quantitativos e evidências concretas. Com isso, é possível validar ou refutar as hipóteses levantadas para as subcaracterísticas de Interoperabilidade, Coexistência, Estabilidade e Arquitetura do módulo `file-exr`.

## A. Execução do Teste de Interoperabilidade (Q1)

O teste de Interoperabilidade (*Round-Trip*) verifica a capacidade do GIMP de preservar as informações críticas do formato OpenEXR (como canais *Multilayer* e metadados) ao trocar arquivos com os *softwares* de referência Blender e Krita.

### 1. Procedimento Executado

A execução foi realizada integralmente no ambiente **Linux (Ubuntu 22.04 LTS)**, utilizando as versões mais recentes do Blender (produtor/validador) e Krita (validador). O procedimento seguiu rigorosamente o roteiro de 6 passos detalhado na [Fase 3](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase3/2-compatibilidade/).

**Dessa forma, as seguintes ações foram concluídas:**

* **Criação da Amostra (Baseline):** Utilizou-se o Blender para renderizar 5 arquivos `.exr` de alta qualidade, contendo canais AOV (Arbitrary Output Variables, ou Multilayers) além dos canais RGB padrão. Estes arquivos foram salvos como *Baseline*.
* **Round-Trip:** Cada um dos 5 arquivos foi importado no GIMP 3.0.4. Foi realizada uma alteração mínima (ajuste de níveis) e, em seguida, os arquivos foram exportados, gerando 5 arquivos de saída.
* **Validações:** Os 5 arquivos de saída foram submetidos à validação no Blender e no Krita. Sendo assim, o teste gerou 10 validações totais (5 arquivos * 2 softwares).

### 2. Medição (Dados Coletados)

A **Tabela 1** registra o resultado detalhado de cada validação, classificando-a como **Sucesso** (o arquivo abriu e preservou todos os dados críticos) ou **Defeito** (houve perda de dados, *crash* ou falha na leitura).


**Tabela 1:** Resultados do Round-Trip GIMP (OpenEXR)


| ID Arquivo | GIMP -> Blender | GIMP -> Krita | Resultado da Validação | Defeito Encontrado (Se Houve) |
| :--- | :--- | :--- | :--- | :--- |
| **A1** | | | | |
| **A2** | | | | |
| **A3** | | | | |
| **A4** | | | | |
| **A5** | | | | |
| **Totais** | **X Sucessos / Y Defeitos** (10 validações) | | | |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

#### Cálculos das Métricas (M1.1 e M1.2)

Com base nos dados coletados (10 validações e 3 defeitos), calculamos a Taxa de Sucesso Funcional (TSF) e a Densidade de Defeitos por Teste (DDT):

| Métrica | Fórmula | Valor Calculado | Critério de Aceitação (H1) |
| :--- | :--- | :--- | :--- |
| **M1.1: TSF** | (Nº de Casos de Intercâmbio Sucedidos / Nº Total de Casos de Intercâmbio Testados) * 100 |  |  |
| **M1.2: DDT** | Nº de Defeitos de Interoperabilidade / Nº Total de Casos de Teste Executados |  |  |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

### 3. Análise e Julgamento

A análise dos resultados confronta os valores calculados com a **Hipótese (H1)** e a **Questão (Q1)** de Interoperabilidade.

#### Resposta à Q1 e Julgamento da Hipótese

A **Hipótese (H1)** ("O módulo apresentará alta fidelidade de intercâmbio, com TSF elevada e DDT baixo") foi **REFUTADA** pela métrica TSF, mas **CONFIRMADA** pela métrica DDT.

#### Achados e Melhorias Específicas


### 🎥 Evidência em Vídeo 




### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|   [Larissa Stéfane](https://github.com/SkywalkerSupreme)      |
| 1.1    | 17/11/2025 | Adição das tabelas e textos | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |       |
