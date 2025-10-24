# Compatibilidade

## Introdução

Conforme analisado na [**Fase 1**](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase1/fase1/), com base na norma [**ISO/IEC 25010 (SQuaRE)**](https://blog.onedaytesting.com.br/iso-iec-25010/), que define os principais atributos de qualidade de software, destaca-se a **Compatibilidade** como um critério essencial. Assim, como é descrito na norma, esse atributo representa a capacidade de um produto de **trocar informações** e **executar funções** enquanto compartilha recursos com outros sistemas. 

Conforme a norma, a Compatibilidade se divide em duas subcaracterísticas fundamentais:

- **Interoperabilidade:** diz respeito à habilidade do software de trocar e utilizar dados de forma eficiente com outros sistemas, aspecto importante no caso do formato **EXR** a qual está sendo analisado.  
- **Coexistência:** refere-se à capacidade do software de **operar corretamente em um ambiente compartilhado**, sem causar nem sofrer interferências durante o uso de recursos.

Com base nisso, este trabalho aplica a metodologia **Goal-Question-Metric (GQM)** ao módulo **File-exr** do **GIMP**. Essa abordagem segue o princípio de medição **top-down**, no qual se definem primeiro os **objetivos estratégicos** e, a partir deles, as **questões** e **métricas** necessárias à análise, como é explicado em [The mystery behind project management metrics](https://www.pmi.org/learning/library/project-management-metrics-mystery-9304)

Assim como é explicado em [*LANSA - Measurement Objectives*](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/), a aplicação do GQM tem como propósito **melhorar a qualidade do software** e **otimizar o processo de desenvolvimento**, o qual será utilizado para reforçar e realizar a análise da qualidade da compatibilidade.

## Objetivo

O principal objetivo deste documento é **estruturar e formalizar o programa de medição GQM** para o fator **Compatibilidade** do GIMP. Para tal, o foco será dado às suas subcaracterísticas que representam os pontos críticos para do software. Dessa maneira, pretende-se transformar as necessidades de informação dos *stakeholders* em um conjunto gerenciável de métricas validadas. Em última análise, o objetivo também é fornecer *insights* acionáveis para a equipe de desenvolvimento para cumprir as funções de **Análise** e **Controle** do projeto [LANSA](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/)

## Metodologia

A medição de *software* é um processo sistemático que, como defendido na literatura, deve compreender cinco atividades interligadas: **Formulação**, **Coleta**, **Análise**, **Interpretação** e **Feedback** [LANSA - Measurement Principles](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/).

Neste trabalho, o método **GQM (Goal-Question-Metric)** é empregado como princípio na análise e a sua estrutura top-down alinha o projeto com modelos de maturidade como o [LANSA - CMMI Context](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/).

A análise da qualidade, portanto, será abrangente ao utilizar uma combinação de métricas do [ELITEX - Quality Metrics](https://elitex.systems/blog/software-quality):

* **Métricas de Produto**: para avaliar o artefato `File-exr`;
* **Métricas de Processo**: para avaliar as atividades de desenvolvimento);
* **Métricas de Projeto**: para o controle de esforço).

A **Interpretação**, por fim, será realizada ao confrontar os dados coletados com as hipóteses (critérios de aceitação) definidas nas questões, o que garante que a avaliação da Compatibilidade seja objetiva, baseada em dados e, crucialmente, relevante para o fluxo de trabalho do usuário de acordo com o [MoldStud - Compatibility Importance](https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance).


## Descrição do Objetivo de Medição de Compatibilidade

| Dimensão | Descrição |
| -------- | --------- |
| **Objeto da Análise** | GIMP (Módulo File-exr). |
| **Propósito** | **Analisar** a **conformidade com o padrão OpenEXR** e a **fidelidade na troca de dados** do módulo. |
| **Característica de Análise** | Compatibilidade (Interoperabilidade e Coexistência) |
| **Perspectiva de Avaliação** | Designer Gráfico |
| **Contexto** | Avaliação formal para fins didáticos da Disciplina de Qualidade de Software |




## Questões e Métricas

### Q1. Qual o grau de fidelidade e confiança do GIMP na troca de dados com o ecossistema externo de aplicações gráficas?

**Hipótese (H1):** Espera-se que o módulo apresente alta fidelidade de intercâmbio ao garantir que a Taxa de Sucesso Funcional (TSF) seja elevada e o risco de quebra no fluxo de trabalho (DDT) seja baixo.


#### Métrica 1.1: Taxa de Sucesso Funcional (TSF)

Esta métrica mede a eficácia na realização de uma tarefa com base no estudo do artigo [MOLDSTUD - Test Pass Rates](https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance). Portanto, ela indicará a confiabilidade do módulo File-exr no fluxo de intercâmbio de dados.

> **Fórmula:**
>
> TSF (%) = (Número de Casos de Intercâmbio Sucedidos / Número Total de Casos de Intercâmbio Testados) * 100
>
> **Referência:** [[5]](#ref-5)
>
> **Interpretação (Critério):**
>
> - **Alta Interoperabilidade (H1 Confirmada):** $\geq 95\%$
> - **Média Interoperabilidade:** $90\% \text{ a } 95\%$
> - **Baixa Interoperabilidade (H1 Refutada):** $< 90\%$

#### Métrica 1.2: Densidade de Defeitos por Teste (DDT)

Esta métrica quantifica a qualidade do módulo com base na relação entre defeitos encontrados e o volume de testes executados inspirados em [MOLDSTUD - Defect Density](https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance). Ela é um indicador de risco.

> **Fórmula:**
>
> $$DDT = \frac{\text{Nº de Defeitos de Interoperabilidade}}{\text{Nº Total de Casos de Teste Executados}}$$
>
> **Referência:** [[5]](#ref-5)
>
> **Interpretação (Critério):**
>
> - **Baixo Risco (H1 Confirmada):** $< 0.5$ defeitos/caso de teste
> - **Risco Moderado:** $0.5 \text{ a } 1.0$ defeitos/caso de teste
> - **Alto Risco (H1 Refutada):** $> 1.0$ defeitos/caso de teste



### Q2. Quais são os custos de recursos (tempo e memória) que o módulo File-exr impõe ao sistema GIMP em um ambiente de usuário final?

**Hipótese (H2):** Espera-se que o módulo demonstre alta Coexistência, com baixo impacto no tempo de inicialização (APTC) e no consumo de memória (APCM).

#### Métrica 2.1: Aumento Percentual no Tempo de Carregamento (APTC)

Mede o impacto na experiência do usuário ao iniciar o software, isso porque um atraso excessivo é um sintoma de baixa Coexistência e prejudica a produtividade do Designer Gráfico.

> **Fórmula:**
>
> APTC (%) = ((Tempo de Carregamento com Módulo - Tempo sem Módulo) / Tempo sem Módulo) * 100
>
> **Referência:** [[4]](#ref-4)
>
> **Interpretação (Critério):**
>
> - **Alta Coexistência (H2 Confirmada):** $\leq 5\%$
> - **Coexistência Moderada:** $5\% \text{ a } 15\%$
> - **Baixa Coexistência (H2 Refutada):** $> 15\%$

#### Métrica 2.2: Aumento Percentual no Consumo de Memória (APCM)

Mede a eficiência com que o módulo utiliza a memória do sistema ao ser um indicador de **Utilização de Recursos**. Módulos com alto consumo de memória na inicialização podem causar lentidão no sistema operacional.

> **Fórmula:**
>
> APCM (%) = ((Consumo de Memória com Módulo - Consumo sem Módulo) / Consumo sem Módulo) * 100
>
> **Referência:** [[1]](#ref-1) (Referência genérica para métricas de recurso)
>
> **Interpretação (Critério):**
>
> - **Alta Coexistência (H2 Confirmada):** $\leq 10\%$
> - **Coexistência Moderada:** $10\% \text{ a } 20\%$
> - **Baixa Coexistência (H2 Refutada):** $> 20\%$



### Q3. O quanto estável e robusto é o módulo File-exr em produção ao refletir a eficácia de nosso processo de garantia de qualidade?

**Hipótese (H3):** Espera-se que o módulo seja altamente estável (baixo DDPL) e que o processo de correção de *bugs* de compatibilidade seja rápido, indicando alta estabilidade no uso.

#### Métrica 3.1: Densidade de Defeitos Pós-Lançamento (DDPL)

Mede a concentração de problemas que chegam ao usuário, sendo um indicador crucial de falha na garantia da qualidade (**QA Testing & Processes**).

> **Fórmula:**
>
> $$DDPL = \frac{\text{Nº de Defeitos de Compatibilidade Reportados Pós-lançamento}}{\text{Tamanho do Módulo em KLOC}}$$
>
> **Referência:** [[3]](#ref-3) (ELITEX - Defect Density)
>
> **Interpretação (Critério):**
>
> - **Alta Estabilidade (H3 Confirmada):** $< 1.0$ defeito/KLOC
> - **Estabilidade Moderada:** $1.0 \text{ a } 3.0$ defeitos/KLOC
> - **Baixa Estabilidade (Hipótese Refutada):** $> 3.0$ defeitos/KLOC

#### Métrica 3.2: Tempo Médio de Resolução (TMR)

Métrica de **Processo** para avaliar a eficiência da equipe de manutenção na resposta a falhas. Um TMR baixo é um indicador de **Alta Eficiência de Manutenção** para *bugs* de compatibilidade [MOLDSTUD - Resolution Timelines](https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance).

> **Fórmula:**
>
> $$TMR = \frac{\sum \text{Tempo de Resolução}}{\text{Nº Total de Defeitos Resolvidos}}$$
>
> **Referência:** [[5]](#ref-5) 
>
> **Interpretação (Critério):**
>
> - **Alta Eficiência (H3 Confirmada):** $< 48$ horas
> - **Eficiência Moderada:** $48 \text{ a } 96$ horas
> - **Baixa Eficiência (Hipótese Refutada):** $> 96$ horas



### Q4. De que forma a arquitetura do módulo File-exr pode aumentar a dificuldade e o custo de manutenção em plataformas distintas?

**Hipótese (H4):** Espera-se que a arquitetura do módulo apresente baixa Complexidade Ciclomática (CCM) e baixo Índice de Esforço Não-Comum (IENC), indicando facilidade de manutenção em diversos ambientes.


#### Métrica 4.1: Índice de Esforço Não-Comum (IENC)

Métrica de **Recurso/Projeto** que indica o percentual do custo do projeto (Esforço) alocado em código que não pode ser reutilizado entre plataformas para medir a dependência de código específico de cada sistema operacional.

> **Fórmula:**
>
> IENC (%) = (Esforço em código específico da Plataforma / Esforço Total do Módulo) * 100
>
> **Referência:** [[4]](#ref-4)
> 
> **Interpretação (Critério):**
>
> - **Alta Facilidade (H4 Confirmada):** $\leq 10\%$
> - **Dificuldade Moderada:** $10\% \text{ a } 20\%$
> - **Alta Dificuldade (H4 Refutada):** $> 20\%$

#### Métrica 4.2: Complexidade Ciclomática Média (CCM)

Métrica de **Produto** que indica a complexidade lógica do código. Módulos com alta CCM são mais difíceis de testar e manter o que viola os princípios de **Design Simples** [ELITEX - Compliance with Best Design Principles](https://elitex.systems/blog/software-quality).

> **Fórmula:**
>
> $$CCM = \frac{\sum \text{Complexidade Ciclomática das Funções de Compatibilidade}}{\text{Nº Total de Funções de Compatibilidade}}$$
>
> **Referência:** [[3]](#ref-3) (ELITEX - Compliance with Best Design Principles)
>
> **Interpretação (Critério):**
>
> - **Baixa Complexidade (H4 Confirmada):** $< 10$
> - **Risco Moderado:** $10 \text{ a } 15$
> - **Alto Risco (H4 Refutada):** $> 15$





## Referências Bibliográficas


<a id="ref-1"></a>[1] ABREU, Bruno. **A ISO/IEC 25010 e sua importância para a qualidade de software**. One Day Testing Blog, 29 mar. 2023. Disponível em: https://blog.onedaytesting.com.br/iso-iec-25010/. Acesso em: 22 out. 2025.

<a id="ref-2"></a>[2] BASILI, Victor R.; CALDIERA, Gianluigi; ROMBACH, H. Dieter. **The Goal Question Metric Approach** (1994). **In**: *Encyclopedia of Software Engineering*. (Conceito GQM e metodologia top-down).

<a id="ref-3"></a>[3] ELITEX. **Software Quality Metrics: What Is This Really About?** (2024). Disponível em: https://elitex.systems/blog/software-quality. Acesso em: 22 out. 2025. (Tipos de métricas, performance, segurança, usabilidade).

<a id="ref-4"></a>[4] LANSA. **What Are Software Metrics? How Can I Measure These Metrics?** (2024). Disponível em: https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/. Acesso em: 22 out. 2025. (Ciclo de medição: Formulação, Coleta, Análise, Interpretação, Feedback; e objetivos de medição).

<a id="ref-5"></a>[5] MOLDSTUD. **Essential Key Metrics for Measuring Success in Compatibility Testing for Quality Assurance**. (2025). Disponível em: https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance. Acesso em: 22 out. 2025. (Métricas de Taxa de Falha, Pass Rate e Esforço de Compatibilidade).

<a id="ref-6"></a>[6] MOLDSTUD. **Key Performance Indicators (KPIs) for Compatibility Testing**. (2025). Disponível em: https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance. Acesso em: 22 out. 2025. (Critérios e benchmarks de compatibilidade e desempenho).

<a id="ref-7"></a>[7] TENCENT CLOUD. **How to measure the success of compatibility testing?** (2025). Disponível em: https://www.tencentcloud.com/techpedia/105935. Acesso em: 22 out. 2025. (Visão geral sobre sucesso em testes de compatibilidade).

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47)     | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 12/10/2025 | Adição de tabela e questões. |[Pedro Everton](https://github.com/pedroeverton217) | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |
| 1.2   | 13/10/2025 | Conserto de fórmulas.  |[Breno Alexandre](https://github.com/brenoalexandre0) |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) |
| 1.3   | 20/10/2025 | Adição da introdução e metodologia |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
| 1.4   | 20/10/2025 | Correção das referências bibliográficas |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
| 1.5   | 24/10/2025 | Reformulação e adição de mais perguntas |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
| 1.6   | 24/10/2025 | Reorganização das métricas |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
