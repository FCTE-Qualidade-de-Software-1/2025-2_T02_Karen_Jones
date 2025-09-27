# Justificativa e Objetivos da Avaliação

## Módulo file-exr do Software GIMP

### **1. Introdução**

Este documento tem como objetivo apresentar a justificativa e os objetivos que norteiam a avaliação de qualidade do módulo `file-exr`, um componente do software de edição de imagens GIMP. A análise proposta utilizará como base conceitual as características de qualidade de produto definidas pela norma ISO/IEC 25010, focando nos aspectos mais críticos para a usabilidade e aceitação do software em ambientes de produção profissional.

### **2. Justificativa da Avaliação**

A avaliação de qualidade do módulo `file-exr` do GIMP justifica-se por sua importância estratégica e pelos riscos operacionais associados ao seu funcionamento. Este módulo é o principal responsável pela manipulação de arquivos no formato OpenEXR (`.exr`), padrão da indústria para imagens de alta faixa dinâmica (HDR). Uma análise preliminar revelou a existência de diversas **[issues](https://gitlab.gnome.org/GNOME/gimp/-/issues/?sort=created_date&state=opened&search=exr&first_page_size=20)** (relatos de problemas) abertas pela comunidade, que reportam instabilidades e comportamentos inesperados, confome a Imagem 1. Este fato foi um dos principais motivos para a escolha do módulo como objeto de avaliação, tornando uma investigação formal necessária.

<p class="legenda"><em>Figura 1: Screenshot do painel de Issues do GIMP relacionadas a arquivos EXR</em></p>

![Screenshot do gitlab da GIMP, mostrando 65 Issues abertas relacionadas a problemas no EXR](../img/issues.png)

<p class="legenda"><em>Fonte: <a href="https://www.enderecodosite.com.br">https://gitlab.gnome.org/GNOME/gimp</a></em></p>

Diante desse cenário, a avaliação se concentra primeiramente na **Confiabilidade**. Esta característica é vista como o pilar fundamental da experiência do usuário, pois falhas neste quesito podem levar a travamentos inesperados (*crashes*), corrupção de arquivos e, consequentemente, perda de trabalho. Um módulo que não é confiável compromete a reputação de todo o software. Em paralelo, a **Compatibilidade** surge como um fator igualmente crítico. A capacidade de interoperar com outros softwares do ecossistema gráfico não é apenas um diferencial, mas um requisito essencial. Falhas na leitura ou escrita de arquivos `.exr` quebram os fluxos de produção e limitam severamente a adoção do GIMP por profissionais.

Finalmente, a **Portabilidade** completa o trio de características selecionadas. Sendo o GIMP um projeto multiplataforma por excelência, é imperativo que a funcionalidade do módulo `file-exr` seja consistente e previsível em todos os principais sistemas operacionais (Windows, macOS e Linux). Garantir a portabilidade significa assegurar uma experiência coesa para toda a base de usuários, independentemente de seu ambiente computacional.

### **3. Objetivos da Avaliação**

Com base na justificativa apresentada, os objetivos específicos e práticos desta avaliação são:

* **Executar** testes de robustez para avaliar a **Confiabilidade** do módulo, submetendo-o a um conjunto de arquivos `.exr` válidos, corrompidos e com parâmetros inesperados, a fim de registrar e classificar as falhas resultantes.
* **Verificar** a **Compatibilidade** (interoperabilidade) do módulo, confirmando que os arquivos gerados pelo GIMP podem ser abertos e interpretados corretamente por, no mínimo, dois outros softwares de referência da indústria (como Krita e Blender), e vice-versa.
* **Confirmar** a **Portabilidade** do módulo, garantindo que sua compilação e execução ocorram sem erros e com comportamento consistente em, no mínimo, dois sistemas operacionais distintos (por exemplo, uma distribuição Linux e Windows).

A descrição mais detalhada das subcaracterísticas utilizadas podem ser encontradas na aba de [Modelo de Qualidade e Escopo](5-modelo.md).

### **4. Referências**

> GIMP - The GNU Image Manipulation Program. Disponível em: <https://www.gimp.org>. Acesso em: 27 set. 2025.

> GNOME. GIMP Project Repository. [2025]. Disponível em: <https://gitlab.gnome.org/GNOME/gimp>. Acesso em: 27 set. 2025.

> INTERNATIONAL ORGANIZATION FOR STANDARDIZATION. ISO/IEC 25000: Software engineering — Software product Quality Requirements and Evaluation (SQuaRE) — Guide to SQuaRE. First edition. Geneva: ISO, 2005.

---

### **Histórico de Versão**

| Versão | Data       | Descrição                                         | Autor          | Revisor          |
| :----- | :--------- | :------------------------------------------------ | :------------- | :--------------- |
| 1.0    | 27/09/2025 | Criação da versão inicial do documento de avaliação. | [Arthur Evangelista](https://www.github.com/arthurevg)     | [Caio Venâncio](https://www.github.com/caio-venancio)|


---