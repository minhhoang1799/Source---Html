<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/ZoneList">
    <h2 class="main-title">
     <xsl:value-of select="Title"/>
     <xsl:value-of select="count(Zone)"/>
    </h2>  
    <div class="row">  
      <xsl:apply-templates select="Zone"/>
    </div> 
  </xsl:template>

  <xsl:template match="Zone">
    <div class="col-sm-6 col-md-4 col-lg-3">
      <div class="item">
        <div class="image">
          <img src="./img/1.png" alt="">
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
          </img>
        </div>
        <div class="content">
          <a class="btn-right" href="#">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
             <xsl:value-of select="Title"></xsl:value-of>
            <em class="lnr lnr-arrow-right"></em>
          </a>
        </div>
      </div>
    </div> 
  </xsl:template>
</xsl:stylesheet>