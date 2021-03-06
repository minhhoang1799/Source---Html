<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="ajaxresponse clearfix">
      <div class="row pager">
        <div class="col-6 mt-3 d-flex align-items-center">
          <select class="ajaxsort custom-select my-1 mr-sm-2">
            <xsl:apply-templates select="/ProductList/SortBy"></xsl:apply-templates>
          </select>
        </div>
        <div class="col-6 mt-3 d-flex align-items-center justify-content-end">
          <ul class="pagination pagination-sm mb-0 ajaxsort">
            <xsl:apply-templates select="/ProductList/PageSize"/>
          </ul>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="boxproducts">
            <div class="row no-gutters ajaxresponsewrap">
              <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
            </div>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="PageSize">
    <li class="page-item">
      <xsl:if test="IsActive='class'">
        <xsl:attribute name="selected">
          <xsl:text>page-item active</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <a class="page-link" title="title">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <xsl:value-of select="Title"></xsl:value-of>
      </a>
    </li>
  </xsl:template>

  <xsl:template match="SortBy">
    <option>
      <xsl:if test="IsActive='true'">
        <xsl:attribute name="selected">
          <xsl:text>selected</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="value">
        <xsl:value-of select="Url"></xsl:value-of>
      </xsl:attribute>
      <xsl:value-of select="Title"></xsl:value-of>
    </option>
  </xsl:template>

  <xsl:template match="Product">
    <div class="col-sm-6 col-md-4 item">
      <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
      <a>
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
          <img>
            <xsl:attribute name="src">
              <xsl:value-of select="ImageUrl"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="alt">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
          </img>
          <figcaption>
            <h2>
              <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </h2>
			<!--LK Custom-->
            <div class="min-quantity">
				<xsl:value-of select="/ProductList/MinQuantity"></xsl:value-of>
              <span class="quantity-mod">
                <xsl:value-of select="StockQuantity" disable-output-escaping="yes"></xsl:value-of>
              </span>
            </div>
            <!--LK Custom-->
            <!-- <p>
             
            <span class="text-from">
			<xsl:value-of select="/ProductList/FromText" disable-output-escaping="yes"/></span>
			 <xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
            </p> -->
          </figcaption>
        </figure>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>