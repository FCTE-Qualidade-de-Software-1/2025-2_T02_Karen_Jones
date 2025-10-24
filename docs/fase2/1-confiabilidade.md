# Confiabilidade

## Introdução

Este artefato tem como objetivo aplicar o método GQM (Goal-Question-Metric) para entender o módulo `file-exr` do GIMP sob o critério de Confiabilidad. A proposta é definir metas, perguntas e métricas que permitam analisaro o módulo, identificando possíveis limitações e oportunidades de melhoria.

## Metodologia

A metodologia adotada neste artefato baseia-se no método GQM, que orienta a avaliação da qualidade de software de forma estruturada e orientada a objetivos. Inicialmente, é definido o objetivo de análise, neste caso, entender a **confiabilidade** do módulo `file-exr` do GIMP. Em seguida, são formuladas perguntas que permitam investigar aspectos específicos relacionados a esse critério, como a frequência de falhas em uso contínuo ou a capacidade de lidar com arquivos corrompidos. Por fim, são estabelecidas métricas que quantifiquem os resultados observados, possibilitando uma avaliação objetiva e comparável. Essa abordagem garante coerência entre os dados coletados e o propósito de avaliação, promovendo uma análise consistente e orientada à melhoria contínua da qualidade do módulo.

## Descrição do Objetivo de Medição de Confiabilidade

<p align="center"><strong>Tabela 1: Descrição do Objetivo de Medição de Qualidade</strong></p>

|        Dimensão           |                   Descrição                     |
| ------------------------- | ----------------------------------------------- |
| Objeto da análise         | GIMP (Módulo File-exr)                          |
| Propósito                 | Entender                                        |
| Característica de análise | Confiabilidade                                  | 
| Perspectiva de Avaliação  | Designer Gráfico                                |
| Contexto                  | Disciplina de Qualidade de software             |


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

#### Métrica 3.3: Taxa de Diagnóstico (Logs)

> **Fórmula:**
>
> `(Bugs reproduzidos a partir do log / Total de bugs reportados com log) * 100`
>
> **Referência:** [[5]](#ref-5)
>
> **Interpretação (Critério):**
>
> - **Alta Analisabilidade (H3 Confirmada):** > 80%
> - **Média Analisabilidade:** 50% - 80%
> - **Baixa Analisabilidade (H3 Refutada):** < 50%
---

## Conclusão

O uso do método GQM foi fundamental para esta análise, pois permitiu transformar o conceito abstrato de "confiabilidade" em um plano de avaliação concreto para o módulo file-exr. Ao focar em subcaracterísticas como Maturidade, Tolerância a Falhas, Disponibilidade e Recuperabilidade, conseguimos ir além do "achismo".

As métricas definidas nos deram um roteiro claro para quantificar o comportamento do módulo em cenários reais: o que acontece no uso diário, como ele reage a um arquivo corrompido e, o mais importante, se o usuário consegue recuperar seu trabalho após um travamento.

Esta análise servirá de base para a próxima fase. Com os dados coletados, poderemos identificar os pontos fortes e as oportunidades de melhoria..

> *OBS: Modelos de Linguagem de Grande Escala foram utilizados para realizar-se o brainstorm entre possíveis perguntas e possíveis métricas. Também foi utilizado para auxiliar na escrita em Markdown.*

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
| 1.5 | 21/10/2025 | Correções/Adições na Introdução, Metodologia e Conclusão | [Arthur Evangelista](https://www.github.com/arthurevg) |[Pedro Everton](https://github.com/pedroeverton217) |

<!-- 
## Questões e Métricas

### Q1. Quanto à maturidade, o módulo File-exr opera sem falhas em uso prolongado e repetitivo?

- Taxa de falhas (Failure Rate) = nº de falhas / tempo de uso.

> O objetivo é verificar se ele mantém o funcionamento correto mesmo após várias operações de abertura e exportação de arquivos EXR, sem apresentar travamentos, vazamentos de memória ou falhas recorrentes.
> A métrica “Taxa de falhas (Failure Rate)” indica a frequência com que ocorrem erros por unidade de tempo de uso — quanto menor, mais maduro e estável é o módulo.

### Q2. Quanto à disponibilidade, o GIMP mantém a opção de abrir/salvar EXR ativa durante toda a sessão de edição?

- Incidência de indisponibilidade pós-carga (availability ratio) = nº eventos de indisponibilidade / horas de uso.

> Ela verifica se, após longas sessões ou múltiplas edições, o módulo continua permitindo exportar e importar arquivos EXR sem desativar menus ou gerar falhas.
> A métrica “Incidência de indisponibilidade pós-carga (Availability Ratio)” quantifica o número de períodos em que o módulo ficou indisponível por hora de uso.

### Q3. Quanto à disponibilidade, O módulo continua funcional mesmo após abrir arquivos de diferentes tamanhos?

- Taxa de sucesso sob carga (load reliability) = operações OK com N camadas abertas / total.

> O foco é observar se o desempenho e a estabilidade se mantêm, sem perda de responsividade nem erros de memória.
A métrica “Taxa de sucesso sob carga (Load Reliability)” mede a proporção de operações concluídas com sucesso em relação ao total executado sob diferentes condições.

### Q4. Quanto à tolerância a falhas, O módulo identifica e rejeita arquivos EXR corrompidos sem comprometer o sistema?

- Erro tratado sem crash  = erros de leitura tratados / erros induzidos.

### Q5. Quanto à recuperabilidade, Logs ou mensagens de erro permitem identificar e reproduzir a falha?

- Reprodutibilidade via logs = bugs reproduzidos a partir do log / bugs com log.

### Q6. Quanto à recuperabilidade, O GIMP oferece recuperação automática de arquivos EXR não salvos após travamento?

- Auto-recuperação bem-sucedida (successful recovery rate) = sessões com restauração de EXR não salvo / crashes.

---

## Observação prévia — Conhecer a métrica

> Antes de executar qualquer medição é necessário **conhecer** o que cada métrica representa, suas limitações e como os dados serão coletados. Abaixo, para cada questão, está explicitado: **o que se deseja saber** (objetivo investigativo), **o que será medido** (variáveis e medições), a **métrica para registro**, **o critério padrão** e a **hipótese / resposta esperada**. Isso evita perguntas que já contenham a resposta e garante medições interpretáveis.

## Questões (reduzidas e específicas) e Métricas

> Nota: o total de perguntas foi reduzido de 6 para 4 por combinação de temas relacionados. Ao final listo as combinações/eliminações.

### Q1. Maturidade operacional: o módulo mantém comportamento estável durante uso prolongado e repetitivo?
- **O que se deseja saber:** se o módulo apresenta aumento de falhas, degradação de desempenho perceptível ou comportamento anômalo ao ser usado por longos períodos ou em uso repetitivo.
- **O que será medido:** número de falhas observadas, tempo total de uso (horas), e ocorrência de comportamentos anômalos (ex.: lentidão crescente, leaks de memória detectados no monitoramento).
- **Métrica (registro):** Taxa de falhas = número de falhas / tempo de uso.
- **Critério (padrão):** [definir limiar] — exemplo sugerido: aceitável se Taxa de falhas ≤ 0,01 falhas/hora.
- **Hipótese / Resposta esperada:** o módulo apresentará baixa taxa de falhas em uso prolongado, sem crescimento consistente de anomalias ao longo do tempo.

---

### Q2. Disponibilidade e robustez sob variação de carga: a funcionalidade de abrir/editar/salvar EXR permanece operacional ao longo da sessão e quando variam-se tamanhos e número de camadas?
- **O que se deseja saber:** se a opção de abrir/salvar EXR permanece disponível durante a sessão e se operações críticas continuam bem-sucedidas ao abrir arquivos com diferentes tamanhos e complexidades (número de camadas).
- **O que será medido:** eventos de indisponibilidade durante sessões (contagem e duração), número de operações bem-sucedidas vs. tentativas para arquivos categorizados por tamanho e camadas (ex.: pequeno/médio/grande; 1/10/50 camadas).
- **Métrica (registro):**
  - Incidência de indisponibilidade = nº eventos de indisponibilidade / horas de uso.
  - Taxa de sucesso por categoria de carga = operações OK / total de operações naquela categoria.
- **Critério (padrão):** [definir limiares por categoria] — exemplo sugerido: disponibilidade aceitável quando incidência ≈ 0; taxa de sucesso mínima aceitável por categoria (ex.: ≥ 95% para pequenas, ≥ 90% para médias, ≥ 80% para grandes).
- **Hipótese / Resposta esperada:** a funcionalidade permanecerá disponível durante a maioria das sessões e as taxas de sucesso decrescerão gradualmente com o aumento da carga, permanecendo dentro de limites de aceitabilidade do fluxo de trabalho.

---

### Q3. Tolerância a entradas inválidas/corrompidas: o módulo detecta arquivos EXR corrompidos e trata o erro sem comprometer outras operações ou provocar crash?
- **O que se deseja saber:** se arquivos corrompidos são identificados corretamente, se o tratamento é localizado (sem afetar demais janelas/arquivos) e se o aplicativo evita crashes ou perda de dados de outras imagens abertas.
- **O que será medido:** número de arquivos corrompidos (induzidos em teste), número de incidentes onde o erro foi tratado sem crash, e efeitos colaterais observados (ex.: perda de camadas em outras janelas, instabilidade subsequente).
- **Métrica (registro):** Erros tratados sem crash = erros de leitura tratados / erros induzidos.
- **Critério (padrão):** [definir limiar] — exemplo sugerido: tratamento sem crash ≥ 95%.
- **Hipótese / Resposta esperada:** o módulo identificará a maioria dos EXR corrompidos e tratará localmente sem provocar crash do GIMP ou perda de outras imagens.

---

### Q4. Recoverability e diagnóstico (logs): os logs e mecanismos de recuperação permitem restaurar trabalho e reproduzir falhas?
- **O que se deseja saber:** se os logs contêm informações suficientes para reproduzir falhas e se existe recuperação automática de arquivos EXR não salvos após travamentos.
- **O que será medido:** proporção de bugs reproduzidos a partir do log / bugs registrados com log; número de crashes que resultaram em restauração bem-sucedida de EXR não salvo / total de crashes envolvendo EXR não salvo.
- **Métrica (registro):**
  - Reprodutibilidade via logs = bugs reproduzidos a partir do log / bugs com log.
  - Taxa de recuperação automática = sessões com restauração de EXR não salvo / crashes.
- **Critério (padrão):** [definir limiares] — exemplo sugerido: reprodutibilidade via logs ≥ 0,8; recuperação automática ≥ 0,8.
- **Hipótese / Resposta esperada:** logs fornecerão pistas suficientes para reproduzir a maioria das falhas críticas; recuperação automática funcionará em uma parcela significativa dos crashes que envolveram EXR não salvo.

---

## Leitura do resultado — como interpretar as métricas

Para cada métrica reportada, siga estes passos de leitura:

1. **Verificar a unidade e período de coleta** (p.ex. falhas por hora, taxa por sessão). Sem unidade clara, a métrica pode enganar.  
2. **Comparar com critério aceitável**: utilize os critérios definidos (ou proponha valores iniciais) para decidir se o resultado é adequado.  
3. **Analisar tendências**: preferir análises temporais (ex.: gráfico de falhas por semana) a um único valor agregado.  
4. **Investigar discrepâncias**: se uma métrica está fora do esperado, revisar logs, condições de teste (tamanhos de arquivo, número de camadas) e ambiente (hardware, versão libEXR).  
5. **Reportar contexto**: ao publicar resultados, incluir contexto de testes (versão do GIMP, SO, hardware, dataset de EXR utilizado).

### Exemplos de interpretação curta

- Taxa de falhas = 0,002 falhas/hora em 500 horas de uso — indica maturidade aparente, porém investigar picos localizados.  
- Incidência de indisponibilidade pós-carga = 0,1 eventos/hora — significa que em média surge 1 evento a cada 10 horas; avaliar aceitabilidade segundo fluxo do usuário.  
- Erros tratados sem crash = 0,98 — bom indicador de tolerância a arquivos corrompidos; revisar os 2% restantes.

---

> *OBS: Modelos de Linguagem de Grande Escala foram utilizados para realizar-se o Brainstorm entre possíveis perguntas e possíveis métricas.*

## Referências Bibliográficas

> INTERNATIONAL ORGANIZATION FOR STANDARDIZATION. ISO/IEC 25000: Software engineering — Software product Quality Requirements and Evaluation (SQuaRE) — Guide to SQuaRE. First edition. Geneva: ISO, 2005.

## Histórico de Versão

| Versão | Data | Descrição | Autor | Revisor |
| --- | ---: | --- | --- | --- |
| 1.0 | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47) | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1 | 08/10/2025 | Descrição do Objetivo de Medição de Confiabilidade | [Caio Venâncio](https://www.github.com/caio-venancio) | [Arthur Evangelista](https://www.github.com/arthurevg) |
| 1.2 | 12/10/2025 | Adição de referências e ajustes no documento | [Arthur Evangelista](https://www.github.com/arthurevg) | [Vinicius Castelo](https://github.com/Vini47) |
| 1.3 | 13/10/2025 | Conserta tabela. | [Breno Alexandre](https://github.com/brenoalexandre0) | [Vinicius Castelo](https://github.com/Vini47)|
| 1.4 | 19/10/2025 | Modificações sujeridas em aula foram aplicadas | [Vinicius Castelo](https://github.com/Vini47) | [Arthur Evangelista](https://www.github.com/arthurevg) | -->
