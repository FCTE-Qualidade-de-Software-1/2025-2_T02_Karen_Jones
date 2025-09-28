# Proposito da Avaliação e Uso Pretendido


## 1. Introdução

Este documento estabelece os requisitos com base no propósito da Fase 1 para a avaliação de qualidade do software **GIMP (GNU Image Manipulation Program)**, com foco no seu desempenho geral e, especificamente, **no plug-in `file-exr`**, responsável pela manipulação de arquivos de imagem de alta faixa dinâmica (HDR). Isso porque, conforme descrito na [introdução](/fase1.md) e na [descrição](/3-descricao.md), o GIMP é um software de edição de imagens gratuito e de código aberto, amplamente utilizado por fotógrafos, designers e ilustradores como uma alternativa a ferramentas pagas.

**A avaliação será conduzida sob a ótica da norma ISO/IEC 25010 (SQuaRE), concentrando-se nas seguintes características de qualidade: Confiabilidade, Compatibilidade e Portabilidade.**

<div align="center">
    Figura 1:  Plugin e imagem de alta qualidade do GIMP
    <br>
    <img src="https://shotkit.com/wp-content/uploads/2020/10/gimp-plugins-2.jpg" width="600">
    <br>
    <b>Fonte:</b> <a href="https://www.youtube.com/watch?v=4DSdTTnfyDE/">Create HDRI file by converting .EXR to .HDR in GIMP!</a>.
    <br>
</div>

## 2. Propósito da Avaliação

O propósito desta avaliação é **realizar uma análise técnica da qualidade do GIMP para identificar pontos de melhoria**, ao focar nos aspectos que mais impactam usuários que dependem de fluxos de trabalho entre diferentes sistemas e softwares.

### 2.1. Objetivo Geral

O objetivo principal é **identificar e documentar os pontos fortes e as fragilidades** do GIMP, com foco nas características da Square escolhidas. Desse modo, a análise será fundamentada em cenários de uso real, que demonstram a importância crítica dessas características para o fluxo de trabalho de profissionais criativos.

Como exemplo prático, a avaliação investigará o processo de conversão de um arquivo `.EXR` (gerado por softwares de renderização 3D) para o formato `.HDR` dentro do GIMP, uma tarefa essencial para a criação de manipulação dinâmica como no caso mostrado no vídeo abaixo.

**Vídeo 1:**

<iframe width="1321" height="743" src="https://www.youtube.com/embed/4DSdTTnfyDE" title="Create HDRI file by converting .EXR to .HDR in GIMP!" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

Este caso de uso específico será a base para avaliar como:
* A **Confiabilidade** do plug-in `file-exr` se comporta sob uso ao garantir que o software não trave ou corrompa dados durante a conversão.
* A **Compatibilidade** do GIMP assegura que o arquivo `.HDR` final seja gerado corretamente e possa ser utilizado sem falhas em outros softwares do ecossistema de design (como Unreal Engine ou Blender).
* A **Portabilidade** do GIMP permite que este fluxo de trabalho seja executado de maneira consistente em diferentes sistemas operacionais, um requisito comum em estúdios e equipes de freelancers.

### 2.2. Requisitante e Partes Interessadas (Stakeholders)

A definição do propósito é guiada pelas necessidades das seguintes partes:

* **Requisitante Principal:** A equipe de avaliação (estudantes da disciplina FGA315 - Qualidade de Software). O principal interesse é aplicar de forma prática os conhecimentos teóricos sobre avaliação de software ao utilizar um produto de relevância no mercado para aprimorar as habilidades analíticas.
* **Partes Interessadas:**
    * **Comunidade de Desenvolvedores do GIMP:** Podem utilizar os resultados como um feedback externo para priorizar correções de bugs, otimizar o processo de build em diferentes sistemas operacionais e melhorar a compatibilidade com outros softwares do ecossistema de design gráfico.
    * **Usuários Finais (Designers, Fotógrafos, Artistas Digitais):** São os beneficiários diretos de um software mais estável e compatível, que não apresente falhas durante o uso profissional e que se integre de forma transparente a outras ferramentas.
    * **Professora e Monitores da Disciplina:** Avaliarão a capacidade da equipe de aplicar metodologias de qualidade de software de maneira estruturada e fundamentada.


## 3. Uso Pretendido dos Resultados

Os resultados desta avaliação são destinados a apoiar decisões estratégicas de desenvolvimento e a fornecer um panorama claro sobre a maturidade do produto nas áreas analisadas.

### 3.1. Cenário de Aplicação

Para contextualizar a análise, foi definido o seguinte cenário:

> *Um artista de efeitos visuais (VFX) utiliza o GIMP em um fluxo de trabalho que envolve múltiplos sistemas operacionais e softwares. O artista renderiza uma imagem no formato OpenEXR (`.exr`) no Blender (em um sistema Linux), precisa abrir e fazer ajustes de cores no GIMP (em um sistema Windows) e, por fim, importar o arquivo editado em um software de composição como o Natron. Qualquer falha de compatibilidade, corrupção de dados ou travamento durante esse processo impacta diretamente sua produtividade e a qualidade da entrega final.*

O gif abaixo mostra um pouco desse cenário:

<div align="center">
    Gif 1: Cenário de uso do GIMP
    <br>
    <img src="https://hdrmaps.com/wp-content/uploads/2022/05/gimp-convert-exr-to-hdr.gif" width="800">
    <br>
    <b>Fonte:</b> <a href="https://hdrmaps.com/blog/convert-exr-to-hdr-in-gimp-or-photoshop/">Convert .exr to .hdr in Gimp or Photoshop</a>.
    <br>
</div>


Este cenário justifica a escolha das características, pois o sucesso do artista depende diretamente da **Confiabilidade** do plug-in, da **Compatibilidade** do arquivo gerado e da **Portabilidade** do GIMP entre os sistemas.

### 3.2. Decisões a Serem Apoiadas

Os dados coletados e as conclusões da avaliação servirão para fundamentar as seguintes decisões:

| Característica      | Análise a ser feita                                                                                                                                  | Decisão Apoiada                                                                                                                          | Quem Decide?               |
| :------------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- | :------------------------- |
| **Confiabilidade** | Testes de estresse no plug-in `file-exr` com arquivos grandes ou corrompidos para identificar falhas e vazamentos de memória.                           | Priorizar a correção de bugs críticos que causam travamentos (`crashes`) ou corrupção de dados durante a manipulação de arquivos `.exr`. | Desenvolvedores do GIMP    |
| **Compatibilidade** | Verificar se os arquivos `.exr` exportados pelo GIMP são abertos corretamente e sem perda de dados em outros softwares padrão da indústria (ex: Blender, Krita). | Alinhar a implementação do `file-exr` com as especificações mais recentes do formato OpenEXR para garantir interoperabilidade total.      | Desenvolvedores do GIMP    |
| **Portabilidade** | Analisar a documentação e executar o processo de compilação e instalação do GIMP e seus plug-ins em diferentes sistemas operacionais (Windows, macOS, e distribuições Linux). | Simplificar e melhorar a documentação do processo de build para facilitar a instalação por novos usuários e colaboradores em diferentes ambientes. | Desenvolvedores do GIMP    |



## 4. Classificação e Ênfase das Características de Qualidade

Para direcionar o escopo da avaliação, as características de qualidade foram selecionadas e priorizadas com base nos objetivos definidos e no cenário de uso profissional do GIMP. A análise levou em conta as necessidades de usuários que dependem de um fluxo de trabalho estável e interoperável, bem como o interesse da comunidade de desenvolvimento em aprimorar o software.

A tabela a seguir apresenta a classificação das características do modelo **SQuaRE (ISO/IEC 25010)**, com a ênfase definida para cada uma em uma escala de 1 (nenhum interesse) a 5 (grande interesse).

| Característica de Qualidade (SQuaRE) | Ênfase (1 a 5) | Justificativa Breve                                                                                             |
| :----------------------------------- | :------------- | :-------------------------------------------------------------------------------------------------------------- |
| **Confiabilidade** | 5 – grande interesse | **Foco principal.** Falhas ou corrupção de dados durante a manipulação de arquivos impactam diretamente o trabalho profissional. |
| **Compatibilidade** | 5 – grande interesse | **Foco principal.** A capacidade de trocar arquivos (`.exr`, `.hdr`) com outros softwares é essencial para o cenário de uso.   |
| **Portabilidade** | 4 – largo interesse  | Sendo um software multiplataforma, é fundamental que a experiência de instalação e uso seja consistente entre sistemas.        |
| Adequação Funcional                  | 3 – médio interesse  | O GIMP é um software maduro. Assume-se que as funções básicas operam, o foco não é nelas, mas no plug-in específico. |
| Segurança                            | 2 – baixo interesse  | Para um software de edição de imagem offline, os riscos de segurança são considerados menos prioritários nesta avaliação.  |
| Eficiência de Desempenho             | 2 – baixo interesse  | Embora importante, a análise de velocidade e consumo de recursos não é o foco principal desta avaliação.                  |
| Manutenibilidade                     | 1 – nenhum interesse | A análise do código-fonte e sua facilidade de manutenção estão fora do escopo desta avaliação de produto.                 |
| Usabilidade                          | 1 – nenhum interesse | Característica explicitamente excluída dos critérios de avaliação pela disciplina.                               |

A alta prioridade atribuída à **Confiabilidade**, **Compatibilidade** e **Portabilidade** reflete diretamente as necessidades do cenário de um artista digital, que depende de um GIMP estável, capaz de se comunicar com outras ferramentas e de funcionar em diferentes ambientes de trabalho.

## 5. Referências Bibliográficas

  > 1. HDRMAPS. *Convert .exr to .hdr in Gimp or Photoshop*. HDRMAPS Blog, 2019. Disponível em: <https://hdrmaps.com/blog/convert-exr-to-hdr-in-gimp-or-photoshop/>. Acesso em: 27 set. 2025.  

  > 2. YOUTUBE. *Create HDRI file by converting .EXR to .HDR in GIMP!*. Publicado pelo canal **Einar Martinsen**, 2019. Disponível em: <https://www.youtube.com/watch?v=4DSdTTnfyDE>. Acesso em: 27 set. 2025.  

  > 3. SHOTKIT. *18 Best GIMP Plugins + Installation Guide*. Shotkit, 2022. Disponível em: <https://shotkit.com/gimp-plugins/>. Acesso em: 27 set. 2025.  

  > 4. ONEDAY TESTING. *A ISO/IEC 25010 e sua importância para a qualidade de software*. One Day Testing Blog, 2021. Disponível em: <https://blog.onedaytesting.com.br/iso-iec-25010/>. Acesso em: 27 set. 2025.  


### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 27/09/2025 | Criação do documento do porpósito da avaliação | [Larissa Stéfane](https://github.com/SkywalkerSupreme) | [Caio Venâncio](https://www.github.com/caio-venancio) |
| 1.0.1    | 28/09/2025 | Consertando trecho do índice | [Caio Venâncio](https://www.github.com/caio-venancio) |  |

