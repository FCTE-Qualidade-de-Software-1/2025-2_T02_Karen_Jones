# Execução do Plano de Avaliação - Quanto à Compatibilidade

A Fase 4 consiste na aplicação rigorosa dos roteiros definidos na [Fase 3](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase3/2-compatibilidade/), o que transforma as métricas abstratas em dados quantitativos e evidências concretas. Com isso, é possível validar ou refutar as hipóteses levantadas para as subcaracterísticas de Interoperabilidade, Coexistência, Estabilidade e Arquitetura do módulo `file-exr`.

## A. Execução do Teste de Interoperabilidade (Q1)

O teste de Interoperabilidade (*Round-Trip*) verifica a capacidade do GIMP de preservar as informações críticas do formato OpenEXR (como canais *Multilayer* e metadados) ao trocar arquivos com os *softwares* de referência Blender e Krita.

## 1. Procedimento de Execução (Round-Trip)

O teste de Interoperabilidade foi dividido em quatro etapas principais, realizadas no ambiente Linux (Ubuntu) ao utilizar **cinco arquivos de teste** (A1 a A5), o que totalizou **10 validações** (5 arquivos x Blender + 5 arquivos x Krita).

### Softwares e Papéis

Para esta execução, foram utilizados três *softwares* essenciais, cada um com um papel específico no teste:

* **Blender (Produtor/Validador):** É um *software* de modelagem 3D, utilizado para **gerar os arquivos EXR** com as camadas secretas (Depth/Mist) e, posteriormente, para **validar** se o GIMP preservou essas camadas.
* **GIMP (Objeto de Teste):** É o *software* sob avaliação. Sua função foi **abrir o arquivo, processá-lo** (com a edição mínima de Níveis) e **exportá-lo**.
* **Krita (Validador):** É um *software* de pintura digital, utilizado como o **segundo validador** independente para verificar a interoperabilidade, conferindo a presença das camadas no painel *Layers*.

### 1ª Etapa: Criação dos Arquivos (Blender)

**Descrição:** Nesta etapa, foi utilizado o Blender para criar os cinco arquivos **Baseline** (`Baseline_A[X].exr`). Assim,  o procedimento envolveu a modelagem de formas 3D e a aplicação de cores diferentes (Azul, Vermelho, Verde, Roxo e Amarelo). Contudo, o passo mais importante foi a **ativação manual das camadas críticas Depth e Mist** nas configurações do Blender (*View Layer*), o que garantiu que os arquivos contivessem os dados que o GIMP deveria preservar.

O vídeo 1 mostra a execução desta etapa:

<iframe width="1264" height="711" src="https://www.youtube.com/embed/4hVNQXLNN5U" title="Teste 01 - Compatibilidade: Criação dos arquivos" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


Abaixo há as captura de tela da etapa: 

<details>
  <summary size="20"><b> Imagens da execução da etapa 1 </b></summary> 

<div align="center">
    Figura 1: Criação das formas
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print01_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 2: Adição das camadas do EXR
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print02_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

  </details>

  
### 2ª Etapa: Edição dos Arquivos no GIMP*

**Descrição:** Esta etapa teve o objtivo de simular o uso real do GIMP no *pipeline* de trabalho por um usuário que utiliza um arquivo EXR. Cada um dos cinco arquivos *Baseline* criados foi aberto no GIMP, e uma edição mínima nos **Níveis de Cor** foi aplicada para forçar o processamento, e o arquivo foi exportado com a adição de **Editada** no nome.

O vídeo 2 mostra a execução desta etapa:

<iframe width="1264" height="711" src="https://www.youtube.com/embed/B2qLxAKBMSA" title="Teste 01 - Compatibilidade: Edição dos arquivos no GIMP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

Abaixo há as captura de tela da etapa: 

<details>
  <summary size="20"><b> Imagens da execução da etapa 2 </b></summary> 

<div align="center">
    Figura 3: 
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print01_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>







### Softwares e Papéis

* **Blender (Produtor/Validador):** É o *software* que gerou os arquivos EXR com as camadas secretas (**Depth/Mist**) e que serviu para a **primeira validação** do arquivo de saída.
* **GIMP (Objeto de Teste):** Responsável por **abrir o arquivo, processá-lo** (com a edição de Níveis) e **exportá-lo**, acionando o módulo `file-exr`.
* **Krita (Validador):** Atua como o **segundo validador**, verificando a interoperabilidade e a presença das camadas no painel *Layers*.

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

Com base nos dados coletados, calculamos a Taxa de Sucesso Funcional (TSF) e a Densidade de Defeitos por Teste (DDT):

| Métrica | Fórmula | Valor Calculado | Critério de Aceitação (H1) |
| :--- | :--- | :--- | :--- |
| **M1.1: TSF** | (Nº de Casos de Intercâmbio Sucedidos / Nº Total de Casos de Intercâmbio Testados) * 100 |  |  |
| **M1.2: DDT** | Nº de Defeitos de Interoperabilidade / Nº Total de Casos de Teste Executados |  |  |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

### 3. Análise e Julgamento



#### Resposta à Q1 e Julgamento da Hipótese



#### Achados e Melhorias Específicas


### 🎥 Evidência em Vídeo 




### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|   [Larissa Stéfane](https://github.com/SkywalkerSupreme)      |
| 1.1    | 17/11/2025 | Adição das tabelas e textos | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |       |
