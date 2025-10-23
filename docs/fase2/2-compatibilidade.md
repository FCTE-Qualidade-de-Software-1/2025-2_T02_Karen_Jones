# Compatibilidade

## Introdução

Conforme analisado na [**Fase 1**](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase1/fase1/), com base na norma [**ISO/IEC 25010 (SQuaRE)**](https://blog.onedaytesting.com.br/iso-iec-25010/), que define os principais atributos de qualidade de software, destaca-se a **Compatibilidade** como um critério essencial. Assim, como é descrito na norma, esse atributo representa a capacidade de um produto de **trocar informações** e **executar funções** enquanto compartilha recursos com outros sistemas. 

A Compatibilidade se divide em duas subcaracterísticas fundamentais:

- **Interoperabilidade:** diz respeito à habilidade do software de trocar e utilizar dados de forma eficiente com outros sistemas, aspecto importante no caso do formato **EXR** a qual está sendo analisado.  
- **Coexistência:** refere-se à capacidade do software de **operar corretamente em um ambiente compartilhado**, sem causar nem sofrer interferências durante o uso de recursos.

Com base nisso, este trabalho aplica a metodologia **Goal-Question-Metric (GQM)** ao módulo **File-exr** do **GIMP**. Essa abordagem segue o princípio de medição **top-down**, no qual se definem primeiro os **objetivos estratégicos** e, a partir deles, as **questões** e **métricas** necessárias à análise, como é explicado em [The mystery behind project management metrics](https://www.pmi.org/learning/library/project-management-metrics-mystery-9304)

Assim, conforme discutido em [*LANSA - Measurement Objectives*](https://lansa.com/blog/app-development/what-are-software-metrics-how-can-i-measure-these-metrics/), a aplicação do GQM tem como propósito **melhorar a qualidade do software** e **otimizar o processo de desenvolvimento**, o qual será utilizado para reforçar e realizar a análise da qualidade da compatibilidade.

## Descrição do Objetivo de Medição de Compatibilidade

|        Dimensão           |                   Descrição                     |
|---------------------------|-------------------------------------------------|
| Objeto da análise         | GIMP (Módulo File-exr)                          |
| Propósito                 | Entender a compatibilidade dos arquivos EXR gerados pelo GIMP com outros softwares da área |
| Característica de análise | Compatibilidade                                  | 
| Perspectiva de Avaliação  | Designer Gráfico                                |
| Contexto                  | Disciplina de Qualidade de software             |

## Questões e Métricas

### Q1. Quanto a Interoberabilidade, Qual a taxa de sucesso na abertura de arquivos EXR gerados por outras aplicações de mercado (ex: Blender, Nuke, Houdini)?

O módulo File-exr do GIMP será considerado de **alta Interoperabilidade** se a taxa de sucesso na leitura e escrita de arquivos EXR trocados com outras aplicações padrão da indústria (TIL) for **superior a 98%**. Um TIL alto garante que o módulo está em conformidade com o padrão OpenEXR e que a troca de dados com o ecossistema externo é fluida e confiável.

> Fórmula:
>
> TIE(%) = (Número de Casos de Leitura Bem-sucedidos ÷ Número Total de Casos de Leitura Testados) × 100
>
> **Nota:** Um caso de Leitura Bem-sucedida ocorre quando um arquivo EXR gerado por um software de terceiros é aberto corretamente no GIMP. Um caso de Escrita Bem-sucedida ocorre quando um arquivo EXR salvo pelo GIMP é aberto e validado por softwares de terceiros.
>
> Interpretação:
>
> - **>98%** → **Alta Interoperabilidade** (excelente compatibilidade e conformidade com o padrão)
> - **90–98%** → **Interoperabilidade Moderada** (pequenas inconsistências com formatos externos, exigindo correções)
> - **<90%** → **Baixa Interoperabilidade** (falhas frequentes na troca de arquivos, indicando sérios problemas de conformidade)

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

[5] MOLDSTUD. **Essential Key Metrics for Measuring Success in Compatibility Testing for Quality Assurance**. (2025). Disponível em: https://moldstud.com/articles/p-essential-key-metrics-for-measuring-success-in-compatibility-testing-for-quality-assurance. Acesso em: 22 out. 2025. (Métricas de Taxa de Falha, Pass Rate e Esforço de Compatibilidade).

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

