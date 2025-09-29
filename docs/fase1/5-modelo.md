# Modelo de Qualidade e Escopo


## Modelo de Qualidade e Escopo — GIMP (`file-exr`)

**Objetivo:** representar o modelo de qualidade (ISO/IEC 25010) com foco nas três características prioritárias **Confiabilidade**, **Compatibilidade** e **Portabilidade** e definir o escopo e a profundidade de análise para cada uma.

---

## Diagrama (visão geral)


![diagrama](../img/diagrama.png)


> O diagrama acima representa o modelo central (ISO/IEC 25010) com as três características prioridades para a Fase 1.

---

## Escopo

A avaliação será limitada às três características para esta Fase 1 **Confiabilidade**, **Compatibilidade** e **Portabilidade** — em conformidade com a ISO/IEC 25010. As demais características do modelo (p.ex. Usabilidade, Segurança ampla, Eficiência de Desempenho, Manutenibilidade como foco principal) ficam fora do escopo.

---
## Adaptação do Modelo

O modelo padrão ISO/IEC 25010 foi adaptado para priorizar os aspectos mais críticos ao propósito desta avaliação: garantir a integridade e a intercambialidade de imagens HDR no fluxo profissional render do GIMP. A seleção das características foi guiada pelo cenário de uso (artista VFX que troca arquivos .exr entre diferentes ferramentas) e pela ideia de focar em aspectos técnicos. Foram selecionadas três características de qualidade de produto, descritas a seguir:

---

### Confiabilidade

**Definição:** Refere-se à capacidade do módulo `file-exr` de executar leituras, gravações e conversões sem provocar falhas, corrupções ou perda de integridade dos arquivos.

**Subcaracterísticas:**

- **Maturidade:** frequência e severidade de falhas conhecidas (ex.: número de *crashes* relatados ao abrir/extrair EXR).  

- **Tolerância a falhas:** comportamento frente a entradas malformadas ou corrompidas (ex.: não travar, tratar erro e não sobrescrever o original).  

- **Recuperabilidade:** manutenção de integridade após falhas (ex.: rollback, evitar arquivos parcialmente corrompidos).  

- **Estabilidade sob carga:** operação com arquivos grandes e cargas contínuas sem degradação de memória ou hangs (ex.: EXR > 200 MB / ~1 GB).

**Escopo (breve):**
- Operações cobertas: abrir `.exr`, salvar `.exr`, converter (`.exr` ↔ `.hdr`), editar camadas/metadata, operações concorrentes.  
- Tipos de arquivo: válidos, parcialmente corrompidos (header/body), variantes com AOVs/deep.  
- Artefatos para evidência: logs, core dumps, diffs de saída, medições de memória/CPU.

**Profundidade (breve — Níveis):**

- **Nível 1 (triagem):** 10–20 casos representativos para identificar crashes e regressões óbvias, registro de passos e logs.  

- **Nível 2 (validação):** ~100 casos automatizados cobrindo compressões/tamanhos, monitoramento com Valgrind/ASAN em amostras, hash/pixel-compare.

- **Nível 3 (aprofundado):** fuzzing no parser EXR, stress tests concorrentes, análise forense de dumps, recomendações técnicas.

---

### Compatibilidade

**Definição:** Refere-se à capacidade do `file-exr` de coexistir e trocar informações com outras ferramentas e formatos do ecossistema gráfico, assegurando que arquivos gerados/alterados pelo GIMP sejam corretamente interpretados por terceiros.

**Subcaracterísticas:**

- **Interoperabilidade:** abrir/gerar `.exr` preservando canais e metadados para serem consumidos por Blender, Krita, Natron etc.  

- **Coexistência:** operar no mesmo ambiente sem conflitos com outros plugins/handlers.  

- **Conformidade com OpenEXR:** aderência a variantes do padrão (multilayer, tiled, deep, compressões).

**Escopo (breve):**
- Validar round-trips: render → GIMP → export → reabrir em pelo menos dois softwares de referência (ex.: Blender e Krita).  
- Cobrir variantes do formato: multilayer, tiled, deep, compressões comuns e incomuns, preservação de AOVs e metadados.  
- Artefatos para evidência: arquivos de entrada/saída, logs dos consumidores, diffs por canal, relatórios PSNR/MSE.

**Profundidade (breve — Níveis):**

- **Nível 1 (verificação manual):** abrir/salvar 5–10 arquivos em ferramentas externas, documentar incompatibilidades. 

- **Nível 2 (testes automatizados):** ~50 arquivos com scripts de comparação (pixel + metadados), relatório de taxa de sucesso por software. 

- **Nível 3 (conformidade/pipeline):** testes formais contra especificação OpenEXR quando possível, simulação de pipelines reais e métricas de perda de informação.

---

### Portabilidade

**Definição:** Refere-se à capacidade do `file-exr` (e da integração com o GIMP) de ser compilado, instalado e executado com comportamento equivalente em diferentes sistemas operacionais e toolchains.

**Subcaracterísticas:**

- **Adaptabilidade:** esforço necessário para ajustar o plugin entre ambientes (distros Linux, Windows, macOS).  

- **Instalabilidade / Reprodutibilidade do build:** existência de scripts/CI/Dockerfiles que permitam builds estáveis e reprodutíveis (ex.: libOpenEXR correta).  

- **Substituibilidade:** facilidade de trocar versões de dependências ou compilar para arquiteturas distintas (x86_64 vs ARM) sem perda funcional.

**Escopo (breve):**
- Verificar processo de build/instalação e executar fluxos de import/export em pelo menos 2 SOs (ex.: Ubuntu 22.04 e Windows 11).  
- Checar dependências críticas (libOpenEXR, libgimp) e scripts/CI/Dockerfiles.  
- Artefatos para evidência: logs de build, binários gerados, scripts de instalação e resultados dos testes por SO.

**Profundidade (breve — Níveis):**

- **Nível 1 (checagem documental + build simples):** revisar documentação de build, realizar uma build local em 1 SO e documentar falhas. 

- **Nível 2 (builds e testes em múltiplos SOs):** compilar/instalar e executar testes básicos em 2 SOs, automatizar verificação de import/export, documentar ajustes.  

- **Nível 3 (reprodutibilidade e ABI):** criar ambientes reprodutíveis (Docker/VM/CI), executar builds em 3 SOs e avaliar compatibilidade ABI e cross-arch.

---

## **Histórico de Versão**

| ID | Descrição | Autor | Revisor | Data |
|:--:|:---------|:------|:--------|:----:|
| 01 | Criação do Documento | [Vinicius Castelo](https://github.com/Vini47) | [Breno Alexandre](https://github.com/brenoalexandre0) | 27/09/2025 |