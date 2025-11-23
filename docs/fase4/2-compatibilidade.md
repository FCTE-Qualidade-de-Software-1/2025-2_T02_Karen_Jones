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


<details>
  <summary size="20"><b> Imagens geradas </b></summary> 

<div align="center">
    Figura 3: cubo Azul
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print04_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 4: Retângulo Vermelho
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print05_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>


<div align="center">
    Figura 5: Retângulo Verde
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print06_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 6: Retângulo Roxo
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print07_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 7: Cubo Amarelo
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print08_teste01_compatibilidade.png">
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
    Figura 8: Edição de ajuste 
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print03_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

  </details>

### 3ª Etapa: Verificação da Consistência no Blender

**Descrição:** Os arquivos de saída do GIMP foram abertos no Blender (utilizando o **Image Editor** do software). COm isso, a verificação da camada foi realizada ao inspecionar o menu de *Passes* (canais) para confirmar a presença das camadas **Depth** e **Mist**.


O vídeo 3 mostra a execução desta etapa:

<iframe width="1264" height="711" src="https://www.youtube.com/embed/L5h_6k7RujY" title="Teste 01 - Compatibilidade: Verificação da consistência no BLENDER" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


Abaixo há as captura de tela da etapa: 

<details>
  <summary size="20"><b> Imagens da execução da etapa 3 </b></summary> 


<div align="center">
    Figura 9 : cubo Azul  editado no Blender
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print09_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 10: Retângulo Vermelho editado no Blender
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print10_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>


<div align="center">
    Figura 11: Retângulo Verde editado no Blender
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print11_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 12: Retângulo Roxo editado no Blender
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print08_teste12_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 13: Cubo Amarelo editado no Blender
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print08_teste13_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>


  </details>


### 4ª Etapa: Verificação da Consistência no Krita

**Descrição:** O mesmo conjunto de arquivos de saída foi aberto no Krita. A inspeção ocorreu no painel **Camadas** (*Layers*) e o resultado confirmou a falha do módulo do GIMP.

O vídeo 4 mostra a execução desta etapa:

<iframe width="1264" height="711" src="https://www.youtube.com/embed/OYLFR6UJl1I" title="Teste 01 - Compatibilidade: Verificação da Consistência no Krita" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

Abaixo há as captura de tela da etapa: 

<details>
  <summary size="20"><b> Imagens da execução da etapa 4 </b></summary> 


<div align="center">
    Figura 14 : cubo Azul editado no Krita
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print12_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 15: Retângulo Vermelho editado no Krita
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print13_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>


<div align="center">
    Figura 16: Retângulo Verde editado no Krita
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print14_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 17: Retângulo Roxo editado no Krita
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print15_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

<div align="center">
    Figura 18: Cubo Amarelo editado no Krita
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/print16_teste01_compatibilidade.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

  </details>


## 2. Medição (Dados Coletados)


A **Tabela 1** mostra os resultados das 10 validações e evidencia as inconsistências entre os validadores.

**Tabela 1:** Resultados do Round-Trip GIMP (OpenEXR)

| ID Arquivo | Cor/Forma | GIMP -> Blender | GIMP -> Krita | Resultado da Validação | Defeito Encontrado (Se Houve) |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **A1** | Cubo Azul | Defeito | Defeito | 0 Sucesso / 2 Defeitos | **Perda das camadas Depth e Mist.** |
| **A2** | Retângulo Vermelho | Sucesso | Sucesso | 2 Sucessos / 0 Defeitos | N/A |
| **A3** | Retângulo Verde | Defeito | Defeito | 0 Sucesso / 2 Defeitos | **Perda das camadas Depth e Mist.** |
| **A4** | Retângulo Roxo | Sucesso | Defeito | 1 Sucesso / 1 Defeito | **Krita:** Falha na preservação das camadas. |
| **A5** | Cubo Amarelo | Sucesso | Sucesso | 2 Sucessos / 0 Defeitos | N/A |
| **Totais** | **5 Arquivos** | **3 Sucessos / 2 Defeitos** | **2 Sucessos / 3 Defeitos** | **Total: 5 Sucessos / 5 Defeitos** | |


**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


#### Cálculos das Métricas (M1.1 e M1.2)

Com base nos dados coletados, foi calculado a Taxa de Sucesso Funcional (TSF) e a Densidade de Defeitos por Teste (DDT), métricas centrais para avaliar a Interoperabilidade.


**Tabela 2:** Resultado do Cálculo das Métricas de Interoperabilidade

| Métrica | Fórmula | Valor Calculado | Critério de Aceitação (H1) |
| :--- | :--- | :--- | :--- |
| **M1.1: TSF** | (Nº Total de Sucessos / Nº Total de Casos de Intercâmbio Testados) * 100 | $(5 / 10) \times 100 = \mathbf{50\%}$ | $\ge 95\%$ (Alta Interoperabilidade) |
| **M1.2: DDT** | Nº Total de Defeitos / Nº Total de Arquivos Testados | $5 / 5 = \mathbf{1.0}$ defeito/arquivo | $< 0.5$ (Baixo Risco) |

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


## 3. Análise e Julgamento

A análise dos resultados da execução confrontou os valores obtidos com os critérios de aceitação definidos na Fase 2. Com isso, foi possível demonstrar a fragilidade do GIMP em manter a interoperabilidade com *softwares* do ecossistema VFX, como Blender e Krita.

A **Tabela 3** sumariza o desempenho do módulo `file-exr` na Interoperabilidade, comparando as métricas de produto e processo com os limites estabelecidos.


**Tabela 3:** Resumo de Desempenho e Julgamento da Hipótese H1 (Interoperabilidade)


| Métrica | Resultado Obtido | Critério de Aceitação (H1) | Julgamento |
| :--- | :--- | :--- | :--- |
| **M1.1: TSF** | $\mathbf{50\%}$ | $\ge 95\%$ | **REFUTADA** |
| **M1.2: DDT** | $\mathbf{1.0}$ defeito/arquivo | $< 0.5$ defeitos/arquivo | **REFUTADA** |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)


### Discussão dos Resultados e Julgamento

O teste de *Round-Trip* indicou uma falha clara na **Hipótese H1**, que previa alta fidelidade de intercâmbio. Sendo assim, os resultados da execução confirmaram a necessidade de aprimoramento urgente no módulo `file-exr`:

1.  **Baixa Taxa de Sucesso Funcional (TSF):** O valor calculado de $\mathbf{50\%}$ situou-se drasticamente abaixo do mínimo de $95\%$ estabelecido na Fase 2. Por conseguinte, classificou-se a Interoperabilidade do módulo como **Baixa Interoperabilidade**.
2.  **Alto Risco (DDT):** A Densidade de Defeitos por Teste (DDT) atingiu $\mathbf{1.0}$ defeito por arquivo testado e este índice confirmou o **Alto Risco** de quebra no *pipeline* de trabalho, o que compromete o propósito de prover estabilidade ao *Designer Gráfico*.

Concluiu-se que o módulo `file-exr` não atende aos requisitos de Interoperabilidade esperados, **refutando a Hipótese H1** em ambas as métricas.

### Achados e Melhoria Proposta (Conexão com a Fase 1)

A análise da natureza dos defeitos revelou a causa da baixa TSF e reforçou a conexão com o **objetivo de medição** de analisar a conformidade com o padrão OpenEXR.

1.  **Perda de Camadas Críticas:** A falha mais consistente foi a **perda total das camadas Depth e Mist (AOVs)**. O GIMP preservou apenas a camada básica de cor, e destruiu os dados extras essenciais para *pipelines* de VFX.
2.  **Inconsistência de Tolerância:** Observou-se uma divergência entre o Blender (mais tolerante) e o Krita (mais rigoroso, que falhou no Arquivo A4). Esta inconsistência sugeriu que o GIMP reescreve o arquivo com uma estrutura EXR ambígua, o que expôs a falta de alinhamento do módulo `file-exr` com os padrões da indústria.

**Melhoria Proposta:**

* **Melhoria Específica:** Sugere-se corrigir o *parser* do módulo `file-exr` para que ele **preserve as *tags* de metadados** que definem os canais AOV. Esta ação garantirá a Interoperabilidade prometida pelo *software* ao alinhar o GIMP com o padrão OpenEXR.


### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|   [Larissa Stéfane](https://github.com/SkywalkerSupreme)      |
| 1.1    | 17/11/2025 | Adição das tabelas e textos | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |       |
| 1.2    | 22/11/2025 | Complementação do teste 01 | [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
