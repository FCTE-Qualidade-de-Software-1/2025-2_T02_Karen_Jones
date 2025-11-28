# Execução do Plano de Avaliação - Quanto à Confiabilidade

## Introdução

## 1. Procedimento Executado

### Contexto e Ferramentas
Como descrito autoriormente na [Fase 3](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase3/1-confiabilidade/#ferramentas-e-metodos-de-coleta), as métricas 1.1, 1.2 e 2.1, que tratam de Maturidade, Disponibilidade e Tolerância a Falhas respectivamente foram medidas através de um feito em Batchfiles para Terminal de Windows, disponível na pasta `tests/scripts/run-open-exr.bat`, e depois calculadas via a fórmula descrita na [Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/1-confiabilidade/#questoes-e-metricas), com os dados resultantes disponíveis na pasta `tests/resultados` e da pasta `testes/logs`.

- [Medição da Métrica 1.1 - Taxa de Falhas (Failure Rate)](#medicao-da-metrica-11-taxa-de-falhas-failure-rate)
- [Medição da Métrica 1.2 - Tempo Médio Entre Falhas (MTBF)](#medicao-da-metrica-12-tempo-medio-entre-falhas-mtbf)
- [Medição da Métrica 2.1 - Taxa de Sucesso sob Carga](#medicao-da-metrica-21-taxa-de-sucesso-sob-carga)

Já as métricas 2.2, 3.1, e 3.2, foram feitas testes de forma manual, utilizando manipulação de arquivos validos e corrompidos, presentes respectivamente nas pastas `tests/validos` e `tests/corrompidos`.

- [Medição da Métrica 2.2 - Taxa de Tratamento de Entradas Inválidas](#medicao-da-metrica-22-taxa-de-tratamento-de-entradas-invalidas)
- [Medição da Métrica 3.1 - Taxa de Recuperação Automática](#medicao-da-metrica-31-taxa-de-recuperacao-automatica)
- [Medição da Métrica 3.2 - Tempo Médio para Reparo (MTTR)](#medicao-da-metrica-32-tempo-medio-para-reparo-mttr)

### Medição da Métrica 1.1 - Taxa de Falhas (Failure Rate)

**Descrição:** Aqui se utiliza os documentos em `tests/resultados` e em `testes/logs` depois de se ter executado por aproximadamente 10 horas, e se contabiliza a quantidade de falhas e quantidade total de tempo em execução, e depois segue-se a fórmula.
> `Nº total de falhas / Tempo total de uso (em horas)`

<div align="center">
    Figura 1: Vídeo sobre o algoritmo rodando, que será utilizado para as métricas 1.1, 1.2 e 2.1.
    <br>
    <iframe width="560" height="315" src="https://www.youtube.com/embed/kwgDWN2eY1A?si=axz553FnZgH3qAl7" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    <br>
     <b> Autor: </b> <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>
<br>


### Medição da Métrica 1.2 - Tempo Médio Entre Falhas (MTBF)

**Descrição:** Aqui se utiliza os documentos em `tests/resultados` e em `testes/logs` depois de se ter executado por aproximadamente 10 horas, e se contabiliza quantidade total de tempo em execução e a quantidade de falhas em execução, e depois segue-se a fórmula.
> `Tempo total de uso (em horas) / Nº total de falhas`

<div align="center">
    Figura 2: Quantidade de falhas detectada pelos arquivos de log com horário gerados pela rotina, utilizados para esta métrica.
    <br>
    <img src="../confiabilidade-img/falhasTotal.png">
    <br>
     <b> Autor: </b> <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>

### Medição da Métrica 2.1 - Taxa de Sucesso sob Carga

**Descrição:** Aqui se utiliza os documentos em `tests/resultados` e em `testes/logs` depois de se ter executado por aproximadamente 10 horas, e se contabiliza o total de operações bem sucedidas e a quantidade total de operações, e depois segue-se a fórmula.
> `(Operações OK / Total de operações) * 100 (calculada por categoria de carga)`

<div align="center">
    Figura 3: Todos os testes e logs gerados pelo algoritmo automático, que marcam a quantidade de operações para esta métrica.
    <br>
    <img src="../confiabilidade-img/arquivosTotais.png">
    <br>
     <b> Autor: </b> <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>

### Medição da Métrica 2.2 - Taxa de Tratamento de Entradas Inválidas

**Descrição:** Aqui utilizamos um total de 20 arquivos corrompidos, presentes na pasta `tests/corrompidos` cada um com uma particularidade diferente, e foi observado como o GIMP tratou esses arquivos. Após realizar todos os testes, foi utilizada a seguinte fórmula para verificar a Taxa de Tratamento de Entradas Inválidas:
> `(Erros tratados sem crash / Total de arquivos corrompidos testados) * 100`

O vídeo relacionado a essa medição se encontra abaixo:

<div align="center">
    <iframe width="560" height="315" src="https://www.youtube.com/embed/bMoGJJA11dg?si=axz553FnZgH3qAl7" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    <br>
        <b> Autor: </b> <a href="https://github.com/arthurevg">Arthur Evangelista</a>.
    <br>
</div>

### Medição da Métrica 3.1 - Taxa de Recuperação Automática

**Descrição:** Aqui, simulamos alguns crashes utilizando o 'Finalizar Tarefa' do Windows enquanto alguma tarefa estava sendo realizada no GIMP. Após isso, foi utilizada a seguinte fórmula para verificar a Taxa de Recuperação Automática:
> `(Sessões com restauração de EXR / Total de crashes com EXR não salvo) * 100`

O vídeo relacionado a essa medição se encontra abaixo:

<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/Fz_zGd75TIg?si=jtSgcJM4z6dRYCdQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    <br>
        <b> Autor: </b> <a href="https://github.com/arthurevg">Arthur Evangelista</a>.
    <br>
</div>

`` *Nota*: foram realizados mais testes, mas durante essa 'simulação de crash', foi utilizado o comnando `ALT + F4`, que fez com que o gravador parasse.``

### Medição da Métrica 3.2 - Tempo Médio para Reparo (MTTR)

**Descrição:** Aqui, foram utilizados os "Crashes" simulados da Métrica anterior, e cronometrado o tempo entre o Crash acontecer, e o usuário restaurar o trabalho. Após isso, utilizamos a seguinte fórmula para verificar o Tempo Médio para Reparo:
> `(Tempo total gasto para restaurar o trabalho / Nº total de falhas) * 100`

O vídeo relacionado a essa medição se encontra abaixo:

<div align="center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/Fz_zGd75TIg?si=jtSgcJM4z6dRYCdQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
    <br>
        <b> Autor: </b> <a href="https://github.com/arthurevg">Arthur Evangelista</a>.
    <br>
</div>

## 2. Medição (Dados Coletados)

Esta seção apresenta o resultado do cálculo de cada métrica, o valor final obtido e o critério de aceitação GQM correspondente (para ser julgado na próxima seção).

<p align="center"><strong>Tabela 1: Resultados Consolidados da Avaliação de Confiabilidade</strong></p>

| Métrica (Q) | Característica | Fórmula & Cálculo (Exemplo) | Critério de Aceitação (GQM) |
| :--- | :--- | :--- | :--- |
| **M1.1 (Q1)** Taxa de Falhas | Maturidade e Disponibilidade | 3 falhas / 9,75 horas = **0,3076 falhas/h** | 0.01 - 0.05 falhas/hora(Média Maturidade)  |
| **M1.2 (Q1)** MTBF | Maturidade e Disponibilidade| 9,75 horas / 3 falhas = **3,25 horas/falha** | < 5 horas: (Baixa Maturidade) |
| **M2.1 (Q2)** Taxa de Sucesso sob Carga | Tol. a Falhas (Carga) | 7.492 op. OK / 7.495 total op. x 100 = **99,96%** | > 90% (Alta tolerância) |
| **M2.2 (Q2)** Taxa de Tratamento | Tol. a Falhas (Entrada) | 20 tratados / 20 testes x 100 = **100%** | > 95% (Alta Tolerância) |
| **M3.1 (Q3)** Taxa de Recup. Automática | Recuperabilidade | 0 restaurados / 6 crashes x 100 = **0%** | 0% (Baixa Recuperabilidade) |
| **M3.2 (Q3)** MTTR | Recuperabilidade | 9.6 min. / 6 falhas = **1.6 min/falha** | < 2 minutos/falha (Alta Recuperabilidade) |

<div align="center">
        <b> Autores: </b> <a href="https://github.com/arthurevg">Arthur Evangelista</a> e <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>


## 3. Análise e Julgamento

A análise dos resultados da execução comparou os valores obtidos com os critérios de aceitação estabelecidos na Fase 2. Com isso, foi possível identificar uma **instabilidade crítica** no módulo file-exr, falhando nas subcaracterísticas de Maturidade e Recuperabilidade.

A **Tabela 2** sumariza o desempenho do módulo file-exr na Confiabilidade, comparando as métricas de produto com os limites estabelecidos.

<p align="center"><strong>Tabela 2: Desempenho e Julgamento das Hipóteses</strong></p>

| Métrica | Resultado Obtido | Critério de Aceitação | Julgamento |
| :--- | :--- | :--- | :--- |
| **M1.1: Taxa de Falhas** | **0,3076 falhas/h** | < 0.05 falhas/h | **REFUTADA** |
| **M1.2: MTBF** | **3,25 horas** | < 5 horas | **REFUTADA** |
| **M2.1: Sucesso sob Carga** | **99,96%%** | > 90% | **CONFIRMADA** |
| **M2.2: Taxa de Tratamento de Entradas Inválidas** | **100%** | > 90% | **CONFIRMADA** |
| **M3.1: Recup. Automática** | **0%** | > 80% | **REFUTADA** |
| **M3.2: MTTR** | **1.6 min/falha** | < 2 min/falha | **CONFIRMADA** |

---

### Discussão dos Resultados e Julgamento

O teste de **Maturidade** (métricas 1.1 e 1.2) indicou falha na direta na hipótese H1, sobre estabilidade do módulo. Antes, acreditava-se que o módulo fosse estável para uso diário e que apresentasse poucas falhas ou não travasse por longos períodos e agora é possível constatar, pelas medições 1.1 e 1.2 que isso não é verdade.

Já a hipótese H2 é confirmada nesta medição, já que as medições 2.1 e 2.2 tiveram bons resultados de acordo com nosso critério, confirmando a expectativa do módulo se manter operacional mesmo com arquivos grandes ou corrompidos.

O teste de **Recuperação** M3 indicou uma falha direta na hipótese H3, que previa facilidade de recuperação. Além disso, embora a Métrica 3.2 tenha sido confirmada nesse caso, foi possível observar que ela é proporcional ao tamanho da tarefa, ou seja, uma tarefa de 8 horas, duraria aproximadamente 8 horas para refazer em caso de crash. Sendo assim, os resultados da execução confirmaram a necessidade de aprimoramento urgente no módulo file-exr:

* **Recuperabilidade Crítica (H3 Refutada):** Nenhum arquivo foi restaurado com sucesso após um Crash. Esta falha é catastrófica, pois a perda de dados após uma falha não é mitigada. Conforme observado, um erro pode levar à **perda total de horas de trabalho** se o usuário não tiver salvado manualmente.
* **Julgamento Final:** Concluiu-se que o módulo **file-exr não atende aos requisitos de Confiabilidade** esperados, **refutando a Hipóteses H3** e expondo um alto risco de perda de produtividade.

---

### Achados e Melhoria Proposta

A análise da natureza das falhas revelou que o problema central reside na falta de mecanismos de segurança contra a instabilidade e não na capacidade de processamento de dados do módulo.

* **Ponto Forte:** **Robustez de Processamento**. O módulo lida bem com a complexidade dos arquivos EXR, conforme M2.1 e M2.2.
* **Ponto Fraco Crítico:** **Falta de Auto-Save/Recuperação de Sessão**. A raiz dos problemas de Recuperabilidade é a ausência de um sistema de salvamento automático eficaz para arquivos EXR, o que transforma uma falha técnica em uma catástrofe de dados para o usuário.
* **Segundo Ponto Fraco:** **Falha após longos perídodos de execução**. A maturidade da operação de leitura do módulo FileEXR I/O se mostrou falha uma vez que depois de um número exaustivo de execução ocorreram falhas críticas, o que pode aceitável para operação de leitura uma vez que aconteceu a cada 3 horas, mas em apenas 0,04% das operações.

**Melhoria Proposta:**

* **Melhoria Específica:** Sugere-se desenvolver um mecanismo de **Recuperação Automática de Sessão** específico para o formato EXR, que registre o estado de trabalho (metadados e camadas) em intervalos regulares (ex: a cada 5 minutos ou a cada ação crítica).
* **Impacto Esperado:** Diminui o risco de perda de horas de trabalho, elevando a **Recuperabilidade (H3)** para o nível aceitável.

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|     [Arthur Evangelista](https://www.github.com/arthurevg)   |
|1.1     | 18/11/2025 | Adição de 'esqueleto' do documento  |[Arthur Evangelista](https://www.github.com/arthurevg) |[Caio Venâncio](https://www.github.com/caio-venancio)|
|1.2     | 24/11/2025 | Melhorar de 'esqueleto' do documento  | [Caio Venâncio](https://www.github.com/caio-venancio) |[Arthur Evangelista](https://www.github.com/arthurevg)|
|1.3     | 24/11/2025 | Adicionar descrições e comentários  | [Caio Venâncio](https://www.github.com/caio-venancio) |[Arthur Evangelista](https://www.github.com/arthurevg)|
|1.4     | 24/11/2025 | Adição dos dados referente as Métricas 2.2, 3.1 e 3.2  |[Arthur Evangelista](https://www.github.com/arthurevg) | [Caio Venâncio](https://www.github.com/caio-venancio)|
|1.5     | 24/11/2025 | Adicionar dos dados referente as Métricas 1.1, 1.3 e 2.1  | [Caio Venâncio](https://www.github.com/caio-venancio) |[Arthur Evangelista](https://www.github.com/arthurevg)|