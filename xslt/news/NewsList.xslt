<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="news-hot">
      <div class="container">
        <div class="row">
          <div class="col text-center mb-4">
            <h2>
              <xsl:value-of select="/NewsList/ZoneTitle"></xsl:value-of>
            </h2>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-7 top-list">
            <xsl:apply-templates select="/NewsList/News" mode="Big"></xsl:apply-templates>
          </div>
          <div class="col-md-5 part-list">
            <xsl:apply-templates select="/NewsList/News" mode="Part"></xsl:apply-templates>
          </div>
        </div>
      </div>
    </section>
    <section class="news-list">
      <div class="container">
        <div class="row" id="products">
          <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="News" mode="Big">
    <xsl:if test="position()=1">
      <a class="item">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <figure>
          <img class="img-fluid">
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <time>
              <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
            </time>
            <h3>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h3>
          </figcaption>
        </figure>
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News" mode="Part">
    <xsl:if test="position()&gt;1 and position()&lt;4">
      <a class="item">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <figure>
          <img class="img-fluid">
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <time>
              <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
            </time>
            <h3>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h3>
          </figcaption>
        </figure>
      </a>
    </xsl:if>
  </xsl:template>

  <xsl:template match="News">
    <xsl:if test="position()&gt;3">
      <div class="col-sm-6 col-md-4 mb-4">
        <a class="item">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="target">
            <xsl:value-of select="Target"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
          <figure>
            <img class="img-fluid">
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
            <figcaption>
              <time>
                <xsl:value-of select="CreatedDate" disable-output-escaping="yes"></xsl:value-of>
              </time>
              <h3>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </h3>
              <div class="desc">
                <xsl:value-of select="BriefContent" disable-output-escaping="yes"></xsl:value-of>
              </div>
            </figcaption>
          </figure>
        </a>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>