# Execução do Plano de Avaliação - Quanto à Confiabilidade

## Introdução

## 1. Procedimento Executado

### Software e Papéis
Como descrito autoriormente na [Fase 3](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase3/1-confiabilidade/#ferramentas-e-metodos-de-coleta), as métricas 1.1, 1.2 e 2.1, que tratam de Maturidade, Disponibilidade e Tolerância a Falhas respectivamente foram medidas através de um feito em Batchfiles para Terminal de Windows, disponível na pasta `tests/scripts/run-open-exr.bat`, e depois calculadas via a fórmula descrita na [Fase 2](https://fcte-qualidade-de-software-1.github.io/2025-2_T02_Karen_Jones/fase2/1-confiabilidade/#questoes-e-metricas), com os dados resultantes disponíveis na pasta `tests/resultados`.

- [Medição da Métrica 1.1 - Taxa de Falhas (Failure Rate)](#medicao-da-metrica-11-taxa-de-falhas-failure-rate)
- [Medição da Métrica 1.2 - Tempo Médio Entre Falhas (MTBF](#medicao-da-metrica-12-tempo-medio-entre-falhas-mtbf)
- [Medição da Métrica 2.1 - Taxa de Sucesso sob Carga](#medicao-da-metrica-21-taxa-de-sucesso-sob-carga)

Agora sobre as métricas 2.2, 3.1, e 3.2...
<!-- pode preencher aqui, Arthur? -->

### Medição da Métrica 1.1 - Taxa de Falhas (Failure Rate)

**Descrição:** Aqui se utiliza os documentos em `tests/resultados` depois de se ter executado por pelo menos 10 horas, e se contabiliza a quantidade de falhas e quantidade total de tempo em execução, e depois segue-se a fórmula.
> `Nº total de falhas / Tempo total de uso (em horas)`

<div align="center">
    Figura 1: Vídeo sobre o algoritmo rodando.
    <br>
    <img src="">
    <br>
     <b> Autor: </b> <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>
<br>

<div align="center">
    Figura 2: Cálculo de Taxa de Falhas a partir dos resultados no algoritmo automático.
    <br>
    <img src="">
    <br>
     <b> Autor: </b> <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>

### Medição da Métrica 1.2 - Tempo Médio Entre Falhas (MTBF)

**Descrição:** Aqui se utiliza os documentos em `tests/resultados` depois de se ter executado por 10 horas, e se contabiliza quantidade total de tempo em execução e a quantidade de falhas em execução, e depois segue-se a fórmula.
> `Tempo total de uso (em horas) / Nº total de falhas`

<div align="center">
    Figura 3: Cálculo do tempo médio entre falhas a partir dos arquivos gerados pela rotina.
    <br>
    <img src="">
    <br>
     <b> Autor: </b> <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>

### Medição da Métrica 2.1 - Taxa de Sucesso sob Carga

**Descrição:** Aqui se utiliza os documentos em `tests/resultados` depois de se ter executado por 10 horas, e se contabiliza o total de operações bem sucedidas e a quantidade total de operações, e depois segue-se a fórmula.
> `(Operações OK / Total de operações) * 100 (calculada por categoria de carga)`

<div align="center">
    Figura 4: Cálculo do da taxa de sucesso sob carga a partir dos arquivos gerados pela rotina.
    <br>
    <img src="">
    <br>
     <b> Autor: </b> <a href="https://github.com/caio-venancio">Caio Venâncio</a>.
    <br>
</div>

### Medição da Métrica 2.2

**Descrição:**

### Medição da Métrica 3.1

**Descrição:**

### Medição da Métrica 3.2

**Descrição:**

## 2. Medição (Dados Coletados)

## 3. Análise e Julgamento

### Discussão dos Resultados e Julgamento

### Achados e Melhoria Proposta (Conexão com a Fase 1)

## Referências

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 13/11/2025 | Criação do Documento. | [Caio Venâncio](https://www.github.com/caio-venancio)|     [Arthur Evangelista](https://www.github.com/arthurevg)   |
|1.1     | 18/11/2025 | Adição de 'esqueleto' do documento  |[Arthur Evangelista](https://www.github.com/arthurevg) |[Caio Venâncio](https://www.github.com/caio-venancio)|
|1.2     | 24/11/2025 | Melhorar de 'esqueleto' do documento  | [Caio Venâncio](https://www.github.com/caio-venancio) |[Arthur Evangelista](https://www.github.com/arthurevg)|