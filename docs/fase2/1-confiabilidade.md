# Confiabilidade

## Descrição do Objetivo de Medição de Confiabilidade


<font size="3"><p style="text-align: center">Tabela 1: Descrição do Objetivo de Medição de Qualidade</p></font>

|        Dimensão           |                   Descrição                     |
|---------------------------|-------------------------------------------------|
| Objeto da análise         | GIMP (Módulo File-exr)                          |
| Propósito                 | Entender a Estabilidade do módulo File-exr      |
| Característica de análise | Confiabilidade                                  | 
| Perspectiva de Avaliação  | Designer Gráfico                                |
| Contexto                  | Disciplina de Qualidade de software             |

<font size="3"><p style="text-align: center">Fonte: Autores. (2025)</p></font>

## Questões e Métricas

### Q1. Quanto à maturidade, o módulo File-exr opera sem falhas em uso prolongado e repetitivo?

- Taxa de falhas (Failure Rate) = nº de falhas / tempo de uso.

### Q2. Quanto à disponibilidade, o GIMP mantém a opção de abrir/salvar EXR ativa durante toda a sessão de edição?

- Incidência de indisponibilidade pós-carga (availability ratio) = nº eventos de indisponibilidade / horas de uso.

### Q3. Quanto à disponibilidade, O módulo continua funcional mesmo após abrir arquivos de diferentes tamanhos?

- Taxa de sucesso sob carga (load reliability) = operações OK com N camadas abertas / total.

### Q4. Quanto à tolerância a falhas, O módulo identifica e rejeita arquivos EXR corrompidos sem comprometer o sistema?

- Erro tratado sem crash  = erros de leitura tratados / erros induzidos.

### Q5. Quanto à recuperabilidade, Logs ou mensagens de erro permitem identificar e reproduzir a falha?

- Reprodutibilidade via logs = bugs reproduzidos a partir do log / bugs com log.

### Q6. Quanto à recuperabilidade, O GIMP oferece recuperação automática de arquivos EXR não salvos após travamento?

- Auto-recuperação bem-sucedida (successful recovery rate) = sessões com restauração de EXR não salvo / crashes.

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
