# Compatibilidade

## Introdução:

Conforme foi analisado na Fase 1, ao utilizar as normas [ISO/IEC 25010 (SQuaRE)](https://blog.onedaytesting.com.br/iso-iec-25010/) — o padrão internacional que estabelece os atributos de qualidade de software —, a Compatibilidade é um fator essencial para a aceitação de ferramentas robustas como o GIMP.

A Compatibilidade refere-se à capacidade do GIMP de funcionar em diversos ambientes e de trocar dados com outras aplicações. Este fator é detalhado nas subcaracterísticas:

- **Interoperabilidade**: A capacidade de trocar e utilizar informações com outros sistemas, crucial para a leitura e escrita de formatos complexos como o EXR.
- **Coexistência:** A capacidade de realizar funções eficientemente sem causar ou sofrer interferências ao compartilhar recursos do sistema operacional.

Dessa maneira, este trabalho aplica a metodologia Goal-Question-Metric (GQM) ao módulo File-exr do GIMP. O GQM estabelece que a medição deve ser estratégica, começando pelas Metas de alto nível da organização. Nossa meta é Analisar a adequação do módulo File-exr para fluxos de trabalho profissionais (Designer Gráfico), traduzindo as preocupações com Interoperabilidade e Coexistência em um conjunto de questões e métricas validadas. O resultado fornecerá insights acionáveis para a comunidade de desenvolvimento do GIMP, transformando a necessidade de qualidade em um programa de melhoria contínua.


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

[1] ABREU, Bruno. A ISO/IEC 25010 e sua importância para a qualidade de software. One Day Testing Blog, 29 mar. 2023. Disponível em: https://blog.onedaytesting.com.br/iso-iec-25010/
. Acesso em 20 de out. 2025.

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47)     | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 12/10/2025 | Adição de tabela e questões. |[Pedro Everton](https://github.com/pedroeverton217) | [Larissa Stéfane](https://github.com/SkywalkerSupreme) |
| 1.2   | 13/10/2025 | Conserto de fórmulas.  |[Breno Alexandre](https://github.com/brenoalexandre0) |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) |
| 1.3   | 20/10/2025 | Adição da introdução e metodologia |  [Larissa Stéfane](https://github.com/SkywalkerSupreme) | | 

