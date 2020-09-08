<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="row">
      <div class="col-12">
        <h2 class="text-center">
          <xsl:value-of select="/NewsList/ModuleTitle"></xsl:value-of>
        </h2>
      </div>
    </div>
    <div class="row">
      <div class="col-12">
        <div class="examples-slider">
          <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="News">
    <div class="item">
      <a>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <figure>
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <h3>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h3>
          </figcaption>
        </figure>
      </a>
    </div>
  </xsl:template>

</xsl:stylesheet>