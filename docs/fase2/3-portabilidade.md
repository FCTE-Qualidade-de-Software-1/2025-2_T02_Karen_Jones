# Portabilidade

## Introdução

Este artefato tem como objetivo aplicar o método GQM (Goal-Question-Metric) para entender o módulo file-exr do GIMP sob o critério de portabilidade. A proposta é definir metas, perguntas e métricas que permitam analisar a capacidade do módulo de ser transferido, adaptado e executado em diferentes ambientes, identificando possíveis limitações e oportunidades de melhoria. Dessa forma, o artefato servirá como base para a coleta e análise de dados que apoiem a tomada de decisões voltadas à qualidade e à manutenção do módulo.

## Metodologia

A metodologia adotada neste artefato baseia-se no método GQM, que orienta a avaliação da qualidade de software de forma estruturada e orientada a objetivos. Inicialmente, é definido o objetivo de análise, neste caso, entender a portabilidade do módulo file-exr do GIMP. Em seguida, são formuladas perguntas que permitam investigar aspectos específicos relacionados a esse critério, como a ocorrência de erros em diferentes ambientes ou a facilidade de adaptação do módulo. Por fim, são estabelecidas métricas que quantifiquem os resultados observados, possibilitando uma avaliação objetiva e comparável. Essa abordagem garante coerência entre os dados coletados e o propósito de avaliação, promovendo uma análise consistente e orientada à melhoria contínua da qualidade do módulo.

## Descrição do Objetivo de Medição de Portabilidade

|        Dimensão           |                   Descrição                     |
|---------------------------|-------------------------------------------------|
| Objeto da análise         | GIMP (Módulo File-exr)                          |
| Propósito                 | Entender                                        |
| Característica de análise | Portabilidade                                   | 
| Perspectiva de Avaliação  | Designer Gráfico                                |
| Contexto                  | Disciplina de Qualidade de software             |

## Questões e Métricas

<!-- a pergunta antiga: -->
<!-- ### Q1. Quanto a Adaptabilidade, qual é o esforço necessário para adaptar o módulo File-exr do GIMP para funcionar corretamente em diferentes sistemas operacionais (Linux, Windows e macOS)? -->

<!-- a possível nova pergunta: -->
<!-- ### Q1. Quanto a Adaptabilidade, O módulo funciona corretamente em diferentes sistemas operacionais (Linux, Windows, macOS)? -->

<!-- a nova pergunta: -->
### Q1. Quanto a Adaptabilidade, o módulo se comporta de formas diferentes em diferentes sistemas operacionais?

#### Hipótese: O módulo se comporta exatamente da mesma forma em qualquer sistema operacional, limitando-se a diferença de desempenho.

#### Métrica 1.1: Taxa de Sucesso de Execução entre Plataformas

> **Fórmula:**
>
> `Execuções bem-sucedidas em diferentes sistemas operacionais / Total de execuções em diferentes sistemas operacionais`
>
> **Referência:** ISO/IEC 25023:2016, *Software product quality model*.
>
> **Interpretação:**
> - **Alta Adaptabilidade (Hipótese Confirmada):** ≥ 95% de execuções bem-sucedidas em todas as plataformas
> - **Média Adaptabilidade:** 85% - 94% de execuções bem-sucedidas em todas as plataformas
> - **Baixa Adaptabilidade (Hipótese Refutada):** < 85% de execuções bem-sucedidas em todas as plataformas  
> Esta métrica avalia a **confiabilidade do módulo em diferentes sistemas operacionais**. Quanto maior a taxa de execuções bem-sucedidas, melhor a adaptabilidade do módulo entre plataformas.

#### Métrica 1.2: Desvio de Desempenho entre Plataformas

> **Fórmula:**
>
> `|Desempenho no Sistema A - Desempenho no Sistema B| / Desempenho médio`
>
> **Referência:** ISO/IEC 25023:2016, *Software product quality model*.
>
> **Interpretação:**
> - **Baixo Desvio de Desempenho (Hipótese Confirmada):** < 10% de variação entre plataformas
> - **Desvio Médio de Desempenho:** 10% - 20% de variação entre plataformas
> - **Alto Desvio de Desempenho (Hipótese Refutada):** > 20% de variação entre plataformas  
> O desvio de desempenho mede **a diferença no tempo de execução** do módulo entre diferentes plataformas. Um baixo desvio indica que o módulo mantém uma performance consistente em diferentes sistemas, enquanto um alto desvio pode indicar problemas de adaptação.


<!-- a pergunta antiga: -->
<!-- ### Q2. Quanto a Instalabilidade, qual o tempo médio necessário para que o módulo seja instalado em novos ambientes de implantação? -->

<!-- a nova pergunta: -->
### Q2. Quanto a Instalabilidade, é possível instalar e desinstalar somente o módulo file-exr?

#### Hipótese: Não é possível instalar e desinstalar somente o módulo file-exr, uma vez que ao retirá-lo o gimp não funciona adequadamente ou gera builds inconsistentes.

#### Métrica 2.1: Taxa de Sucesso na Instalação (Installation Success Rate)

> **Fórmula:**
>
> `Instalações bem-sucedidas / Total de tentativas de instalação`
>
> **Referência:** ISO/IEC 25023:2016, *Software product quality model*.
>
> **Interpretação:**
> - **Alta Instalação (Hipótese Confirmada):** ≥ 95% de tentativas bem-sucedidas
> - **Média Instalação:** 85% - 94% de tentativas bem-sucedidas
> - **Baixa Instalação (Hipótese Refutada):** < 85% de tentativas bem-sucedidas  
> Esta métrica avalia a **facilidade** do processo de instalação, sem complicações ou erros que possam ocorrer durante a tentativa de adicionar o módulo ao GIMP.

#### Métrica 2.2: Taxa de Sucesso na Desinstalação (Uninstallation Success Rate)

> **Fórmula:**
>
> `Desinstalações bem-sucedidas / Total de tentativas de desinstalação`
>
> **Referência:** ISO/IEC 25023:2016, *Software product quality model*.
>
> **Interpretação:**
> - **Alta Desinstalação (Hipótese Confirmada):** ≥ 95% de desinstalações bem-sucedidas
> - **Média Desinstalação:** 85% - 94% de desinstalações bem-sucedidas
> - **Baixa Desinstalação (Hipótese Refutada):** < 85% de desinstalações bem-sucedidas  
> Avalia a **eficiência do processo de desinstalação**, garantindo que o módulo seja removido sem deixar resíduos ou causar falhas no GIMP.



<!-- ### Q3. Quanto a Instalabilidade, qual a taxa de falhas que ocorrem durante o processo de instalação em diferentes ambientes? -->

<!-- a nova pergunta: -->
### Q3. Quanto a Instalabilidade, o processo de instalação do módulo costuma apresentar erros ou inconsistências em diferentes ambientes?

#### Hipótese:

#### Métrica 3.1:

> Fórmula:
>
> **Referência:**
>
> Interpretação:
>
> 
>
>

#### Métrica 3.2:

> Fórmula:
>
> **Referência:**
>
> Interpretação:
>
> 
>
>


<!-- ### Q4. Quanto a Substituibilidade, qual é o esforço necessário para substituir uma dependência principal do módulo File-exr (como a libOpenEXR) por outra versão ou biblioteca equivalente sem perda de funcionalidade? -->

<!-- a nova pergunta: -->
### Q4. Quanto a Substituibilidade, é fácil substituir dependências dos módulo File-exr por outras bibliotecas ou versões?

#### Hipótese:

#### Métrica 4.1:

> Fórmula:
>
> **Referência:**
>
> Interpretação:
>
> 
>
>

#### Métrica 4.3:

> Fórmula:
>
> **Referência:**
>
> Interpretação:
>
> 
>
>

## Conclusões

Com a aplicação do método GQM, foi possível compreender de forma mais clara como o módulo file-exr do GIMP se comporta em relação à portabilidade, analisando aspectos como adaptabilidade, instalabilidade e substituibilidade. As métricas definidas ajudaram a observar como o módulo reage em diferentes sistemas operacionais, quanto tempo leva e quão consistente é o processo de instalação, além de verificar o quão simples é substituir suas dependências. Essa análise trouxe uma visão prática sobre os pontos fortes e as possíveis melhorias do módulo, contribuindo para torná-lo mais flexível e fácil de manter em diversos ambientes.

## Referências Bibliográficas

> FENTON, Norman; BIEMAN, James. Software Metrics: A Rigorous and Practical Approach. 3. ed. Boca Raton: CRC Press, 2015.

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47) | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 12/10/2025 | Adição de tabela e questões. | [Breno Alexandre](https://github.com/brenoalexandre0), [Pedro Everton](https://github.com/pedroeverton217) | [Breno Alexandre](https://github.com/brenoalexandre0) |
| 1.2    | 13/10/2025 | Conserta fórmulas. | [Breno Alexandre](https://github.com/brenoalexandre0) | [Caio Venâncio](https://www.github.com/caio-venancio) |
| 1.3    | 19/10/2025 | Conserta perguntas.  | [Caio Venâncio](https://www.github.com/caio-venancio) | [Breno Alexandre](https://github.com/brenoalexandre0) |
| 1.4    | 21/10/2025 | Refatora os artefatos.  | [Breno Alexandre](https://github.com/brenoalexandre0), [Caio Venâncio](https://www.github.com/caio-venancio)  | |