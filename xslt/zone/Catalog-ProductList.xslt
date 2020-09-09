<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes" />

<xsl:template match="/">

	<div class="menu-side-wrap">
	<h2>
		<xsl:value-of select="/ZoneList/ModuleTitle" />
	</h2>
	<xsl:apply-templates select="/ZoneList/Zone" />
	</div>
</xsl:template>

<xsl:template match="Zone">
	<ul class="list-unstyled menu-side">
	<xsl:apply-templates select="Zone" mode="Child1" />
	</ul>
</xsl:template>
<xsl:template match="Zone" mode="Child1">
	<li>
	<xsl:if test="IsActive='true'">
		<xsl:attribute name="class">
		<xsl:text>active</xsl:text>
		</xsl:attribute>
	</xsl:if>
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
		<xsl:if test="count(Zone)>0">
		<xsl:attribute name="class">
			<xsl:text>hassub</xsl:text>
		</xsl:attribute>

		</xsl:if>
		<xsl:value-of select="Title"></xsl:value-of>
	</a>
	<xsl:if test="count(Zone)>0">
		<ul class="menu-side-child">
		<xsl:apply-templates select="Zone" mode="Child" />
		</ul>
	</xsl:if>
	</li>
</xsl:template>

<xsl:template match="Zone" mode="Child">
	<li>
	<xsl:if test="IsActive='true'">
		<xsl:attribute name="class">
		<xsl:text>active</xsl:text>
		</xsl:attribute>
	</xsl:if>
	<a>
		<xsl:if test="count(Zone)>0">
		<xsl:attribute name="class">
			<xsl:text>hassub</xsl:text>
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
		<xsl:value-of select="Title"></xsl:value-of>
	</a>
	<xsl:if test="count(Zone)>0">
		<ul class="menu-side-child menu-side-child-lv4">
		<xsl:apply-templates select="Zone" mode="Child" />
		</ul>
	</xsl:if>
	</li>
</xsl:template>

</xsl:stylesheet>
