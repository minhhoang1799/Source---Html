<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <section class="home">
      <div class="slider-lists">
        <xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="Banner">
    <xsl:choose>
      <xsl:when test="Description!=''">
        <div class="item">
          <xsl:attribute name="bg-img-responsive">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="bg-img-responsive-sm">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="bg-img-responsive-xs">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <div class="img">
            <img src="/Data/Sites/1/media/icon/slider-icon.png" alt="Icon" />
          </div>
          <div class="top">
            <h2 class="subject">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h2>
            <div class="desc">
              <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
            </div>
          </div>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <div class="item" style="min-height: auto;">
          <xsl:if test="ThumbnailUrl != ''">
            <img style="max-width: 100%; width: 100%;" class="desktop">
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
            <img style="max-width: 100%; width: 100%;" class="mobile">
              <xsl:attribute name="src">
                <xsl:value-of select="ThumbnailUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </xsl:if>
          <xsl:if test="ThumbnailUrl = ''">
            <img style="max-width: 100%; width: 100%;">
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
          </xsl:if>
          <div class="bottom">
            <h2 class="subject">
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h2>
          </div>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>