<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
	<section class="featured" bg-img="/Data/Sites/1/media/home/bg-01.png">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<h2 class="text-center">
			  <xsl:value-of select="/ZoneList/ModuleTitle"></xsl:value-of>
			</h2>
			<div class="covernav">
			  <ul class="nav justify-content-center justify-content-between">
				<xsl:apply-templates select="/ZoneList/Zone" mode="Nav"></xsl:apply-templates>
			  </ul>
			</div>
		  </div>
		</div>
		<div class="row">
		  <div class="col-12">
			<div class="boxproducts">
			  <div class="tab-content" id="myTabContent">
				<xsl:apply-templates select="/ZoneList/Zone" mode="Products"></xsl:apply-templates>
			  </div>

			</div>
		  </div>
		</div>
	  </div>
	</section>
  </xsl:template>

  <xsl:template match="Zone" mode="Nav">
	<li class="nav-item">
	  <a class="nav-link" data-toggle="tab" href="#profile" role="tab">
		<xsl:attribute name="href">
		  <xsl:text>#tab</xsl:text>
		  <xsl:value-of select="ZoneId"/>
		</xsl:attribute>
		<xsl:if test="position()=1">
		  <xsl:attribute name="class">
			<xsl:text>nav-link active</xsl:text>
		  </xsl:attribute>
		</xsl:if>
		<figure>
		  <img class="hover-img">
			<xsl:attribute name="src">
			  <xsl:value-of select="ImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
			  <xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		  </img>
		  <img class="second-img">
		  	<xsl:attribute name="src">
			  <xsl:value-of select="SecondImageUrl"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="alt">
			  <xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
		  </img>
		</figure>
		<span>
		  <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
		</span>
	  </a>
	</li>
  </xsl:template>

  <xsl:template match="Zone" mode="Products">
	<div class="tab-pane fade" id="home" role="tabpanel">
	  <xsl:attribute name="id">
		<xsl:text>tab</xsl:text>
		<xsl:value-of select="ZoneId"/>
	  </xsl:attribute>
	  <xsl:if test="position()=1">
		<xsl:attribute name="class">
		  <xsl:text>tab-pane fade show active</xsl:text>
		</xsl:attribute>
	  </xsl:if>

	  <div class="row no-gutters">
		<xsl:apply-templates select="Product"></xsl:apply-templates>
	  </div>
	</div>
  </xsl:template>

  <xsl:template match="Product">
	<div class="col-sm-6 col-md-3 item">
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
			<h3>
			  <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</h3>
			<!-- <p>
			<span class="text-from">
			<xsl:value-of select="/ZoneList/FromText" disable-output-escaping="yes"/></span>
			<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
			</p> -->
		  </figcaption>
		</figure>
	  </a>
	</div>
  </xsl:template>

</xsl:stylesheet>