<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <div class="container">
      <h2>
        <xsl:value-of select="/ZoneList/Title" />
      </h2>
      <div class="row no-gutters link-wrap">
        <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Zone">
    <div class="col-lg-4 col-sm-6 item-wrap">
      <div class="item">
        <div class="img">
          <img src="./img/product/p_1.png">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl" />
          </xsl:attribute>
          </img>
        </div>
        <div class="link">
          <h4>
            <xsl:value-of select="Title" />
          </h4>
          <ul>
            <xsl:apply-templates select="Zone" mode="Child" />

          </ul>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="Zone" mode="Child">
    <li>
      <a href="#">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="target">
          <xsl:value-of select="Target"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
      <xsl:if test="count(Zone)>0">
        <ul class="menu-side-child-lv-4 pl-3">
          <xsl:apply-templates select="Zone" mode="Child" />
        </ul>
      </xsl:if>
    </li>
  </xsl:template>

</xsl:stylesheet>