<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <ul class="navbar-nav" id="VienSoiNAV">
      <xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
    </ul>
  </xsl:template>

  <xsl:template match="Zone">
    <li class="nav-item">
      <xsl:choose>
        <xsl:when test="count(Zone)>0">
          <xsl:attribute name="class">
            <xsl:text>nav-item dropdown</xsl:text>
          </xsl:attribute>
          <xsl:if test="IsActive='true'">
            <xsl:attribute name="class">
              <xsl:text>nav-item dropdown active</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <a class="nav-link dropdown-toggle align-items-center d-flex" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <xsl:attribute name="id">
              <xsl:text>navbarDropdownMenuExample</xsl:text>
              <xsl:value-of select="position()"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <span>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </span>
          </a>
          <div class="dropdown-menu">
            <xsl:attribute name="aria-labelledby">
              <xsl:text>navbarDropdownMenuExample</xsl:text>
              <xsl:value-of select="position()"></xsl:value-of>
            </xsl:attribute>
            <xsl:apply-templates select="Zone" mode="Child"></xsl:apply-templates>
          </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="IsActive='true'">
            <xsl:attribute name="class">
              <xsl:text>nav-item active</xsl:text>
            </xsl:attribute>
          </xsl:if>
          <a class="nav-link align-items-center d-flex">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <span>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </span>
          </a>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="Zone" mode="Child">
    <a class="dropdown-item">
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="class">
          <xsl:text>dropdown-item active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="href">
        <xsl:value-of select="Url"></xsl:value-of>
      </xsl:attribute>
      <xsl:attribute name="target">
        <xsl:value-of select="Target"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
    </a>
  </xsl:template>

</xsl:stylesheet>