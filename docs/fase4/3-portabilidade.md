# Execução do Plano de Avaliação - Quanto à Portabilidade (Linux)

A Fase 4 consiste na aplicação rigorosa dos roteiros definidos na [Fase 3](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase3/3-portabilidade/), transformando as métricas planejadas em dados quantitativos e evidências concretas. Com isso, é possível validar ou refutar as hipóteses levantadas para as subcaracterísticas de Adaptabilidade e Instalabilidade do módulo `file-exr` no ambiente **Linux**.

## A. Execução do Teste de Adaptabilidade (Q1) - Ambiente Linux

O teste de Adaptabilidade verifica a capacidade do módulo `file-exr` de apresentar comportamento funcional estável e desempenho mensurável ao ser executado no ambiente operacional Linux (Ubuntu), servindo como *baseline* para comparação futura com o Windows.

### 1. Procedimento de Execução

A execução foi realizada no ambiente **Linux (Ubuntu 22.04 LTS)**, utilizando o GIMP instalado via gerenciador de pacotes padrão. O procedimento seguiu o roteiro de automação via *script shell* detalhado na [Fase 3](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase3/3-portabilidade/).

**Dessa forma, as seguintes ações foram concluídas:**

**Dataset:** Foi processado um conjunto de **18 arquivos EXR** no total, conforme o plano de teste.

**Automação (Script):** Utilizou-se o script `teste_adaptabilidade_ubuntu.sh` para invocar o GIMP em modo *headless* (sem interface gráfica), forçando a abertura, uma edição simples (níveis automáticos) e o salvamento de cada arquivo.

**Coleta de Logs:** O script capturou o tempo de execução em milissegundos e o código de saída (*exit code*) de cada operação, registrando as falhas.

### 2. Medição (Dados Coletados)

A **Tabela 1** sumariza os resultados das 18 execuções, evidenciando as falhas inesperadas de estabilidade que ocorreram durante o processamento.

<p align="center">
<strong>Tabela 1:</strong> Resultados de Adaptabilidade no Linux (Ubuntu)
<br>
</p>

| ID Arquivo | Operação | Tempo (ms) | Resultado | Defeito Encontrado |
| :--- | :--- | :--- | :--- | :--- |
| **A1.exr** | Open/Edit/Save | 1441 | SUCESSO | - |
| **A2.exr** | Open/Edit/Save | 1531 | SUCESSO | - |
| **A3.exr** | Open/Edit/Save | 1518 | SUCESSO | - |
| **A4.exr** | Open/Edit/Save | 1015 | **FALHA** | terminate called without an active exception / GIMP Abortado|
| **A5.exr** | Open/Edit/Save | 1024 | **FALHA** | terminate called without an active exception / GIMP Abortado |
| **A6.exr** | Open/Edit/Save | 1465 | SUCESSO | - |
| **A7.exr** | Open/Edit/Save | 1417 | SUCESSO | - |
| **A8.exr** | Open/Edit/Save | 1772 | SUCESSO | - |
| **A9.exr** | Open/Edit/Save | 1433 | SUCESSO | - |
| **A10.exr** | Open/Edit/Save | 1438 | SUCESSO | - |
| **A11.exr** | Open/Edit/Save | 1021 | **FALHA** | terminate called without an active exception / GIMP Abortado |
| **A12.exr** | Open/Edit/Save | 1829 | SUCESSO | - |
| **A13.exr** | Open/Edit/Save | 1476 | SUCESSO | - |
| **A14.exr** | Open/Edit/Save | 1894 | SUCESSO | - |
| **A15.exr** | Open/Edit/Save | 1574 | SUCESSO | - |
| **A16.exr** | Open/Edit/Save | 1022 | **FALHA** | terminate called without an active exception / GIMP Abortado |
| **A17.exr** | Open/Edit/Save | 1498 | SUCESSO | - |
| **A18.exr** | Open/Edit/Save | 1388 | SUCESSO | - |
| **TOTAIS** | **18 Arquivos** | **Total: 26.796ms** | **14 Sucessos / 4 Falhas** | **4 Crashes** |

A falha observada em todos os casos de insucesso é a ocorrência de “terminate called without an active exception”, mensagem típica da biblioteca padrão do C++ que sinaliza um erro grave e não tratado como uma exceção não capturada ou uma asserção falha dentro do plug-in file-exr. Esse erro força o sistema a interromper a execução (fatal error: abortado), provocando o crash imediato do GIMP e impedindo a finalização da operação. O conjunto desses indícios aponta para um claro problema de estabilidade funcional (M1.1) no módulo, possivelmente relacionado ao manejo inadequado de determinados dados ou metadados presentes nos arquivos EXR defeituosos.

As imagens utilizadas foram obtidas nos seguintes repositórios oficiais do OpenEXR:

- **OpenEXR Images Repository (GitHub):** https://github.com/AcademySoftwareFoundation/openexr-images
- **Documentação Oficial do OpenEXR:** https://openexr.com/en/latest/


#### Cálculos das Métricas (M1.1 e M1.2)

Com base nos dados corrigidos, recalculamos a Taxa de Sessões Livres de Falhas (TSLF) e estabelecemos a linha de base de desempenho (*baseline*) para o Linux.

**Tabela 2:** Resultado do Cálculo das Métricas de Adaptabilidade (Linux)

| Métrica | Fórmula | Valor Calculado | Critério de Aceitação (Hipótese Q1) |
| :--- | :--- | :--- | :--- |
| **M1.1: TSLF** | (Nº de Sessões sem Crash / Nº Total de Sessões) * 100 | $(14 / 18) \times 100 \approx \mathbf{77.78\%}$ | $\ge 99,9\%$ (Alta Estabilidade) |
| **M1.2: Desempenho (Baseline)** | $\sum \text{Tempo}_{\text{Linux}}$ | $\mathbf{26.796 \text{ ms}}$ (26,80s) | Referência para comparação com Windows |


### 3. Análise e Julgamento

A análise dos resultados no ambiente Linux confronta os valores obtidos com a **Hipótese (Q1)**, que sugere que o módulo é estável em todos os sistemas operacionais.

#### Julgamento da Hipótese de Estabilidade

O teste revelou uma falha de estabilidade **inesperada** no ambiente Linux (Ubuntu):

1.  **Baixa Taxa de Sucesso Funcional (M1.1):** O valor calculado de $\mathbf{77.78\%}$ situa-se abaixo do mínimo de 99,9% estabelecido. Esta baixa TSLF indica que o módulo `file-exr` não é totalmente estável no Linux, **refutando parcialmente a Hipótese Q1** quanto à estabilidade.
2.  **Achado Principal:** O log de execução confirmou que as falhas decorrem de um *crash* no próprio *plug-in* (`terminate called without an active exception`), o que força o GIMP a abortar a execução (`fatal error: Abortado`). Trata-se de um erro crítico que indica uma falha interna no módulo responsável pelo processamento de arquivos EXR.


**Tabela 3:** Resumo de Desempenho (Ambiente Linux)

| Métrica | Resultado Obtido | Critério de Aceitação (Q1) | Julgamento Parcial |
| :--- | :--- | :--- | :--- |
| **M1.1: TSLF** | $\mathbf{77.78\%}$ | $\ge 99,9\%$ | **REFUTADA PARCIALMENTE** |
| **M1.2: Tempo Total** | $\mathbf{26.796 \text{ ms}}$ | ℹ️ Informativo | *Baseline* definida |

**Conclusão:** O desempenho (M1.2) está estabelecido como *baseline*, mas a estabilidade (M1.1) é comprometida. A falha indica um problema de **Adaptabilidade** intrínseco ao código do `file-exr` que deve ser investigado, independentemente do sistema operacional.

**Próximos Passos:** É imperativo executar o mesmo conjunto de testes no ambiente **Windows 11**. Se o mesmo problema ocorrer, será evidenciado um defeito de código fonte (M1.1); se for estável no Windows, será evidenciada uma falha de portabilidade (M3.2).





## B. Execução do Teste de Instalabilidade (Q2 e Q3) - Ambiente Linux

O teste de Instalabilidade avalia a facilidade e a eficiência com que o módulo `file-exr` pode ser instalado e desinstalado no ambiente operacional. Devido à arquitetura monolítica do GIMP, esta etapa exigiu uma abordagem adaptada para isolar o desempenho do sistema de arquivos.

### 1. Procedimento de Execução e Restrições Técnicas

A execução foi planejada para medir o tempo e o sucesso das operações de instalação (registro do binário) e desinstalação (remoção do binário). No entanto, durante a fase de preparação, identificou-se uma barreira técnica significativa.

#### Restrição do Ambiente de Desenvolvimento
O módulo `file-exr` não possui um sistema de *build* autônomo. Ele depende da configuração global do GIMP (`autogen.sh` e `configure` na raiz do repositório). Como a avaliação partiu de uma instalação pré-existente do GIMP (via pacote `.deb`) e não de um ambiente de compilação completo (*build environment*), tornou-se inviável executar os comandos nativos `make install` isoladamente sem reconstruir toda a árvore de dependências do GIMP.

#### Solução: Simulação Controlada de I/O
Para contornar essa limitação e ainda assim obter métricas válidas de **tempo de operação do sistema** (M3.3) e **confiabilidade** (M2.1/M2.2), optou-se por um *script de simulação*. Este script reproduziu as operações exatas de I/O (Entrada/Saída) que o instalador realizaria (cópia do binário para o diretório de destino e remoção).

**Ações Concluídas:**

**Automação:** Execução do script `teste_instalabilidade_simulacao.sh` que realizou **10 ciclos ininterruptos** de instalação e desinstalação.

**Cronometragem:** Medição precisa (em milissegundos) do tempo que o *kernel* do Linux leva para processar a alocação e remoção do arquivo.


### 2. Medição (Dados Coletados)

A **Tabela 4** apresenta os resultados dos 10 ciclos de teste extraídos do arquivo `dados_instalabilidade_ubuntu_20251123_214457.csv`.

<p align="center">
<strong>Tabela 4:</strong> Resultados de Instalabilidade (Simulada) no Linux
<br>
</p>

| Ciclo | Operação                     | Status  | Instalação (ms) | Desinstalação (ms) |
| :---: | :---------------------------- | :-----: | :--------------: | :-----------------: |
|  1    | Instalação / Desinstalação   | SUCESSO |        3         |          3          |
|  2    | Instalação / Desinstalação   | SUCESSO |        4         |          3          |
|  3    | Instalação / Desinstalação   | SUCESSO |        3         |          3          |
|  4    | Instalação / Desinstalação   | SUCESSO |        3         |          2          |
|  5    | Instalação / Desinstalação   | SUCESSO |        3         |          2          |
|  6    | Instalação / Desinstalação   | SUCESSO |        3         |          2          |
|  7    | Instalação / Desinstalação   | SUCESSO |        5         |          6          |
|  8    | Instalação / Desinstalação   | SUCESSO |        4         |          5          |
|  9    | Instalação / Desinstalação   | SUCESSO |        4         |          2          |
| 10    | Instalação / Desinstalação   | SUCESSO |        4         |          2          |
| **MÉDIAS** | **(Base para M3.3)**     | **100% Êxito** | **3,6** | **3,0** |


#### Cálculos das Métricas (M2.1, M2.2 e M3.3)i

Com base na estabilidade dos 10 ciclos, calculamos as taxas de sucesso e o Tempo Médio de Instalação (TMI).

**Tabela 5:** Resultado das Métricas de Instalabilidade (Linux)

| Métrica | Fórmula | Valor Calculado | Critério (Hipótese Q2/Q3) |
| :--- | :--- | :--- | :--- |
| **M2.1: Sucesso Instalação** | (Sucessos / Total Ciclos) * 100 | $(10 / 10) \times 100 = \mathbf{100\%}$ | $\ge 90\%$ (Alta Confiabilidade) |
| **M2.2: Sucesso Desinstalação** | (Sucessos / Total Ciclos) * 100 | $(10 / 10) \times 100 = \mathbf{100\%}$ | $\ge 90\%$ (Alta Confiabilidade) |
| **M3.3: TMI (Linux)** | $\frac{\sum \text{Tempo Instal}}{10}$ | $\mathbf{3,6 \text{ ms}}$ | Referência para M3.2 |


### 3. Análise e Julgamento

A análise no ambiente Linux valida a capacidade do sistema de gerenciar os arquivos do módulo sem impedimentos.

#### Julgamento das Hipóteses Q2 e Q3

1.  **Viabilidade Técnica (Q2):** A simulação confirmou que, isolando o binário, as operações de instalação e remoção são triviais e bem-sucedidas em **100%** dos casos.
2.  **Consistência (Q3):** O desvio padrão entre os tempos é baixíssimo. O ambiente Linux demonstrou altíssima consistência e rapidez nas operações de I/O, com um Tempo Médio de Instalação (TMI) de apenas $\mathbf{3,6 \text{ ms}}$.

**Tabela 6:** Resumo de Instalabilidade (Ambiente Linux)

| Métrica | Resultado | Status | Julgamento Parcial |
| :--- | :--- | :--- | :--- |
| **M2.1 / M2.2** | $\mathbf{100\%}$ |  Aprovado | **EXCELENTE** |
| **M3.3 (Tempo)** | $\mathbf{3,6 \text{ ms}}$ | ℹ Informativo | *Baseline* definida (Muito Rápido) |


**Conclusão da Etapa:** A impossibilidade de executar o ambiente completo de desenvolvimento foi contornada por meio de uma simulação de I/O. Embora essa abordagem não seja a ideal, ela é suficiente para fins didáticos da disciplina. O ambiente Linux estabeleceu um *baseline* de desempenho de instalação extremamente rápido (~3,60 ms), que servirá como referência para comparação com o ambiente Windows na próxima fase de avaliação.



## C. Execução do Teste de Substituibilidade (Métricas 4.1, 4.2 e 4.3)

Esta etapa da avaliação tem como objetivo mensurar o esforço técnico e humano necessário para atualizar uma dependência crítica do módulo `file-exr` (especificamente a biblioteca `libopenexr`).

### 1. Contexto e Dificuldades Técnicas (Relatório de Impedimento)

Antes de prosseguir com o roteiro, é mandatório destacar a **elevada barreira de entrada** para a execução deste teste.

* **Ausência de Documentação Clara:** Não existe um tutorial oficial unificado ou atualizado que guie desenvolvedores na compilação de *plugins* isolados do GIMP contra versões específicas (e não padrão) de bibliotecas externas. A documentação existente foca na compilação do GIMP inteiro com as dependências padrão do sistema.
* **Complexidade do Ambiente de Desenvolvimento:** Configurar um ambiente que permita a troca "limpa" de uma biblioteca base (como migrar da `OpenEXR v2` para `v3`) exige conhecimento avançado de ferramentas de *build* (`autotools`, `meson`, `pkg-config`) e gerenciamento de variáveis de ambiente (`LD_LIBRARY_PATH`, `PKG_CONFIG_PATH`).
* **Risco de "Dependency Hell":** No Windows (via MSYS2), forçar uma versão de biblioteca diferente daquela fornecida pelo gerenciador de pacotes (`pacman`) pode quebrar não apenas o módulo `file-exr`, mas todo o GIMP e outras ferramentas instaladas, exigindo a compilação manual de toda a cadeia de dependências.

Devido a esses fatores, a avaliação a seguir descreve o **procedimento padrão ideal**, assumindo que o avaliador possui o conhecimento técnico para resolver conflitos de vinculação (*linking*) manualmente.

Neste sentido, limitamo-nos a listar os passos que seriam adotados.

---

### 2. Procedimento no Ambiente Linux (Ubuntu)

No Linux, o controle sobre as bibliotecas é mais transparente, facilitando a simulação da troca de dependência.

#### Passo 1: Preparação e "Sabotagem" Controlada
1.  **Identificar Versão Atual:** Verifique a versão instalada (`pkg-config --modversion OpenEXR`).
2.  **Simular a Troca (Cenário de Teste):**
    * O avaliador deve tentar compilar o módulo utilizando uma versão mais recente da biblioteca (ex: compilando a `OpenEXR v3.1` manualmente em `/opt/openexr-v3` e apontando o GIMP para ela) OU alterando o código fonte do módulo para usar uma função que foi depreciada/alterada na nova versão, forçando a necessidade de refatoração.

#### Passo 2: Medição do Esforço (M4.1 e M4.2)
1.  **Cronometragem (M4.1):** Inicie o cronômetro assim que começar a editar os arquivos `.c` ou `configure.ac` para adaptá-los à nova biblioteca.
2.  **Adaptação:** Edite o código até que o comando `make` execute sem erros.
3.  **Registro:** Pare o cronômetro (Tempo Humano Gasto).
4.  **Complexidade (M4.2):** Execute o comando abaixo na pasta do plugin para contar as linhas alteradas:
    ```bash
    git diff --stat
    ```

#### Passo 3: Teste de Regressão (M4.3)
Após compilar com sucesso, instale o módulo (`sudo make install`) e execute o script de regressão para garantir que a "atualização" não quebrou funcionalidades existentes.

* **Script:** `./teste_regressao_substituibilidade.sh` (baseado no script de adaptabilidade, mas focado em detectar falhas de I/O).

---

### 3. Procedimento no Ambiente Windows 11 (MSYS2)

No Windows, a dependência do ambiente MSYS2 torna a substituição de bibliotecas extremamente complexa, pois o sistema `pacman` gerencia versões pré-compiladas.

#### Passo 1: Preparação do Ambiente
1.  Abra o terminal **MSYS2 MinGW 64-bit**.
2.  Assegure-se de ter o *toolchain* completo:
    ```bash
    pacman -S mingw-w64-x86_64-toolchain mingw-w64-x86_64-gimp
    ```

#### Passo 2: O Desafio da Substituição
Diferente do Linux, você não pode simplesmente instalar uma versão "dev" diferente via `apt`.
1.  **Manual Build:** Você deve baixar o código fonte da `OpenEXR` (nova versão), compilá-lo manualmente dentro do MSYS2 e instalá-lo em um prefixo customizado (`/usr/local` ou `/opt`).
2.  **Configuração:** Alterar as variáveis de ambiente `PKG_CONFIG_PATH` para priorizar essa nova instalação manual em vez da versão do sistema (`/mingw64`).

#### Passo 3: Medição e Regressão
O processo de medição segue a mesma lógica do Linux, mas executado dentro do terminal MSYS2.

1.  **Adaptação e Build:**
    ```bash
    # Dentro da pasta do plugin no MSYS2
    make clean
    # Força recompilação contra a nova lib
    make
    ```
2.  **Métricas M4.1 e M4.2:** Registre o tempo gasto lidando com erros de *linker* (comuns no Windows) e use `git diff --stat` para medir as alterações no código.
3.  **Métrica M4.3:** Execute o script de teste adaptado para o shell do MSYS2 ou PowerShell para verificar se os arquivos EXR ainda abrem corretamente.

---

### 4. Tabela de Coleta de Dados (Template)

Os dados obtidos devem ser registrados conforme o modelo abaixo para compor o relatório final.

| Métrica | Descrição | Valor Obtido (Exemplo) | Critério de Sucesso |
| :--- | :--- | :--- | :--- |
| **M4.1** | **Esforço de Adaptação (Tempo)** | *ex: 4 horas e 30 min* | $\le 8$ horas |
| **M4.2** | **Complexidade (Linhas de Código)** | *ex: 145 linhas (inserções/deleções)* | $\le 5\%$ do total de linhas do módulo |
| **M4.3** | **Sucesso Funcional (Regressão)** | *ex: 90% (27/30 testes passaram)* | $\ge 95\%$ (Sem regressão crítica) |

### Conclusão Parcial da Substituibilidade

Devido à falta de documentação oficial para *builds* modulares e à complexidade de gerenciar dependências C++ manualmente no Windows, prevê-se que o **esforço (M4.1)** seja significativamente maior no ambiente Windows do que no Linux, impactando negativamente a avaliação de Portabilidade neste quesito.




## Dificuldades

Ao longo da execução do plano de avaliação, diversas dificuldades técnicas foram identificadas. A principal delas foi a impossibilidade de reproduzir integralmente o ambiente de desenvolvimento do GIMP, já que o módulo `file-exr` não possui um sistema de *build* independente e depende da árvore completa de compilação do projeto. Isso impediu a execução direta dos procedimentos de instalação previstos, exigindo a adoção de uma simulação controlada de I/O como alternativa. Além disso, a ausência de documentação oficial clara sobre a recompilação modular do GIMP e a complexidade envolvida na substituição de dependências especialmente em ambientes Windows representaram barreiras significativas. Essas limitações demandaram adaptações metodológicas e redirecionamentos no escopo da avaliação, reforçando o desafio de testar portabilidade em software com arquitetura fortemente integrada.



## Conclusão

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor                                          | Revisor                                        |
| :----- | :--------- | :------------------------------------------------ | :--------------------------------------------- | :--------------------------------------------- |
| 1.0    | 13/11/2025 | Criação do Documento.                             | [Caio Venâncio](https://www.github.com/caio-venancio) | [Vinicius Castelo](https://github.com/Vini47)  |
| 2.0    | 19/11/2025 | Adicionado informações ao Documento (Portabilidade). | [Vinicius Castelo](https://github.com/Vini47)  | [Caio Venâncio](https://www.github.com/caio-venancio) |
