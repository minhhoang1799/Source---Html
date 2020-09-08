<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="promotion">
      <div class="slider-lists">
        <xsl:apply-templates select="/BannerList/Banner" mode="image"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Banner" mode="image">
    <div class="item">
      <xsl:attribute name="bg-img">
        <xsl:value-of select="ImageUrl"></xsl:value-of>
      </xsl:attribute>
    </div>
  </xsl:template>
</xsl:stylesheet>