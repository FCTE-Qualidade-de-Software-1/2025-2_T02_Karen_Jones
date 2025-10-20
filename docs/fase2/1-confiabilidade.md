# Confiabilidade

## Descrição do Objetivo de Medição de Confiabilidade

<p align="center"><strong>Tabela 1: Descrição do Objetivo de Medição de Qualidade</strong></p>

| Dimensão | Descrição |
| --- | --- |
| Objeto da análise | GIMP (Módulo File-exr) |
| Propósito | Avaliar a confiabilidade operacional do módulo File-exr do GIMP, considerando estabilidade durante uso prolongado, disponibilidade e robustez frente a variação de carga, tolerância a arquivos corrompidos e capacidade de recuperação após falhas, do ponto de vista do Designer Gráfico. |
| Característica de análise | Confiabilidade |
| Perspectiva de Avaliação | Designer Gráfico |
| Contexto | Disciplina de Qualidade de software |

<center>

|        Dimensão           |                   Descrição                     |
| ------------------------- | ----------------------------------------------- |
| Objeto da análise         | GIMP (Módulo File-exr)                          |
| Propósito                 | Entender a Estabilidade do módulo File-exr      |
| Característica de análise | Confiabilidade                                  | 
| Perspectiva de Avaliação  | Designer Gráfico                                |
| Contexto                  | Disciplina de Qualidade de software             |

</center>

<font size="3"><p style="text-align: center">Fonte: Autores. (2025)</p></font>

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
| 1.4 | 19/10/2025 | Modificações sujeridas em aula foram aplicadas | [Vinicius Castelo](https://github.com/Vini47) | [Arthur Evangelista](https://www.github.com/arthurevg) |
