# Confiabilidade

## Introdução

Este artefato tem como objetivo aplicar o método [GQM (Goal-Question-Metric)](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/fase2/#sobre-o-gqm) para entender o módulo `file-exr` do GIMP sob o critério de Confiabilidad. A proposta é definir metas, perguntas e métricas que permitam analisaro o módulo, identificando possíveis limitações e oportunidades de melhoria.

## Metodologia

A metodologia adotada neste artefato baseia-se no método [GQM](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/fase2/#sobre-o-gqm), que orienta a avaliação da qualidade de software de forma estruturada e orientada a objetivos. Inicialmente, é definido o objetivo de análise, neste caso, entender a **confiabilidade** do módulo `file-exr` do GIMP. Em seguida, são formuladas perguntas que permitam investigar aspectos específicos, definidos na [Fase 1](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase1/5-modelo/#4-adaptacao-do-modelo), relacionados a esse critério, como a frequência de falhas em uso contínuo ou a capacidade de lidar com arquivos corrompidos. Por fim, são estabelecidas métricas que quantifiquem os resultados observados, possibilitando uma avaliação objetiva e comparável.

## Descrição do Objetivo de Medição de Confiabilidade

<p align="center"><strong>Tabela 1: Descrição do Objetivo de Medição de Qualidade</strong></p>

|        Dimensão           |                   Descrição                     |
| ------------------------- | ----------------------------------------------- |
| Analisar                  | GIMP (Módulo File-exr)                          |
| Para o propósito de       | Entender                                        |
| Com respeito a            | Confiabilidade                                  | 
| Da perspectiva do         | Designer Gráfico                                |
| No contexto de            | Disciplina de Qualidade de software             |


<font size="3"><p style="text-align: center">Fonte: Autores. (2025)</p></font>

## Questões e Métricas

Para detalhar o objetivo, derivamos 3 perguntas. Para cada pergunta, formulamos uma hipótese e definimos as métricas (nível quantitativo) necessárias para testá-la.

### Q1. O módulo é estável durante o uso cotidiano e prolongado?

**Hipótese (H1):** Espera-se que o módulo seja estável para o uso diário, apresentando poucas falhas (baixa Taxa de Falhas) e operando por longos períodos sem travar (alto MTBF).

Esta hipótese será testada usando as seguintes métricas:

#### Métrica 1.1: Taxa de Falhas (Failure Rate)

> **Fórmula:**
>
> `Nº total de falhas / Tempo total de uso (em horas)`
>
> **Referência:** [[6]](#ref-6), [[9]](#ref-9)
>
> **Interpretação (Critério):**
>
> - **Alta Confiabilidade (H1 Confirmada):** < 0.01 falhas/hora
> - **Média Confiabilidade:** 0.01 - 0.05 falhas/hora
> - **Baixa Confiabilidade (H1 Refutada):** > 0.05 falhas/hora

#### Métrica 1.2: Tempo Médio Entre Falhas (MTBF)

> **Fórmula:**
>
> `Tempo total de uso (em horas) / Nº total de falhas`
>
> **Referência:** [[3]](#ref-3), [[9]](#ref-9)
>
> **Interpretação (Critério):**
>
> - **Alta Confiabilidade (H1 Confirmada):** > 100 horas
> - **Média Confiabilidade:** 50 - 100 horas
> - **Baixa Confiabilidade (H1 Refutada):** < 50 horas

---

### Q2. O módulo lida bem com condições de uso adversas ou inesperadas?

**Hipótese (H2):** Espera-se que o módulo seja robusto, mantendo-se operacional ao lidar com arquivos grandes e tratando arquivos corrompidos de forma controlada.

Esta hipótese será testada usando as seguintes métricas:

#### Métrica 2.1: Taxa de Sucesso sob Carga

> **Fórmula:**
>
> `(Operações OK / Total de operações) * 100` (calculada por categoria de carga)
>
> **Referência:** [[2]](#ref-2), [[10]](#ref-10)
>
> **Interpretação (Critério para Carga "Grande"):**
>
> - **Alta Robustez (H2 Confirmada):** > 90%
> - **Média Robustez:** 70% - 90%
> - **Baixa Robustez (H2 Refutada):** < 70%

#### Métrica 2.2: Taxa de Tratamento de Entradas Inválidas

> **Fórmula:**
>
> `(Erros tratados sem crash / Total de arquivos corrompidos testados) * 100`
>
> **Referência:** [[7]](#ref-7)
>
> **Interpretação (Critério):**
>
> - **Alta Tolerância (H2 Confirmada):** > 95%
> - **Média Tolerância:** 80% - 95%
> - **Baixa Tolerância (H2 Refutada):** < 80%

---

### Q3. Quão fácil é se recuperar de um erro ou falha?

**Hipótese (H3):** Espera-se que o módulo forneça bons mecanismos de recuperação, permitindo que o usuário restaure seu trabalho facilmente e que as falhas sejam fáceis de diagnosticar.

Esta hipótese será testada usando as seguintes métricas:

#### Métrica 3.1: Taxa de Recuperação Automática

> **Fórmula:**
>
> `(Sessões com restauração de EXR / Total de crashes com EXR não salvo) * 100`
>
> **Referência:** [[8]](#ref-8)
>
> **Interpretação (Critério):**
>
> - **Alta Recuperabilidade (H3 Confirmada):** > 80%
> - **Média Recuperabilidade:** 50% - 80%
> - **Baixa Recuperabilidade (H3 Refutada):** < 50%

#### Métrica 3.2: Tempo Médio para Reparo (MTTR)

> **Fórmula:**
>
> `Tempo total gasto para restaurar o trabalho / Nº total de falhas`
>
> **Referência:** [[1]](#ref-1), [[9]](#ref-9)
>
> **Interpretação (Critério):**
>
> - **Alta Recuperabilidade (H3 Confirmada):** < 2 minutos
> - **Média Recuperabilidade:** 2 - 5 minutos
> - **Baixa Recuperabilidade (H3 Refutada):** > 5 minutos


## Conclusão

O uso do método GQM foi fundamental para esta análise, pois permitiu transformar o conceito abstrato de "confiabilidade" em um plano de avaliação concreto para o módulo file-exr. Ao focar em subcaracterísticas como Maturidade, Tolerância a Falhas, Disponibilidade e Recuperabilidade, conseguimos ir além do "achismo".

As métricas definidas nos deram um roteiro claro para quantificar o comportamento do módulo em cenários reais: o que acontece no uso diário, como ele reage a um arquivo corrompido e, o mais importante, se o usuário consegue recuperar seu trabalho após um travamento.

Esta análise servirá de base para a próxima fase. Com os dados coletados, poderemos identificar os pontos fortes e as oportunidades de melhoria..

> *OBS: Modelos de Linguagem de Grande Escala foram utilizados para realizar-se o brainstorm entre possíveis perguntas e possíveis métricas. Também foi utilizado para auxiliar na escrita em Markdown.*

## Sobre o uso de IA

Para a elaboração deste documento, a Inteligência Artificial foi utilizada como ferramenta de apoio. Desta maneira, o seu uso concentrou-se, principalmente, em auxiliar a **compreensão e o esclarecimento dos termos técnicos** presentes nas normas (ISO/IEC 25010) e nos artigos e corporativos consultados. Adicionalmente, a IA foi empregada para a **estruturação e organização das ideias** na aplicação da metodologia GQM.

## Referências Bibliográficas

<a id="ref-1"></a>[1] CORTEX. *How to choose your software reliability metrics*. 2024. Disponível em: `https://www.cortex.io/post/how-to-choose-your-software-reliability-metrics`. Acesso em: 21 out. 2025.

<a id="ref-2"></a>[2] JONES, B., et al. *Site Reliability Engineering: How Google Runs Production Systems*. (Capítulo: "Monitoring Distributed Systems"). O'Reilly Media, 2016. Disponível em: `https://sre.google/sre-book/monitoring-distributed-systems/`. Acesso em: 21 out. 2025.

<a id="ref-3"></a>[3] IBM. *What Is Mean Time between Failure (MTBF)?*. 2023. Disponível em: `https://www.ibm.com/think/topics/mtbf`. Acesso em: 21 out. 2025.

<a id="ref-4"></a>[4] INTERNATIONAL ORGANIZATION FOR STANDARDIZATION. **ISO/IEC 25010**: System and software engineering — Systems and software Quality Requirements and Evaluation (SQuaRE) — System and software quality models. Geneva: ISO, 2011.

<a id="ref-5"></a>[5] PERFORCE. *What Is ISO 25010? | Perforce Software*. (Referência para Analysability/Diagnosability). 2021. Disponível em: `https://www.perforce.com/blog/qac/what-is-iso-25010`. Acesso em: 21 out. 2025.

<a id="ref-6"></a>[6] PRESSMAN, R. S.; MAXIM, B. R. **Software Engineering: A Practitioner's Approach**. 9. ed. McGraw-Hill Education, 2019.

<a id="ref-7"></a>[7] PUBNUB. *What is Fault Tolerance? System Design & Engineering*. 2024. Disponível em: `https://www.pubnub.com/learn/glossary/fault-tolerance`. Acesso em: 21 out. 2025.

<a id="ref-8"></a>[8] SERVERION. *Top 5 Backup Performance Metrics to Track*. (Referência para Backup/Recovery Success Rate). 2025. Disponível em: `https://www.serverion.com/uncategorized/top-5-backup-performance-metrics-to-track`. Acesso em: 21 out. 2025.

<a id="ref-9"></a>[9] SPLUNK. *Failure Metrics & KPIs for IT Systems*. 2025. Disponível em: `https://www.splunk.com/en_us/blog/learn/failure-metrics.html`. Acesso em: 21 out. 2025.

<a id="ref-10"></a>[10] VICTORONSOFTWARE. *Top 5 metrics for software load testing performance*. 2025. Disponível em: `https://victoronsoftware.com/posts/software-load-testing/`. Acesso em: 21 out. 2025.

## Histórico de Versão

| Versão | Data | Descrição | Autor | Revisor |
| --- | ---: | --- | --- | --- |
| 1.0 | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47) | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1 | 08/10/2025 | Descrição do Objetivo de Medição de Confiabilidade | [Caio Venâncio](https://www.github.com/caio-venancio) | [Arthur Evangelista](https://www.github.com/arthurevg) |
| 1.2 | 12/10/2025 | Adição de referências e ajustes no documento | [Arthur Evangelista](https://www.github.com/arthurevg) | [Vinicius Castelo](https://github.com/Vini47) |
| 1.3 | 13/10/2025 | Conserta tabela. | [Breno Alexandre](https://github.com/brenoalexandre0) | [Vinicius Castelo](https://github.com/Vini47)|
| 1.4 | 19/10/2025 | Modificações sujeridas em aula foram aplicadas | [Vinicius Castelo](https://github.com/Vini47) | [Arthur Evangelista](https://www.github.com/arthurevg) |
| 1.5 | 21/10/2025 | Aplicação de modificações sugeridas em sala de aula durante o PC2| [Arthur Evangelista](https://www.github.com/arthurevg) | [Vinicius Castelo](https://github.com/Vini47) |
| 1.6 | 21/10/2025 | Correções/Adições na Introdução, Metodologia e Conclusão | [Arthur Evangelista](https://www.github.com/arthurevg) |[Pedro Everton](https://github.com/pedroeverton217) |
| 1.7 | 25/10/2025 | Consertar tabela |  [Caio Venâncio](https://www.github.com/caio-venancio) |[Breno Alexandre](https://github.com/brenoalexandre0)|