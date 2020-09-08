<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="covernav">
			<ul class="nav justify-content-center justify-content-between">
				<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
			</ul>
		</div>
		<div class="product-nav-child">
			<ul class="nav-product-2 d-flex flex-wrap">
				<xsl:apply-templates select="/ZoneList/Zone" mode="Child"></xsl:apply-templates>
			</ul>
		</div>
	</xsl:template>

	<xsl:template match="Zone">
		<li class="nav-item flex-fill">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text>nav-item flex-fill active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a class="nav-link">
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
				</figure>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
			</a>
		</li>
	</xsl:template>

	<xsl:template match="Zone" mode="Child">
		<xsl:if test="IsActive='true'">
			<xsl:apply-templates select="Zone" mode="NavChild"></xsl:apply-templates>
		</xsl:if>
	</xsl:template>


	<xsl:template match="Zone" mode="NavChild">
		<li class="nav-item">
			<a class="nav-link">
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>nav-link active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="target">
					<xsl:value-of select="Target"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<span>
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
			</a>
		</li>
	</xsl:template>



</xsl:stylesheet>