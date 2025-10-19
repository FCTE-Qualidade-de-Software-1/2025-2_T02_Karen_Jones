# Confiabilidade

## Descrição do Objetivo de Medição de Confiabilidade

<font size="3"><p style="text-align: center">Tabela 1: Descrição do Objetivo de Medição de Qualidade</p></font>

|        Dimensão           |                   Descrição                     |
| ------------------------- | ----------------------------------------------- |
| Objeto da análise         | GIMP (Módulo File-exr)                          |
| Propósito                 | Avaliar a confiabilidade operacional do módulo File-exr do GIMP, considerando estabilidade durante uso prolongado, disponibilidade durante sessões de edição, tolerância a arquivos corrompidos e capacidade de recuperação após falhas, do ponto de vista do Designer Gráfico. |
| Característica de análise | Confiabilidade                                  | 
| Perspectiva de Avaliação  | Designer Gráfico                                |
| Contexto                  | Disciplina de Qualidade de software             |

<font size="3"><p style="text-align: center">Fonte: Autores. (2025)</p></font>

---

## Observação prévia — Conhecer a métrica

> Antes de executar qualquer medição é necessário **conhecer** o que cada métrica representa, suas limitações e como os dados serão coletados. Abaixo, para cada questão, está explicitado: **o que se deseja saber** (objetivo investigativo) e **o que será medido** (variáveis e medições). Em seguida consta a métrica formal apenas como referência de registro. Esta separação evita formular perguntas que já contenham a resposta e garante medições interpretáveis.

## Questões e Métricas

### Q1. Quanto à maturidade: como o módulo File-exr se comporta durante uso prolongado e repetitivo?

- **O que se deseja saber:** se o módulo apresenta aumento de falhas ou degradação de comportamento quando usado por longos períodos ou repetidamente.
- **O que será medido:** número de falhas observadas e tempo total de uso em cenários prolongados.
- **Métrica (registro):** Taxa de falhas = número de falhas / tempo de uso.
- **Critério (padrão):** definir limites aceitáveis conforme contexto do usuário (ex.: aceitável se Taxa de falhas ≤ 0,01 falhas/hora).

---

### Q2. Quanto à disponibilidade: durante uma sessão de edição, a opção de abrir/salvar EXR permanece funcional?

- **O que se deseja saber:** se a funcionalidade de abrir/salvar EXR fica indisponível em algum momento da sessão.
- **O que será medido:** número de eventos de indisponibilidade e duração da sessão em horas.
- **Métrica (registro):** Incidência de indisponibilidade pós-carga = nº eventos de indisponibilidade / horas de uso.
- **Critério (padrão):** disponibilidade aceitável quando incidência próxima de zero; estabelecer um limiar por projeto.

---

### Q3. Quanto à robustez sob variação de carga: o módulo mantém funcionalidade ao abrir arquivos EXR de tamanhos e complexidades diferentes?

- **O que se deseja saber:** se operações de abrir/editar/salvar continuam bem-sucedidas quando arquivos maiores ou com mais camadas são usados.
- **O que será medido:** número de operações bem-sucedidas vs. total de tentativas ao variar tamanho e número de camadas.
- **Métrica (registro):** Taxa de sucesso sob carga = operações OK com N camadas abertas / total de operações testadas para aquele N.
- **Critério (padrão):** determinar N relevantes (ex.: 1, 10, 50 camadas) e aceitar taxas mínimas conforme requisitos do fluxo de trabalho.

---

### Q4. Quanto à tolerância a falhas: como o módulo trata arquivos EXR corrompidos sem comprometer o restante do sistema?

- **O que se deseja saber:** se arquivos corrompidos são detectados e tratados localmente sem provocar falhas no GIMP (ex.: crash ou perda de outras imagens abertas).
- **O que será medido:** número de falhas de leitura induzidas e quantas delas foram tratadas sem crash.
- **Métrica (registro):** Erros tratados sem crash = erros de leitura tratados / erros induzidos.
- **Critério (padrão):** alto percentual de erros tratados sem crash é desejável; estabelecer meta (ex.: ≥ 95%).

---

### Q5. Quanto à recuperabilidade: os logs e mensagens geradas permitem identificar e reproduzir a falha?

- **O que se deseja saber:** se as informações de log são suficientes para localizar a causa raiz e reproduzir a falha em ambiente de teste.
- **O que será medido:** número de bugs que puderam ser reproduzidos a partir das informações do log dividido pelo total de bugs registrados com log.
- **Métrica (registro):** Reprodutibilidade via logs = bugs reproduzidos a partir do log / bugs com log.
- **Critério (padrão):** quanto mais próximo de 1, melhor; metas concretas devem ser definidas pelos mantenedores.

---

### Q6. Quanto à recuperabilidade: após um travamento, é possível restaurar arquivos EXR não salvos?

- **O que se deseja saber:** se existem mecanismos automáticos que permitem recuperar arquivos EXR não salvos após falhas do aplicativo.
- **O que será medido:** número de sessões com restauração bem-sucedida de EXR não salvo dividido pelo número total de crashes observados.
- **Métrica (registro):** Taxa de recuperação automática = sessões com restauração de EXR não salvo / crashes.
- **Critério (padrão):** meta de recuperação deve ser definida (ex.: recuperação bem-sucedida em ≥ 80% dos crashes que envolveram EXR não salvo).

---

## Leitura do resultado — como interpretar as métricas

Para cada métrica reportada, siga estes passos de leitura:

1. **Verificar a unidade e período de coleta** (p.ex. falhas por hora, taxa por sessão). Sem unidade clara, a métrica pode enganar.  
2. **Comparar com critério aceitável:** utilize os critérios definidos (ou proponha valores iniciais) para decidir se o resultado é adequado.  
3. **Analisar tendências:** preferir análises temporais (ex.: gráfico de falhas por semana) a um único valor agregado.  
4. **Investigar discrepâncias:** se uma métrica está fora do esperado, revisar logs, condições de teste (tamanhos de arquivo, número de camadas) e ambiente (hardware, versão libEXR).  
5. **Reportar contexto:** ao publicar resultados, incluir contexto de testes (versão do GIMP, SO, hardware, dataset de EXR utilizado).

### Exemplos de interpretação curta

- Taxa de falhas = 0,002 falhas/hora em 500 horas de uso — indica maturidade aparente, porém investigar picos localizados.  
- Incidência de indisponibilidade pós-carga = 0,1 eventos/hora — significa que em média surge 1 evento a cada 10 horas; avaliar aceitabilidade segundo fluxo do usuário.  
- Erros tratados sem crash = 0,98 — bom indicador de tolerância a arquivos corrompidos; revisar os 2% restantes.

---

*OBS: Modelos de Linguagem de Grande Escala foram utilizados para realizar-se o Brainstorm entre possíveis perguntas e possíveis métricas.*

## Referências Bibliográficas

> INTERNATIONAL ORGANIZATION FOR STANDARDIZATION. ISO/IEC 25000: Software engineering — Software product Quality Requirements and Evaluation (SQuaRE) — Guide to SQuaRE. First edition. Geneva: ISO, 2005.

## **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 08/10/2025 | Criação do Documento.                             |[Vinicius Castelo](https://github.com/Vini47)| [Caio Venâncio](https://www.github.com/caio-venancio), [Pedro Everton](https://github.com/pedroeverton217) |
| 1.1    | 08/10/2025 | Descrição do Objetivo de Medição de Confiabilidade| [Caio Venâncio](https://www.github.com/caio-venancio) | [Arthur Evangelista](https://www.github.com/arthurevg) |
| 1.2 | 12/10/2025 | Adição de referências e ajustes no documento| [Arthur Evangelista](https://www.github.com/arthurevg) |[Vinicius Castelo](https://github.com/Vini47)|
| 1.3 | 13/10/2025| Conserta tabela. | [Breno Alexandre](https://github.com/brenoalexandre0) | |

