# Portabilidade

## Introdução

Este artefato tem como objetivo aplicar o método GQM (Goal-Question-Metric) para entender o módulo file-exr do GIMP sob o critério de portabilidade. A proposta é definir metas, perguntas e métricas que permitam analisar a capacidade do módulo de ser transferido, adaptado e executado em diferentes ambientes, identificando possíveis limitações e oportunidades de melhoria. Dessa forma, o artefato servirá como base para a coleta e análise de dados que apoiem a tomada de decisões voltadas à qualidade e à manutenção do módulo.

## Metodologia

A metodologia adotada neste artefato baseia-se no método GQM, que orienta a avaliação da qualidade de software de forma estruturada e orientada a objetivos. Inicialmente, é definido o objetivo de análise, neste caso, entender a portabilidade do módulo file-exr do GIMP. Em seguida, são formuladas perguntas que permitam investigar aspectos específicos relacionados a esse critério, como a ocorrência de erros em diferentes ambientes ou a facilidade de adaptação do módulo. Por fim, são estabelecidas métricas que quantifiquem os resultados observados, possibilitando uma avaliação objetiva e comparável. Essa abordagem garante coerência entre os dados coletados e o propósito de avaliação, promovendo uma análise consistente e orientada à melhoria contínua da qualidade do módulo.

## Descrição do Objetivo de Medição de Portabilidade

<p align="center"><strong>Tabela 3: Descrição do Objetivo de Medição de Qualidade</strong></p>

|        Dimensão           |                   Descrição                     |
|---------------------------|-------------------------------------------------|
| Analisar                  | GIMP (Módulo File-exr)                          |
| Para o propósito de       | Entender                                        |
| Com respeito a            | Portabilidade                                   | 
| Da perspectiva do         | Designer Gráfico                                |
| No contexto de            | Disciplina de Qualidade de software             |

<font size="3"><p style="text-align: center">Fonte: Autores. (2025)</p></font>


## Questões e Métricas

### Q1. Quanto a Adaptabilidade, o módulo se comporta de formas diferentes em diferentes sistemas operacionais?

#### Hipótese: O módulo se comporta exatamente da mesma forma em qualquer sistema operacional, limitando-se a diferença de desempenho.

#### Métrica 1.1: Taxa de Sessões Livres de Falhas entre Plataformas

> **Fórmula:**
>
> `Taxa de Sessões Livres de Falhas = 1 - Sessões com Falha/Total de Sessões`
>
> `Execuções bem-sucedidas em diferentes sistemas operacionais / Total de execuções em diferentes sistemas operacionais`
>
> **Referência:** [[2]](#ref-2)
>
> **Interpretação:**
>
> - **Alta semelhança de execução (Hipótese Confirmada):** ≥ 99,9% de execuções bem-sucedidas em todas as plataformas
> - **Alta semelhança de execução (Hipótese Refutada):** < 99,9% de execuções bem-sucedidas em todas as plataformas  
>
> Esta métrica avalia o quão adaptado é o módulo para diferentes sistemas operacionais. Quanto maior a taxa de execuções bem-sucedidas, melhor a adaptabilidade do módulo entre plataformas. A referência [[2]](#ref-2) do Google Firebase sobre Crash em sessões e em usuários menciona como as falhas devem ser extremamente improváveis e uma única falha gera perda de credibilidade do usuário, e no nosso caso, na adaptabilidade do sistema.

#### Métrica 1.2: Desvio de Desempenho entre diferentes plataformas

> **Fórmula:**
>
> `|Desempenho no Sistema A - Desempenho no Sistema B| / Desempenho médio`
> 
> `com Desempenho sendo carga de Load Testing, Stress Testing e Volume Testing`
>
> **Referência:** [[3]](#ref-3), [[4]](#ref-4), [[5]](#ref-5)
>
> **Interpretação:**
>
> - **Desvio Médio de Desempenho:** ≤ 5% de variação entre plataformas
> - **Alto Desvio de Desempenho (Hipótese Refutada):** > 5% de variação entre plataformas  
>
> O desvio de desempenho mede **a diferença no tempo de execução** do módulo entre diferentes plataformas. Um baixo desvio indica que o módulo mantém uma performance consistente em diferentes sistemas, enquanto um alto desvio pode indicar problemas de adaptação.

### Q2. Quanto a Instalabilidade, é possível instalar e desinstalar somente o módulo file-exr?

#### Hipótese: Não é possível instalar e desinstalar somente o módulo file-exr, uma vez que ao retirá-lo o gimp não funciona adequadamente ou gera builds inconsistentes.

#### Métrica 2.1: Taxa de Sucesso na Instalação (Installation Success Rate)

> **Fórmula:**
>
> `Instalações bem-sucedidas / Total de tentativas de instalação`
>
> **Referência:** [[6]](#ref-6), [[8]](#ref-8)
>
> **Interpretação:**
> - **Alta taxa de sucesso (Hipótese Confirmada):** ≥ 90% de tentativas bem-sucedidas
> - **Baixa taxa de sucesso (Hipótese Refutada):** < 90% de tentativas bem-sucedidas
>  
> Esta métrica avalia a **facilidade** do processo de instalação, sem complicações ou erros que possam ocorrer durante a tentativa de adicionar o módulo ao GIMP.

#### Métrica 2.2: Taxa de Sucesso na Desinstalação (Uninstallation Success Rate)

> **Fórmula:**
>
> `Desinstalações bem-sucedidas / Total de tentativas de desinstalação`
>
> **Referência:** [[6]](#ref-6), [[7]](#ref-7), [[8]](#ref-8)
>
>
> **Interpretação:**
> - **Alta taxa de sucesso (Hipótese Confirmada):** ≥ 90% de tentativas de desinstalação bem-sucedidas
> - **Baixa taxa de sucesso (Hipótese Refutada):** < 90% de tentativas de desinstalação bem-sucedidas
>  
> Avalia a **eficiência do processo de desinstalação**, garantindo que o módulo seja removido sem deixar resíduos ou causar falhas no GIMP.

### Q3. Quanto a Instalabilidade, o processo de instalação do módulo costuma apresentar erros ou inconsistências em diferentes ambientes?

#### Hipótese: O processo de instalação do módulo é consistente entre ambientes distintos (distros, versões de SO, arquiteturas), apresentando apenas variação de desempenho e sem falhas específicas por ambiente.

#### Métrica 3.1: Taxa de Sucesso de Instalação por Ambiente

> Fórmula:
> 
> `Taxa de Sucesso (ambiente X) = Instalações bem‑sucedidas em X / Total de tentativas em X`
> 
> **Referência:** [[6]](#ref-6), [[8]](#ref-8)
>
> **Interpretação:**
> - **Hipótese Confirmada:** ≥ 95% de sucesso em cada ambiente testado
> - **Hipótese Refutada:** < 95% em algum ambiente
>
> Avalia se a instalação funciona de forma confiável em cada ambiente isoladamente.

#### Métrica 3.2: Desvio Relativo de Sucesso entre Ambientes

> Fórmula:
> 
> `Desvio Relativo = |TaxaX - TaxaY| / Taxa_média_entre_ambientes
(avaliar pares ou calcular desvio padrão relativo entre todas as taxas)`
> 
> **Referência:** [[3]](#ref-3), [[4]](#ref-4)
>
> Interpretação:
> - **Consistência Alta (Hipótese Confirmada):** Desvio Relativo ≤ 5%
> - **Inconsistência Significativa (Hipótese Refutada):** Desvio Relativo > 5%
> 
> Mede quão uniforme é o sucesso de instalação entre ambientes.

#### Métrica 3.3: Diferença no Tempo e Tipos de Falha entre Ambientes

> Fórmula:
> 
> `Diferença de Tempo = |Tempo médio instalação em A - Tempo médio em B| / Tempo médio geral
Taxa de Falhas Específicas = Ocorrências de erro tipo T em ambiente X / Total de tentativas em X`
> 
> **Referência:** [[5]](#ref-5), [[7]](#ref-7)
>
> Interpretação:
> - **Hipótese Confirmada:** Variação de tempo ≤ 10% e nenhuma falha tipo específica com taxa > 1% por ambiente
> - **Hipótese Refutada:** Variação de tempo > 10% ou existência de falhas específicas > 1%
> 
> Detecta diferenças práticas (tempo) e presença de erros direcionados a ambientes (dependências ausentes, permissões, toolchain).

### Q4. Quanto a Substituibilidade, é fácil substituir dependências dos módulo File-exr por outras bibliotecas ou versões?

#### Hipótese: A substituição de dependências do módulo File-exr é um processo complexo que exige modificações significativas no código e pode comprometer a funcionalidade.

#### Métrica 4.1: Taxa de Compatibilidade com Versões Alternativas

> Fórmula:
>
> `Número de versões alternativas compatíveis / Total de versões testadas`
>
> **Referência:** [[1]](#ref-1), [[7]](#ref-7)
>
> Interpretação:
> - **Alta Compatibilidade (Hipótese Refutada):** ≥ 80% das versões são compatíveis
> - **Baixa Compatibilidade (Hipótese Confirmada):** < 80% das versões são compatíveis
>
> Avalia a flexibilidade do módulo em trabalhar com diferentes versões de suas dependências principais.

#### Métrica 4.2: Esforço de Adaptação para Novas Dependências

> Fórmula:
> 
> `Linhas de código modificadas / Total de linhas do módulo`
> 
> `Tempo médio (em horas) para adaptar uma nova dependência`
> 
> **Referência:** [[1]](#ref-1), [[8]](#ref-8)
>
> Interpretação:
> - **Baixo Esforço (Hipótese Refutada):** ≤ 5% de modificações no código e ≤ 8 horas de adaptação
> - **Alto Esforço (Hipótese Confirmada):** > 5% de modificações ou > 8 horas de adaptação
> 
> Quantifica o trabalho necessário para substituir uma dependência existente por uma alternativa.

#### Métrica 4.3: Taxa de Sucesso em Testes após Substituição

> Fórmula:
> 
> `Número de testes bem-sucedidos após substituição / Total de testes existentes`
> 
> **Referência:** [[7]](#ref-7)
>
> Interpretação:
> - **Alta Confiabilidade (Hipótese Refutada):** ≥ 95% dos testes passam após substituição
> - **Baixa Confiabilidade (Hipótese Confirmada):** < 95% dos testes passam após substituição
> 
> Mede o impacto da substituição de dependências na estabilidade do módulo através da execução da suite de testes existente.

## Conclusões

Com a aplicação do método GQM, foi possível compreender de forma mais clara como o módulo file-exr do GIMP se comporta em relação à portabilidade, analisando aspectos como adaptabilidade, instalabilidade e substituibilidade. As métricas definidas ajudaram a observar como o módulo reage em diferentes sistemas operacionais, quanto tempo leva e quão consistente é o processo de instalação, além de verificar o quão simples é substituir suas dependências. Essa análise trouxe uma visão prática sobre os pontos fortes e as possíveis melhorias do módulo, contribuindo para torná-lo mais flexível e fácil de manter em diversos ambientes.

> *OBS: Modelos de Linguagem de Grande Escala foram utilizados para realizar-se o brainstorm entre possíveis perguntas e possíveis métricas. Também foi utilizado para auxiliar na escrita em Markdown.*

## Referências Bibliográficas

<a id="ref-1"></a>[1] FENTON, Norman; BIEMAN, James. Software Metrics: A Rigorous and Practical Approach. 3. ed. Boca Raton: CRC Press, 2015.

<a id="ref-2"></a>[2]  GOOGLE. Firebase Crashlytics: Métricas de crash-free. Disponível em: https://firebase.google.com/docs/crashlytics/crash-free-metrics?hl=pt-br
. Acesso em: 24 out. 2025.

<a id="ref-3"></a>[3] HEADSPIN. Gain Insight Into Cross-Platform Performance Metrics. HeadSpin Blog, 2023. Disponível em: https://www.headspin.io/blog/gain-insight-into-cross-platform-performance-metrics
. Acesso em: 24 out. 2025.

<a id="ref-4"></a>[4] B. BUMGARDNER. Benchmarking: When can I stop making measurements? Stack Overflow, 2009. Disponível em: https://stackoverflow.com/questions/1390047/benchmarking-when-can-i-stop-making-measurements
. Acesso em: 24 out. 2025.

<a id="ref-5"></a>[5] LINKEDIN ENGINEERING. How We Identify and Stop Slow Latency Leaks at LinkedIn. 2017. Disponível em: https://www.linkedin.com/blog/engineering/optimization/fixing-the-plumbing-how-we-identify-and-stop-slow-latency-leaks
. Acesso em: 24 out. 2025.

<a id="ref-6"></a>[6] ADJUST. How to track app uninstalls: Everything you need to know. Disponível em: https://www.adjust.com/blog/how-to-track-app-installs-and-uninstalls/
. Acesso em: 24 out. 2025.

<a id="ref-7"></a>[7] INTERNATIONAL ORGANIZATION FOR STANDARDIZATION. ISO/IEC 25036:2011 – Systems and software engineering — Systems and software Quality Requirements and Evaluation (SQuaRE) — Quality in use measures. Geneva: ISO, 2011.

<a id="ref-8"></a>[8] REPLICATED. Instance Insights: Install Success Rate. 2023. Disponível em: https://replicated.com/blog/instance-insights-install-success-rate
. Acesso em: 24 out. 2025.

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47) | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 12/10/2025 | Adição de tabela e questões. | [Breno Alexandre](https://github.com/brenoalexandre0), [Pedro Everton](https://github.com/pedroeverton217) | [Breno Alexandre](https://github.com/brenoalexandre0) |
| 1.2    | 13/10/2025 | Conserta fórmulas. | [Breno Alexandre](https://github.com/brenoalexandre0) | [Caio Venâncio](https://www.github.com/caio-venancio) |
| 1.3    | 19/10/2025 | Conserta perguntas.  | [Caio Venâncio](https://www.github.com/caio-venancio) | [Breno Alexandre](https://github.com/brenoalexandre0) |
| 1.4    | 21/10/2025 | Refatora os artefatos.  | [Breno Alexandre](https://github.com/brenoalexandre0), [Caio Venâncio](https://www.github.com/caio-venancio)  | [Arthur Evangelista](https://github.com/arthurevg) |
| 1.5    | 24/10/2025 | Adição da declaração de uso de IA.  | [Arthur Evangelista](https://github.com/arthurevg)| [Caio Venâncio](https://www.github.com/caio-venancio) |
| 1.6 | 25/10/2025 | Consertar tabela |  [Caio Venâncio](https://www.github.com/caio-venancio) |[Breno Alexandre](https://github.com/brenoalexandre0)
| 1.7 | 25/10/2025 | Responder Q3 e Q4. |  [Breno Alexandre](https://github.com/brenoalexandre0) | [Caio Venâncio](https://www.github.com/caio-venancio) |
