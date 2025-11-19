# Plano de Avaliação - Quanto à Compatibilidade

O processo de medição para a característica de **Compatibilidade**, com base na, [Fase2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/2-compatibilidade/), exige a definição precisa de recursos e de procedimentos para garantir que a execução na [Fase 4](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase4/2-compatibilidade/) seja fiel aos objetivos estabelecidos no GQM. 

Dessa forma, a avaliação concentra-se em duas subcaracterísticas principais: a **Interoperabilidade**, que trata da troca de dados com outros *softwares* do ecossistema de *design* (como Blender e Krita), e a **Coexistência**, que mede o impacto do módulo `file-exr` no desempenho do GIMP.

Dessa forma, o planejamento a seguir detalha o **ambiente de teste**, os **instrumentos de medição** e o **passo a passo de coleta** para as oito métricas.

## Métricas a Serem Implementadas

A **Tabela 1** apresenta as quatro questões operacionais (Q) e as métricas (M) que serão implementadas, com base na [Fase2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/2-compatibilidade/). Assim, estas métricas buscam traduzir o conceito de Compatibilidade em dados quantificáveis ao fornecer *insights* acionáveis para a comunidade de desenvolvimento do GIMP.

**Tabela 1:** Métricas de Compatibilidade (GQM)

| Questão (Q) | Foco Principal (Subcaracterística) | Métricas a Coletar |
| :--- | :--- | :--- |
| **Q1**. Qual o grau de fidelidade e confiança do GIMP na troca de dados com o ecossistema externo? | Interoperabilidade | M1.1: Taxa de Sucesso Funcional (TSF) e M1.2: Densidade de Defeitos por Teste (DDT). |
| **Q2**. Quais são os custos de recursos (tempo e memória) que o módulo File-exr impõe? | Coexistência | M2.1: Aumento Percentual no Tempo de Carregamento (APTC) e M2.2: Aumento Percentual no Consumo de Memória (APCM). |
| **Q3**. O quanto estável e robusto é o módulo File-exr em produção? | Estabilidade em Produção (Processo) | M3.1: Densidade de Defeitos Pós-Lançamento (DDPL) e M3.2: Tempo Médio de Resolução (TMR). |
| **Q4**. De que forma a arquitetura do módulo File-exr aumenta a dificuldade e o custo de manutenção? | Arquitetura/Manutenção (Produto/Processo) | M4.1: Índice de Esforço Não-Comum (IENC) e M4.2: Complexidade Ciclomática Média (CCM). |


**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

## Ferramentas e Métodos de Coleta

A medição das subcaracterísticas de **Interoperabilidade** e **Coexistência** exige a utilização de um conjunto de ferramentas que garantem a objetividade e a precisão na coleta de dados. Dessa forma, as métricas de produto (TSF, APTC, CCM) e de processo (DDT, TMR) serão quantificadas através de testes de execução, monitoramento de sistema e análise estática do código-fonte.

Com isso, a **Tabela 2** sintetiza o fluxo entre as métricas, suas respectivas fontes de dados (origem do dado) e os instrumentos de medição (ferramentas) que serão utilizados na Fase 4, assegurando a rastreabilidade do processo.


**Tabela 2:** Relação entre Métrica, Fonte de Dados e Instrumento de Medição


| Métrica | Fonte de Dados | Instrumento de Medição (Ferramenta) |
| :--- | :--- | :--- |
| **M1.1 (TSF), M1.2 (DDT)** | Execução do Round-Trip (GIMP ↔ Blender/Krita) | Planilha de Testes, Logs de Erro, Observação Manual. |
| **M2.1 (APTC), M2.2 (APCM)** | Processo GIMP em tempo de execução | `time` (Linux), Gerenciador de Tarefas (Windows), Cronômetro. |
| **M3.1 (DDPL), M3.2 (TMR)** | Dados históricos do Repositório (Issues) | GitLab Filters, Planilha de Coleta, Busca Documental. |
| **M4.1 (IENC), M4.2 (CCM)** | Código-fonte do `file-exr` | Ferramenta de Análise Estática (Lizard), Inspeção Manual. |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

### Ambiente de teste

Para simular o fluxo de trabalho de um Designer Gráfico ou Artista VFX, o ambiente de teste deve ser multiplataforma e refletir a diversidade de sistemas utilizados por esses profissionais. Com isso, a configuração de dois sistemas operacionais e o uso de *softwares* de referência são cruciais para validar a interoperabilidade do formato OpenEXR (`.exr`).

**Sendo assim, o ambiente de teste será composto por:**

**Tabela 3:** Ambientes de testes

| Recurso | Detalhe | Justificativa e Finalidade |
| :--- | :--- | :--- |
| **Sistema Operacional 1** | Distribuição Linux (Ex: **Ubuntu 22.04 LTS**). | Base principal para os testes de Coexistência (Q2) e Interoperabilidade (Q1). A escolha do Linux facilita a utilização de comandos de medição precisos, como `time` e `htop`, essenciais para métricas de desempenho. |
| **Sistema Operacional 2** | Microsoft **Windows 11**. | Base de comparação essencial para Coexistência (Q2), pois atua como validador cruzado do *round-trip* em um ambiente diferente, detectando possíveis falhas específicas de API. |
| **Software em Avaliação** | **GIMP 3.0.4** e seu módulo `file-exr`. | O objeto principal de medição. |
| **Software de Referência 1** | **Blender** (Versão 3.x ou superior). | Atua como produtor e consumidor de arquivos `.exr` de alta qualidade (HDR, Multilayer) para testar o **Round-Trip** (Q1), simulando o cenário de um *pipeline* de renderização 3D. |
| **Software de Referência 2** | **Krita** (Versão 5.x ou superior). | Atua como segundo validador independente para garantir a fidelidade do arquivo gerado pelo GIMP, aumentando a confiabilidade dos resultados de Interoperabilidade (Q1). |
| **Arquivos de Teste** | Um conjunto de 5 arquivos `.exr` com metadados e compressões distintas, além de um arquivo de **100MB** (para estresse no Q2). | Massa de dados utilizada para a execução da Fase 4. |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)

### Instrumentos de medição

Os instrumentos de medição são responsáveis por coletar os dados brutos de forma objetiva. Sendo assim, a combinação de ferramentas de monitoramento de sistema com análise estática de código e documental garante uma visão completa da Compatibilidade.


**Tabela 4:** AInstrumentos de medição

| Métrica(s) | Instrumento de Medição (Ferramenta) | Onde Encontrar / Uso |
| :--- | :--- | :--- |
| **M1.1 (TSF) / M1.2 (DDT)** | **Planilha de Testes**, **Observação Manual** e **Logs de Erro**. | Registro de sucesso, falha e tipo de defeito encontrado em cada uma das 10 validações do *round-trip* (Q1). |
| **M2.1 (APTC) / M2.2 (APCM)** | **Cronômetro nativo do SO** (ou comando `time` no Linux) e **Monitor de Recursos do SO** (Gerenciador de Tarefas no Windows; `top/htop` no Linux). | Medição precisa do tempo de carregamento e pico de consumo de RAM do processo GIMP antes e durante a abertura de um `.exr` (Q2). |
| **M3.1 (DDPL) / M3.2 (TMR)** | **Repositório GitLab do GIMP** (Seção *Issues*) e **Filtros de Busca**. | Coleta de dados de *issues* públicas para obter o número de defeitos e calcular o tempo de resolução médio (Q3). |
| **M4.2 (CCM)** | **Ferramenta de Análise Estática** (Ex: **Lizard**). | Ferramenta utilizada para analisar o código-fonte do `file-exr` e calcular a **Complexidade Ciclomática Média** (CCM) das funções críticas (Q4). |
| **Todos (Evidência)** | **Software de Gravação de Tela** (Ex: OBS Studio, Ferramenta Nativa do SO). | Produzir as evidências em vídeo da execução dos testes na Fase 4. |

**Autora:** [Larissa Stéfane](https://github.com/SkywalkerSupreme)


### Passo a Passo de Coleta

O passo a passo detalha o roteiro que será seguido na Fase 4. Sendo assim, a execução deste roteiro deve ser **gravada em vídeo** para atender ao requisito de evidência.

#### A. Roteiro de Teste de Interoperabilidade (Q1: TSF e DDT)

O teste simula o **Round-Trip** de um arquivo entre os *softwares* do ecossistema gráfico.

1.  **Criação da Amostra (Baseline):** Utilizar o **Blender** para gerar 5 arquivos `.exr` de alta qualidade, garantindo que contenham metadados e *Multilayers* (AOVs). Salvar os 5 arquivos como *Baseline*.
2.  **Importação no GIMP:** Abrir os 5 arquivos *Baseline* no **GIMP** 3.0.4. Registrar se a abertura é bem-sucedida.
3.  **Modificação e Exportação (GIMP -> Terceiro):** Realizar uma alteração mínima no GIMP (ex: ajuste de níveis de cor) e, em seguida, exportar os 5 arquivos modificados.
    * **Atenção:** **GRAVAR VÍDEO** da manipulação e exportação no GIMP.
4.  **Validação 1 (Blender):** Tentar abrir cada um dos 5 arquivos exportados pelo GIMP de volta no **Blender**.
5.  **Validação 2 (Krita):** Tentar abrir os mesmos 5 arquivos no **Krita**.
6.  **Medição e Classificação:** Registrar o **Sucesso** ou **Defeito** (e.g., *crash*, perda de metadado, canal corrompido) para cada uma das 10 validações (5 arquivos x 2 *softwares*). Com isso, será possível calcular a **TSF** e o **DDT**.

#### B. Roteiro de Teste de Coexistência (Q2: APTC e APCM)

O teste avalia a sobrecarga do módulo `file-exr` no sistema em relação à inicialização e uso de recursos, garantindo a **Coexistência**.

1.  **Preparo:** Fechar todas as aplicações desnecessárias para garantir a precisão da medição.
2.  **Medição de Baseline (T1 e M1):** Iniciar o **GIMP** no **Sistema Operacional 1** (ex: Linux) sem abrir nenhum arquivo. Medir e registrar o **Tempo de Carregamento (T1)** e o **Pico de Consumo de RAM (M1)**. Repetir 3 vezes e calcular a média.
3.  **Medição com Módulo Ativo (T2 e M2):** Fechar o GIMP e reiniciar a aplicação, mas desta vez **abrindo imediatamente** o arquivo `.exr` de **100MB**.
    * **Atenção:** **GRAVAR VÍDEO** mostrando o Monitor de Recursos do SO (ex: `htop`) durante a medição.
    * Medir o **Tempo de Carregamento (T2)** (até o arquivo ser exibido).
    * Registrar o **Pico de Consumo de RAM (M2)**. Repetir 3 vezes e calcular a média.
4.  **Validação Cruzada:** Repetir os passos 2 e 3 no **Sistema Operacional 2** (Windows 11).
5.  **Cálculo:** Aplicar as fórmulas **APTC** e **APCM** com os valores médios registrados para determinar a sobrecarga.

#### C. Roteiro de Coleta de Dados de Processo e Arquitetura (Q3 e Q4)

Para as questões que envolvem processos e arquitetura, a medição é documental e estática.

1.  **Coleta de DDPL e TMR (Q3):** Acessar o repositório **GitLab do GIMP**. Filtrar as *issues* por `search: exr` e `label: bug`. Contar o **Nº de Defeitos Pós-Lançamento** (DDPL) e calcular o **Tempo Médio de Resolução (TMR)** para os bugs já fechados (Q3).
2.  **Cálculo de CCM (Q4):** Utilizar a ferramenta **Lizard** para calcular a **Complexidade Ciclomática** das funções críticas do `file-exr`.
3.  **Cálculo de IENC (Q4):** Inspecionar o código-fonte do `file-exr` e estimar o percentual de código que depende de APIs específicas de um SO (Windows/Linux/macOS), comparando com o total de código do módulo.

## Localização dos Dados de Avaliação

A definição da estrutura de pastas para os dados é um requisito obrigatório e garante a rastreabilidade do projeto.

A rastreabilidade e a transparência são princípios fundamentais na engenharia de *software* e, por isso, a definição da estrutura de armazenamento dos dados coletados é essencial. O objetivo é garantir que os resultados da Fase 4 sejam auditáveis e que a execução dos testes possa ser replicada por terceiros.

Dessa forma, a documentação final da avaliação será apresentada no arquivo [Fase 4 - Compatibilidade](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase4/2-compatibilidade/). O acesso a esta documentação permitirá a análise dos seguintes componentes de evidência, que foram separados de acordo com sua natureza (dados brutos, evidências visuais e relatórios de análise estática):

| Conteúdo Principal | Finalidade |
| :--- | :--- |
| Planilhas de resultados brutos (TSF, DDT, APTC, APCM) e dados de processo (DDPL, TMR, CCM). | Armazenamento de todas as **métricas calculadas** na Fase 4. |
| **Arquivos de vídeo** (obrigatórios) dos testes de *Round-Trip* (Q1) e Coexistência (Q2). | Prova visual da **execução dos testes** (requisitado pela professora). |
| Os 5 arquivos `.exr` de *input* e *output* (baseline e modificados pelo GIMP). | Prova da **massa de dados** usada no teste de Interoperabilidade (Q1). |
| Relatórios da ferramenta de análise estática (CCM) e anotações da inspeção de código para o IENC. | Prova da **análise do código-fonte** (Q4). |

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|      [Larissa Stéfane](https://github.com/SkywalkerSupreme)  |
| 1.1    | 17/11/2025 | Adição das tabelas e textos | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |       |

