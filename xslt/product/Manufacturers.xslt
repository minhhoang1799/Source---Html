<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="title hidden-md-up d-flex justify-content-between">
      <h3>Filter Search</h3>
      <button class="collapsed btn btn-sm" data-toggle="collapse" data-target="#filterSearch" role="button" aria-expanded="false" aria-controls="filterSearch">
        <i class="fa fa-search"></i>
      </button>
    </div>
    <div class="ajaxbrandresponse">
      <div id="filterSearch">
        <h4>
          <xsl:value-of select="/ManufacturerList/ModuleTitle"></xsl:value-of>
        </h4>
        <xsl:apply-templates select="/ManufacturerList/Manufacturer"></xsl:apply-templates>
      </div>
    </div>
    <hr/>
  </xsl:template>

  <xsl:template match="Manufacturer">
    <!--<div class="checkbox">
      <a class="ajaxlink">
        <xsl:if test="IsActiveFilter='true'">
          <xsl:attribute name="class">
            <xsl:text>ajaxlink active</xsl:text>
          </xsl:attribute>
        </xsl:if>
        <xsl:attribute name="href">
          <xsl:value-of select="UrlFilter"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
    </div>-->
    <input type="checkbox" class="lkcheckbox">
      <xsl:attribute name="value">
        <xsl:value-of select="UrlFilter"></xsl:value-of>
      </xsl:attribute>
      <xsl:text> </xsl:text><xsl:value-of select="Title"></xsl:value-of>
    </input>
    <br></br>
  </xsl:template>
</xsl:stylesheet>