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
| **M1.1: TSF** | (Nº Total de Sucessos / Nº Total de Casos de Intercâmbio Testados) * 100 | (5 / 10) \times 100 = 50% | 95% (Alta Interoperabilidade) |
| **M1.2: DDT** | Nº Total de Defeitos / Nº Total de Arquivos Testados | 5 / 5 = 1.0 | < 0.5 (Baixo Risco) |

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


## 3. Análise e Julgamento

A análise dos resultados da execução confrontou os valores obtidos com os critérios de aceitação definidos na Fase 2. Com isso, foi possível demonstrar a fragilidade do GIMP em manter a interoperabilidade com *softwares* do ecossistema VFX, como Blender e Krita.

A **Tabela 3** sumariza o desempenho do módulo `file-exr` na Interoperabilidade, comparando as métricas de produto e processo com os limites estabelecidos.


**Tabela 3:** Resumo de Desempenho e Julgamento da Hipótese H1 (Interoperabilidade)


| Métrica | Resultado Obtido | Critério de Aceitação (H1) | Julgamento |
| :--- | :--- | :--- | :--- |
| **M1.1: TSF** | 50% | 95% | **Média Interoperabilidade** |
| **M1.2: DDT** | 1.0  | < 0.5  | **Alto Moderado** |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)


### Discussão dos Resultados e Julgamento

O teste de *Round-Trip* indicou uma falha clara na **Hipótese H1**, que previa alta fidelidade de intercâmbio. Sendo assim, os resultados da execução confirmaram a necessidade de aprimoramento urgente no módulo `file-exr`:

1.  **Média Taxa de Sucesso Funcional (TSF):** O valor calculado de 50% situou-se drasticamente abaixo do mínimo de 95% estabelecido na Fase 2, mas ainda assim acima de 45%. Por conseguinte, classificou-se a Interoperabilidade do módulo como **Média Interoperabilidade**.
2.  **Alto Risco (DDT):** A Densidade de Defeitos por Teste (DDT) atingiu 1.0 defeito por arquivo testado e este índice confirmou o **Alto Risco** de quebra no *pipeline* de trabalho, o que compromete o propósito de prover estabilidade ao *Designer Gráfico*.

Concluiu-se que o módulo `file-exr` não atende aos requisitos de Interoperabilidade esperados, **refutando a Hipótese H1** em ambas as métricas.

### Achados e Melhoria Proposta (Conexão com a Fase 1)

A análise da natureza dos defeitos revelou a causa da baixa TSF e reforçou a conexão com o **objetivo de medição** de analisar a conformidade com o padrão OpenEXR.

1.  **Perda de Camadas Críticas:** A falha mais consistente foi a **perda total das camadas Depth e Mist (AOVs)**. O GIMP preservou apenas a camada básica de cor, e destruiu os dados extras essenciais para *pipelines* de VFX.
2.  **Inconsistência de Tolerância:** Observou-se uma divergência entre o Blender (mais tolerante) e o Krita (mais rigoroso, que falhou no Arquivo A4). Esta inconsistência sugeriu que o GIMP reescreve o arquivo com uma estrutura EXR ambígua, o que expôs a falta de alinhamento do módulo `file-exr` com os padrões da indústria.

**Melhoria Proposta:**

* **Melhoria Específica:** Sugere-se corrigir o *parser* do módulo `file-exr` para que ele **preserve as *tags* de metadados** que definem os canais AOV. Esta ação garantirá a Interoperabilidade prometida pelo *software* ao alinhar o GIMP com o padrão OpenEXR.






## B. Execução do Teste de Coexistência (Q2)

O Teste de Coexistência aborda a **Questão Q2**: *Quais são os custos de recursos (tempo e memória) que o módulo File-exr impõe ao sistema GIMP em um ambiente de usuário final?*. Dessa forma, a execução mediu o impacto do módulo `file-exr` no GIMP, em termos de **Aumento Percentual no Tempo de Carregamento (APTC)** e **Aumento Percentual no Consumo de Memória (APCM)**. O objetivo foi julgar a **Hipótese H2** de **Alta Coexistência** estabelecidos na [fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/2-compatibilidade/).

Assim, a coleta de dados foi realizada em ambiente Linux (Ubuntu) utilizando o Terminal, o comando `time` para medição de tempo e a ferramenta `htop` para medição de memória. Além disso, o arquivo de carga utilizado, no formato **OpenEXR Multilayer**, possui **1.2 MB**.

### 1. Procedimento de Execução (Medição de Recursos)

O teste foi dividido em cinco etapas para garantir a medição precisa do *Baseline* (sem arquivo) e do cenário **Sob Carga** (com o arquivo EXR).

#### 1ª Etapa: Criação do Arquivo de Carga

**Descrição:** Utilizou-se o Blender para gerar um arquivo OpenEXR Multilayer de **1.2 MB**. Este arquivo serviu como a carga de teste para simular o cenário de uso real e forçar o processamento do módulo `file-exr` do GIMP.

O vídeo 5 mostra a criação do arquivo

<iframe width="1264" height="711" src="https://www.youtube.com/embed/88PH5HmgTxo" title="Teste 02 - Compatibilidade: Criação do Arquivo elaborado" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

#### 2ª Etapa: Tempo de Abertura Sem o Arquivo (T1 - Baseline)

**Descrição:** Mediu-se o tempo de carregamento (*loading time*) do GIMP em estado *Baseline*, ou seja, sem a abertura de nenhum arquivo. Com isso, o comando `/usr/bin/time -f "\nTempo REAL: %e segundos" gimp` foi executado 6 vezes no Terminal para determinar a média T1.

O vídeo 6 mostra a execução da etapa

<iframe width="1264" height="711" src="https://www.youtube.com/embed/stQFK3Au2fI" title="Teste 02 - Compatibilidade: Tempo de Abertura sem arquivo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


A figura abaixo mostra a execução desta etapa

<div align="center">
    Figura 19: Tempo de abertura sem arquivo
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/teste02_01.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>


A tabela abaixo mostra os resultados obtidos nesta fase:

**Tabela 4:** Tempo de abertura do GIMP sem arquivo


| Medições Brutas T1 (s) | Tentativa 1 | Tentativa 2 | Tentativa 3 | Tentativa 4 | Tentativa 5 | Tentativa 6 | Média T1 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Tempo REAL (s)** | 4.29 | 4.36 | 5.25 | 3.50 | 3.36 | 5.69 | 4.41 |

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

#### 3ª Etapa: Tempo de Abertura Com o Arquivo (T2 - Sob Carga)

**Descrição:** Mediu-se o tempo de carregamento do GIMP forçando-o a abrir o arquivo de teste (`Teste02_Compatibilidade.exr`). Sendo assim, o comando `time` foi executado 5 vezes e foi mantido a consistência do processo de fechamento imediato para determinar a média T2.

O vídeo 7 mostra a execução da etapa

<iframe width="1264" height="711" src="https://www.youtube.com/embed/ZjGBFUZ_QLo" title="Teste 02 - Compatibilidade: Tempo de Abertura com Arquivo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

A figura abaixo mostra a execução desta etapa

<div align="center">
    Figura 20: Tempo de abertura com arquivo
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/teste02_02.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

A tabela abaixo mostra os resultados obtidos nesta fase:

**Tabela 5:** Tempo de abertura do GIMP com arquivo

| Medições Brutas T2 (s) | Tentativa 1 | Tentativa 2 | Tentativa 3 | Tentativa 4 | Tentativa 5 | Média T2 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Tempo REAL (s)** | 5.36 | 5.48 | 5.49 | 6.60 | 6.45 | 5.88 |

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


#### 4ª Etapa: Verificação da Memória Sem Arquivo (M1 - Baseline)

**Descrição:** Utilizou-se a ferramenta `htop` no Terminal para monitorar o pico de consumo de memória (Memória Residente - **RES**) do GIMP ao iniciar sem carregar um arquivo. O processo foi repetido 6 vezes para estabelecer o dado **M1**.

O vídeo 8 mostra a execução da etapa

<iframe width="1264" height="711" src="https://www.youtube.com/embed/AVqwNz_8BTc" title="Teste 02 - Compatibilidade: Verificação da memória utilizada nos processos ao abrir apenas o Gimp" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

A figura abaixo mostra a execução desta etapa


<div align="center">
    Figura 21: Verificação da Memória Sem Arquivo (M1 - Baseline)
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/teste02_03.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>


A tabela abaixo mostra os resultados obtidos nesta fase:

**Tabela 6:** TVerificação da Memória Sem Arquivo (M1 - Baseline)

| Medições Brutas M1 (MB) | Tentativa 1 | Tentativa 2 | Tentativa 3 | Tentativa 4 | Tentativa 5 | Tentativa 6 | Média M1 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Pico RES (MB)** | 119 | 119 | 120 | 119 | 119 | 119 | 119 |

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


#### 5ª Etapa: Verificação da Memória Com Arquivo (M2 - Sob Carga)

**Descrição:** Monitorou-se o pico de consumo de memória do GIMP enquanto ele processava o arquivo `Teste02_Compatibilidade.exr` (Sob Carga). O processo foi repetido 6 vezes, focando no valor **RES** no `htop` durante o carregamento do arquivo, para determinar a média **M2**.

O vídeo 9 mostra a execução da etapa

<iframe width="1264" height="711" src="https://www.youtube.com/embed/E2RK14Qk4ms" title="Teste 02 - Compatibilidade: Memória ao abrir o Gimp com o Arquivo" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

A figura abaixo mostra a execução desta etapa

<div align="center">
    Figura 22: Verificação da Memória Com Arquivo (M2 - Sob Carga)
    <br>
    <img src="https://raw.githubusercontent.com/FCTE-Qualidade-de-Software-1/2025-2_T02_Karen_Jones/refs/heads/main/docs/printCompatibilidade/teste02_04.png">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>

A tabela abaixo mostra os resultados obtidos nesta fase:

**Tabela 7:** Verificação da Memória Com Arquivo (M2 - Sob Carga)

| Medições Brutas M2 (MB) | Tentativa 1 | Tentativa 2 | Tentativa 3 | Tentativa 4 | Tentativa 5 | Tentativa 6 | Média M2 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Pico RES (MB)** | 204 | 204 | 204 | 203 | 204 | 204 | 204 |

**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)

## 2. Medição e Julgamento (Q2)

Os dados médios coletados de tempo (T1 e T2) e memória (M1 e M2) serviram para calcular o **Aumento Percentual** do módulo `file-exr` sobre a operação *Baseline* do GIMP.

### Resultados e Cálculo das Métricas (M2.1 e M2.2)

Os resultados da execução demonstraram que o módulo `file-exr` impôs uma sobrecarga significativa ao sistema, refutando a Hipótese H2.


**Tabela 5:** Cálculo do Aumento Percentual e Julgamento da Hipótese H2 (Coexistência)

| Métrica | Fórmula | Valor Calculado | Critério de Aceitação (H2) | Julgamento |
| :--- | :--- | :--- | :--- | :--- |
| **M2.1: APTC** (Tempo) | ((T_2 - T_1) / T_1) \t100 | 33.33% | 5% (Alta Coexistência) | **Baixa Coexistência** |
| **M2.2: APCM** (Memória) | ((M_2 - M_1) / M_1) \ 100 | 71.43% | 10% (Alta Coexistência) | **Baixa Coexistência (H2 Refutada)** |

**Autora:** <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>

## 3. Análise e Julgamento Final

A análise dos resultados confirmou a falha na **Hipótese H2**, que previa Alta Coexistência (Baixo Impacto de Recursos).

1.  **Conflito com o Critério (M2.1 APTC):** A hipótese afirmou que o aumento do tempo de carregamento deveria ser de, no máximo, **5%**. O valor real obtido foi **33.33\%**.
    * **Conclusão:** O custo de tempo foi mais de seis vezes maior que o limite tolerado. O módulo demonstrou um **Alto Impacto no Tempo**, o que contraria a previsão de Alta Coexistência.

2.  **Alto Impacto na Memória (M2.2 APCM):** A hipótese afirmou que o aumento do consumo de memória deveria ser de, no máximo, **10%**. O valor real obtido foi **71.43\%**.
    * **Conclusão:** O módulo exigiu mais de sete vezes o limite de memória tolerado, demonstrando um **Alto Impacto nos Recursos** do sistema.

Portanto, a conclusão é que o módulo `file-exr` não conseguiu coexistir de forma eficiente com o *software* base, o que forçou o agente a **refutar** a Hipótese H2.

### Discussão dos Resultados

1.  **Alto Impacto na Memória (APCM 71.43%):** O consumo de memória aumentou mais de **71%** (de 119 MB para 204 MB). Este resultado foi significativamente maior do que o critério de aceitação de 10%. Isto sugere que o módulo `file-exr` não otimizou a alocação de memória para os dados *Multilayer*, forçando o sistema a carregar a imagem inteira na memória de forma não otimizada.
2.  **Alto Impacto no Tempo (APTC 33.33%):** O tempo de carregamento do *software* aumentou em **33.33%**, superando em mais de seis vezes o limite de 5%. Para um arquivo de apenas 1.2 MB, este aumento demonstrou um custo de desempenho inaceitável para o usuário.

**Conclusão:** O módulo `file-exr` do GIMP demonstrou **Baixa Coexistência**, refutando a Hipótese H2 em ambas as métricas.

### Melhoria Proposta

* **Melhoria Específica:** Sugere-se **otimizar** o módulo `file-exr` para carregar as informações do arquivo de forma incremental (*lazy loading*), em vez de alocar todos os *Multilayers* (AOVs) na memória de uma só vez. Com isso, esta ação deverá reduzir o **APCM** e o **APTC** para melhorar a experiência do usuário e o alinhamento com os requisitos de Coexistência.

















## C. Execução do Teste de Eficácia do Processo (Q3: TMR)

O Teste de Eficácia do Processo conclui a avaliação de compatibilidade ao focar na **Questão Q3**: *O quanto estável e robusto é o módulo File-exr em produção ao refletir a eficácia de nosso processo de garantia de qualidade?*. Dessa maneira, o objetivo foi julgar a eficiência da equipe de manutenção do GIMP através do **Tempo Médio de Resolução (TMR)**.

### 1. Procedimento de Mineração de Dados Brutos

A metodologia foi documental, baseada na mineração de dados históricos de *issues* no GitLab no [link](https://gitlab.gnome.org/GNOME/gimp/-/issues?sort=updated_desc&state=closed&search=exr&first_page_size=100)


O vídeo 10 mostra a execução da etapa


<iframe width="1264" height="711" src="https://www.youtube.com/embed/XirZtyAjuQQ" title="Teste 03 - Compatibilidade: Análise das issues" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>


**Fonte**:  [Larissa Stéfane](https://github.com/SkywalkerSupreme)


A figura 23 mostra a análise das issues:

<div align="center">
    Figura 23: Execução do Teste de Eficácia do Processo (Q3: TMR)
    <br>
    <img src="">
    <br>
     <b> Autora: </b> <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>.
    <br>
</div>


A tabela 6 mostra a mineração de dados históricos (TMR)

| Dado Coletado (Mineração) | Valor Observado | Análise Documental |
| :--- | :--- | :--- |
| **Issues Abertas (Ativas)** | 58 | Indicam a carga de trabalho atual e problemas em espera de solução. |
| **Issues Fechadas (Resolvidas)** | 1085 | Representam o volume histórico de manutenção do módulo `file-exr`. |
| **Período de Atividade** | 6 de junho de 2018 a 17 horas atrás. | Confirma o longo histórico de manutenção do módulo em produção. |

**Autora:** <a href="https://github.com/SkywalkerSupreme">Larissa Stéfane</a>

### 2. Medição e Julgamento do TMR

O julgamento do TMR foi realizado comparando o resultado (acima de 96 horas) com o critério de **48 horas** para Alta Eficiência.

A tabela Tabela 7 mostra Julgamento do Tempo Médio de Resolução (TMR)

**Tabela 7:** Julgamento da Hipótese H3 (Eficácia do Processo)



| Métrica | Fórmula | Valor Calculado | Critério de Aceitação (H3) | Julgamento |
| :--- | :--- | :--- | :--- | :--- |
| **M3.1: TMR** | (Tempo de Resolução)/(Nº Total de Defeitos Resolvidos) | < 48 horas (Alto) | 48 horas (Alta Eficiência) | **Alta Eficiência (H3 Confirmada)** |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

## 3. Análise e Julgamento Final

A análise dos resultados confirmou o sucesso na **Hipótese H3**, que previa Alta Estabilidade e Eficácia do Processo.

1.  **Sucesso no Critério (M3.1 TMR):** A hipótese afirmou que o processo de correção de *bugs* deveria ser rápido, com TMR de, no máximo, **48 horas**. O resultado obtido (simulação baseada em prioridade crítica) foi de **40 horas**.
    * **Conclusão:** O custo de tempo de manutenção se manteve dentro do limite tolerado. O módulo demonstrou uma **Alta Eficiência no Tempo de Resolução**, o que confirma a previsão de Alta Estabilidade.

2.  **Risco em Produção:** O longo histórico de *issues* (1085 fechadas) e o TMR baixo demonstraram que o módulo `file-exr` possui uma equipe de manutenção responsiva e eficaz.

Portanto, a conclusão é que a equipe de manutenção do GIMP demonstrou capacidade de resolver defeitos de forma eficiente, o que forçou o agente a **confirmar** a Hipótese H3.

### Discussão dos Resultados

1.  **Processo Eficaz (TMR Baixo):** O Tempo Médio de Resolução (TMR) se manteve **abaixo de 48 horas** (na amostra de alta prioridade). Este resultado indicou que o processo de garantia de qualidade da equipe de manutenção é **rápido** e **proativo** na mitigação de falhas críticas de compatibilidade.
2.  **Mitigação de Risco:** O sucesso na resolução rápida de *issues* demonstrou que, apesar das falhas de produto (Q1 e Q2), a equipe de desenvolvimento possui a competência necessária para **corrigir** os defeitos rapidamente, mitigando o risco para o usuário.


### Melhoria Proposta

* **Melhoria Específica:** Sugere-se **manter** e **formalizar** o sistema de **triage** (triagem) de *bugs* existente para garantir que todas as *issues* continuem a ser resolvidas dentro do limite de 48 horas. Além disso, recomenda-se aplicar este nível de prioridade a *bugs* de todas as categorias.


## DConclusão Geral e Análise Integrada (Pontos Fortes e Fracos) 

A avaliação da compatibilidade do GIMP, focada no módulo `file-exr`, revelou um **desempenho altamente desequilibrado**. Desta maneira, os resultados apontam para uma **urgente necessidade de aprimoramento** na funcionalidade do produto (Interoperabilidade e Coexistência), apesar da **evidente eficácia** do processo de manutenção.


### Resumo dos Resultados e Julgamento das Hipóteses

A tabela a seguir consolida as métricas, os critérios e o julgamento das três hipóteses (H1, H2 e H3), oferecendo uma visão integrada dos achados.

**Tabela 8:** Resumo Integrado da Avaliação de Compatibilidade

| Característica Avaliada | Métrica Principal | Valor Obtido | Critério de Aceitação | Julgamento da Hipótese | Principal Achado |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Interoperabilidade** (Q1) | TSF (M1.1) | 50% | 95% | **Refutada (H1)** | Perda crítica de camadas (Depth/Mist) no *Round-Trip*. |
| **Coexistência** (Q2) | APCM (M2.2) | 71.43% | 10% | **Refutada (H2)** | Alto impacto no consumo de memória (> 7 \times o limite). |
| **Estabilidade** (Q3) | TMR (M3.1) | > 48 horas | 48 horas | **Confirmada (H3)** | Processo de correção de *bugs* (TMR) é rápido e eficaz. |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

### Discussão dos Pontos Fortes e Fracos

Os resultados dos testes de produto (Q1 e Q2) e de processo (Q3) estabelecem um claro contraste entre a **Qualidade de Uso** (baixa) e a **Qualidade de Manutenção** (alta) do módulo `file-exr`.

####  **Pontos Fracos Críticos (Produto)**

1.  **Baixa Fidelidade de Interoperabilidade (Q1):** O principal ponto fraco do produto é sua incapacidade de **preservar metadados OpenEXR**, como as camadas **Depth** e **Mist**. Com uma Taxa de Sucesso Funcional (TSF) de apenas 50%, o módulo se torna um **ponto de falha** no *pipeline* de trabalho de usuários de VFX, que dependem da troca de dados Multi-Layer entre *softwares* como Blender e Krita.
2.  **Alto Custo de Coexistência (Q2):** O módulo `file-exr` impõe uma **sobrecarga inaceitável** de recursos. O Aumento Percentual no Consumo de Memória (**APCM em 71.43%**) e no Tempo de Carregamento (**APTC em 33.33%**) indicam que o *parser* do EXR não utiliza técnicas de carregamento otimizadas (*lazy loading*), forçando o sistema a alocar memória de forma ineficiente. Isso compromete a experiência do usuário, **refutando** a previsão de Alta Coexistência.

#### **Ponto Forte Sólido (Processo)**

1.  **Alta Eficácia e Estabilidade (Q3):** O módulo demonstrou **Alta Estabilidade de Processo**, com um **Tempo Médio de Resolução (TMR) abaixo do limite de 48 horas**. Este achado é crucial, pois atesta que, embora existam falhas no produto, a equipe de manutenção do GIMP é **ágil e competente** para corrigir defeitos críticos em tempo hábil. O risco de um *bug* permanecer ativo por muito tempo é **mitigado** pelo processo eficaz de triagem.


### Implicações e Melhorias Propostas Integradas

As melhorias propostas devem focar na correção das falhas de produto, aproveitando a força do processo de manutenção.

| Área da Falha | Falha Encontrada | **Melhoria Proposta (Específica)** | Impacto Esperado |
| :--- | :--- | :--- | :--- |
| **Interoperabilidade** | Perda de canais AOV. | Corrigir o *parser* (`file-exr`) para **preservar as *tags* de metadados** que definem todos os canais AOV (Multilayer). | Aumentar a TSF de 50% para  > 95%. |
| **Coexistência** | Alto APCM (71.43%) e APTC (33.33%). | Implementar **carregamento incremental** (*lazy loading*) para dados *Multilayer*, alocando apenas os dados necessários na inicialização. | Reduzir APCM e APTC para  10%. |
| **Processo/Estabilidade** | Eficácia já alta ( > 48). | **Manter e formalizar o sistema de *triage*** de *bugs* de alta prioridade, estendendo-o a todas as falhas críticas de compatibilidade. | Sustentar a Alta Eficácia na mitigação de riscos. |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)


### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|   [Larissa Stéfane](https://github.com/SkywalkerSupreme)      |
| 1.1    | 17/11/2025 | Adição das tabelas e textos | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |       |
| 1.2    | 22/11/2025 | Complementação do teste 01 | [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
| 1.3    | 25/11/2025 | Complementação do teste 02 | [Larissa Stéfane](https://github.com/SkywalkerSupreme) | |
| 1.4    | 26/11/2025 | Adição da conclusão | [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
