# Portabilidade

## Descrição do Objetivo de Medição de Portabilidade

|        Dimensão           |                   Descrição                     |
|---------------------------|-------------------------------------------------|
| Objeto da análise         | GIMP (Módulo File-exr) |
| Propósito                 | Entender o funcionamento do módulo em diferentes sistemas operacionais |
| Característica de análise | Portabilidade | 
| Perspectiva de Avaliação  | Designer Gráfico |
| Contexto                  | Disciplina de Qualidade de software |

## Questões e Métricas

### Q1. Quanto a Adaptabilidade, qual é o esforço necessário para adaptar o módulo File-exr do GIMP para funcionar corretamente em diferentes sistemas operacionais (Linux, Windows e macOS)?

O módulo File-exr do GIMP apresenta boa adaptabilidade se o percentual de modificações necessárias para compilar e executar em diferentes SOs for inferior a 10%. Essa métrica indica que o código é amplamente reutilizável e as dependências são bem gerenciadas entre ambientes Linux, Windows e macOS.

> Fórmula:
>
> Adaptabilidade(%) = (Linhas de código ou dependências alteradas ÷ Total de linhas de código ou dependências do módulo) × 100
>
> Interpretação:
>
> - 0–10% → Alta adaptabilidade (poucas mudanças necessárias)
>
> - 10–30% → Adaptabilidade moderada
>
> - \>30% → Baixa adaptabilidade (muitas dependências específicas de SO)

### Q2. Quanto a Instalabilidade, qual o tempo médio necessário para que o módulo seja instalado em novos ambientes de implantação?

Para esta análise utilizaremos uma métrica de Tempo Médio de Instalação (TMI) (Minutos/Instalação).
Esta métrica indicará se o processo de implantação do módulo é eficiente, simples e não requer longas esperas.
> Fórmula:
>
> TMI(Minutos/Instalação) = (Tempo de Instalação no Ambiente)i ÷ Número Total de Instalações Medidas
>
> O tempo de instalação é medido desde o início da execução do script/instalador até a confirmação de que o módulo está pronto para uso.
>
> Interpretação:
>
> - **0–5 minutos** → **Alta Instalabilidade** (rápido e eficiente)
> - **5–15 minutos** → **Instalabilidade Moderada** (tempo aceitável, mas pode ser otimizado)
> - **>15 minutos** → **Baixa Instalabilidade** (processo lento, sugerindo complexidade ou dependências excessivas)

### Q3. Quanto a Instalabilidade, qual a taxa de falhas que ocorrem durante o processo de instalação em diferentes ambientes?

Para esta análise utilizaremos uma métrica Taxa de Falhas de Instalação (TFI) (Instalações Mal-sucedidas/Total de Tentativas de Instalação).
Esta métrica de TFI, sendo baixa, indicará que o pacote de instalação é robusto, que as dependências são resolvidas de maneira eficaz e que o processo é consistente entre os diversos sistemas operacionais.

> Fórmula:
>
> TFI(%) = (Número de Instalações Mal-sucedidas ÷ Número Total de Tentativas de Instalação) × 100
>
> A falha de instalação é definida como qualquer erro que impeça o módulo de ser carregado ou executado corretamente após a conclusão do processo de instalação.
>
> Interpretação:
>
> - **0–2%** → **Excelente Instalabilidade** (muito confiável, poucas ou nenhuma falha)
> - **2–5%** → **Instalabilidade Aceitável** (algumas falhas esporádicas, investigação pontual necessária)
> - **>5%** → **Baixa Instalabilidade** (falhas frequentes, indicando problemas sérios de compatibilidade ou empacotamento)

### Q4. Quanto a Substituibilidade, qual é o esforço necessário para substituir uma dependência principal do módulo File-exr (como a libOpenEXR) por outra versão ou biblioteca equivalente sem perda de funcionalidade?

O módulo File-exr do GIMP apresenta boa substituibilidade se o índice for superior a 70%, indicando que a maior parte das dependências pode ser trocada ou atualizada sem impacto significativo no código-fonte. Isso melhora a portabilidade e reduz o risco de obsolescência de bibliotecas.

> Fórmula:
>
> Substituibilidade(%) = (Número de componentes substituíveis sem modificação ÷ Total de componentes dependentes) × 100
>
> Interpretação:
>
> - <50% → Baixa — alto acoplamento a componentes específicos
>
> - 50–79% → Média — algumas dependências críticas exigem ajustes
>
> - 80–100% → Alta — módulo independente de versões ou fornecedores específicos

## Referências Bibliográficas

> FENTON, Norman; BIEMAN, James. Software Metrics: A Rigorous and Practical Approach. 3. ed. Boca Raton: CRC Press, 2015.

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento. | [Vinicius Castelo](https://github.com/Vini47)     | [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 12/10/2025 | Adição de tabela e questões. | [Breno Alexandre](https://github.com/brenoalexandre0), [Pedro Everton](https://github.com/pedroeverton217) | |
| 1.2    | 13/10/2025 | Conserta fórmulas. | [Breno Alexandre](https://github.com/brenoalexandre0) | |