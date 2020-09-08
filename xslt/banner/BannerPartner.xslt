<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="customers" bg-img="/Data/Sites/1/media/home/bg.png">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <div class="customers-slider">
              <xsl:apply-templates select="/BannerList/Banner" mode="image"></xsl:apply-templates>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Banner" mode="image">
    <div class="item">
      <a>
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
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
            <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
          </figcaption>
        </figure>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>