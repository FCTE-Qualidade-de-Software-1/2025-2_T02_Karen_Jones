# Compatibilidade

## Descrição do Objetivo de Medição de Compatibilidade

|        Dimensão           |                   Descrição                     |
|---------------------------|-------------------------------------------------|
| Objeto da análise         | GIMP (Módulo File-exr)                          |
| Propósito                 | Entender a compatibilidade dos arquivos EXR gerados pelo GIMP com outros softwares da área |
| Característica de análise | Compatibilidade                                  | 
| Perspectiva de Avaliação  | Designer Gráfico                                |
| Contexto                  | Disciplina de Qualidade de software             |

## Questões e Métricas

### Q1. Quanto a Interoberabilidade, Qual a taxa de sucesso na abertura/escrita de arquivos EXR gerados por outras aplicações de mercado (ex: Blender, Nuke, Houdini)?

O módulo File-exr do GIMP será considerado de **alta Interoperabilidade** se a taxa de sucesso na leitura e escrita de arquivos EXR trocados com outras aplicações padrão da indústria (TIE) for **superior a 98%**. Um TIE alto garante que o módulo está em conformidade com o padrão OpenEXR e que a troca de dados com o ecossistema externo é fluida e confiável.

> Fórmula:
>
> TIE(%) = (Número de Casos de Leitura/Escrita Bem-sucedidos ÷ Número Total de Casos de Leitura/Escrita Testados) × 100
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

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47)     | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 12/10/2025 | Adição de tabela e questões. |[Pedro Everton](https://github.com/pedroeverton217), [Larissa Stéfane](https://github.com/SkywalkerSupreme), [Vinicius Castelo](https://github.com/Vini47) | |
| 1.2   | 13/10/2025 | Conserto de fórmulas.  |[Breno Alexandre](https://github.com/brenoalexandre0) | |