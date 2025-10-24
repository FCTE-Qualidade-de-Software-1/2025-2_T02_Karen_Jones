# Compatibilidade

## Introdução

Conforme analisado na [**Fase 1**](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase1/fase1/), com base na norma [**ISO/IEC 25010 (SQuaRE)**](https://blog.onedaytesting.com.br/iso-iec-25010/), que define os principais atributos de qualidade de software, destaca-se a **Compatibilidade** como um critério essencial. Assim, como é descrito na norma, esse atributo representa a capacidade de um produto de **trocar informações** e **executar funções** enquanto compartilha recursos com outros sistemas. 

A Compatibilidade se divide em duas subcaracterísticas fundamentais:

- **Interoperabilidade:** diz respeito à habilidade do software de trocar e utilizar dados de forma eficiente com outros sistemas, aspecto importante no caso do formato **EXR** a qual está sendo analisado.  
- **Coexistência:** refere-se à capacidade do software de **operar corretamente em um ambiente compartilhado**, sem causar nem sofrer interferências durante o uso de recursos.

Com base nisso, este trabalho aplica a metodologia **Goal-Question-Metric (GQM)** ao módulo **File-exr** do **GIMP**. Essa abordagem segue o princípio de medição **top-down**, no qual se definem primeiro os **objetivos estratégicos** e, a partir deles, as **questões** e **métricas** necessárias à análise, como é explicado em [The mystery behind project management metrics](https://www.pmi.org/learning/library/project-management-metrics-mystery-9304)

Assim, conforme discutido em [*LANSA - Measurement Objectives*](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/), a aplicação do GQM tem como propósito **melhorar a qualidade do software** e **otimizar o processo de desenvolvimento**, o qual será utilizado para reforçar e realizar a análise da qualidade da compatibilidade.

## Objetivo

O principal objetivo deste documento é **estruturar e formalizar o programa de medição GQM** para o fator **Compatibilidade** do GIMP. Para tal, o foco será dado às suas subcaracterísticas que representam os pontos críticos para do software. Dessa maneira, pretende-se transformar as necessidades de informação dos *stakeholders* em um conjunto gerenciável de métricas validadas. Em última análise, o objetivo também é fornecer *insights* acionáveis para a equipe de desenvolvimento para cumprir as funções de **Análise** e **Controle** do projeto [LANSA](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/)

## Metodologia

A medição de *software* é um processo sistemático que, como defendido na literatura, deve compreender cinco atividades interligadas: **Formulação**, **Coleta**, **Análise**, **Interpretação** e **Feedback** [LANSA - Measurement Principles](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/).

Neste trabalho, o método **GQM (Goal-Question-Metric)** é empregado como espinha dorsal da na análise, para isso, a sua estrutura top-down alinha o projeto com modelos de maturidade como o [LANSA - CMMI Context](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/).

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

#### Q1. Até que ponto o módulo File-exr do GIMP é capaz de garantir o intercâmbio fiel de dados com os softwares líderes do mercado?

**Motivo da Pergunta:**
-  **Analisar a Interoperabilidade** de acordo com a [ISO/IEC 25010](https://blog.onedaytesting.com.br/iso-iec-25010/), ou seja, o objetivo é conhecer a fidelidade da troca de dados do módulo com o ecossistema profissional (Blender, Nuke) ao determinar se o GIMP atende aos requisitos de produção do Designer Gráfico.
-  **Consequência da falaha**: Uma Interoperabilidade falha gera retrabalho, perda de dados e impacta diretamente a produtividade.

**O que se deseja saber com a pergunta?**
- Quantificar a **Taxa de Sucesso Funcional (TSF)** do módulo ao manipular arquivos EXR complexos (multi-camadas e metadados) gerados ou consumidos por *softwares* externos.
- Saber o nível de risco associado a essa troca de dados.

**Como a resposta é esperada?**
A resposta será obtida por meio de um **Teste de Compatibilidade Funcional** (TSF) ao executar um *set* de casos de teste que simulem a importação e exportação de arquivos EXR entre o GIMP e três aplicações líderes de mercado (Amostragem). O sucesso é definido pela **ausência de erros de *crash*** e pela **preservação integral de todos os atributos críticos** (camadas, fidelidade de cor) do arquivo conforme explicado em [TENCENT CLOUD](https://www.tencentcloud.com/techpedia/105935).


#### Métrica 1.1: Taxa de Sucesso Funcional (TSF)

Esta métrica é utilizada para medir a eficácia na realização de uma tarefa [MOLDSTUD - Test Pass Rates](https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance). Ela indicará a confiabilidade do módulo File-exr no fluxo de intercâmbio de dados.

> **Fórmula:**
>
> TSF (%) = (Número de Casos de Intercâmbio Sucedidos / Número Total de Casos de Intercâmbio Testados) * 100
>
> **Referência:** [[5]](#ref-5)
>
> **Interpretação (Critério):**
>
> - **Alta Interoperabilidade (Hipótese Confirmada):** $\geq 95\%$
> - **Média Interoperabilidade:** $90\% \text{ a } 95\%$
> - **Baixa Interoperabilidade (Hipótese Refutada):** $< 90\%$

#### Métrica 1.2: Densidade de Defeitos por Teste (DDT)

Esta métrica quantifica a qualidade do módulo com base na relação entre defeitos encontrados e o volume de testes executados inspirados em  [MOLDSTUD - Defect Density]. Ela é um indicador de risco.

> **Fórmula:**
>
> $$DDT = \frac{\text{Nº de Defeitos de Interoperabilidade}}{\text{Nº Total de Casos de Teste Executados}}$$
>
> **Referência:** [[5]](#ref-5)
>
> **Interpretação (Critério):**
>
> - **Baixo Risco (Hipótese Confirmada):** $< 0.5$ defeitos/caso de teste
> - **Risco Moderado:** $0.5 \text{ a } 1.0$ defeitos/caso de teste
> - **Alto Risco (Hipótese Refutada):** $> 1.0$ defeitos/caso de teste














### Q2. Quanto a Coexistência, Qual a variação no tempo de carregamento do GIMP quando o módulo File-exr está instalado, comparado ao tempo sem o módulo?

O módulo File-exr do GIMP será considerado de **alta Coexistência** se o aumento percentual no tempo de carregamento do GIMP (APTC) devido à sua presença for **inferior a 5%**. Um APTC baixo indica que o módulo se integra de forma eficiente ao GIMP, minimizando o consumo de recursos e o atraso na inicialização.

> Fórmula:
>
> APTC(%) = ((Tempo com Módulo - Tempo sem Módulo) ÷ Tempo sem Módulo) × 100
>
> **Nota:** O "Tempo de Carregamento" é medido desde o início da execução do GIMP até o momento em que a interface principal está totalmente operacional e responsiva.
>
> Interpretação:
>
> - **0–5%** → **Alta Coexistência** (impacto mínimo na inicialização)
> - **5–15%** → **Coexistência Moderada** (impacto perceptível, mas aceitável; otimizações recomendadas)
> - **>15%** → **Baixa Coexistência** (atraso significativo na inicialização, indicando consumo excessivo de recursos ou carregamento ineficiente na inicialização)



## Referências Bibliográficas


[1] ABREU, Bruno. **A ISO/IEC 25010 e sua importância para a qualidade de software**. One Day Testing Blog, 29 mar. 2023. Disponível em: https://blog.onedaytesting.com.br/iso-iec-25010/. Acesso em: 22 out. 2025.

[2] BASILI, Victor R.; CALDIERA, Gianluigi; ROMBACH, H. Dieter. **The Goal Question Metric Approach** (1994). **In**: *Encyclopedia of Software Engineering*. (Conceito GQM e metodologia top-down).

[3] ELITEX. **Software Quality Metrics: What Is This Really About?** (2024). Disponível em: https://elitex.systems/blog/software-quality. Acesso em: 22 out. 2025. (Tipos de métricas, performance, segurança, usabilidade).

[4] LANSA. **What Are Software Metrics? How Can I Measure These Metrics?** (2024). Disponível em: https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/. Acesso em: 22 out. 2025. (Ciclo de medição: Formulação, Coleta, Análise, Interpretação, Feedback; e objetivos de medição).

<a id="ref-5"></a>[5] MOLDSTUD. **Essential Key Metrics for Measuring Success in Compatibility Testing for Quality Assurance**. (2025). Disponível em: https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance. Acesso em: 22 out. 2025. (Métricas de Taxa de Falha, Pass Rate e Esforço de Compatibilidade).

[6] MOLDSTUD. **Key Performance Indicators (KPIs) for Compatibility Testing**. (2025). Disponível em: https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance. Acesso em: 22 out. 2025. (Critérios e benchmarks de compatibilidade e desempenho).

[7] TENCENT CLOUD. **How to measure the success of compatibility testing?** (2025). Disponível em: https://www.tencentcloud.com/techpedia/105935. Acesso em: 22 out. 2025. (Visão geral sobre sucesso em testes de compatibilidade).

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47)     | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 12/10/2025 | Adição de tabela e questões. |[Pedro Everton](https://github.com/pedroeverton217) | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |
| 1.2   | 13/10/2025 | Conserto de fórmulas.  |[Breno Alexandre](https://github.com/brenoalexandre0) |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) |
| 1.3   | 20/10/2025 | Adição da introdução e metodologia |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 
| 1.4   | 20/10/2025 | Correção das referências bibliográficas |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 

