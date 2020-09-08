<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">

		<section class="examples-hot">
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
					<xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match="News">
		<div class="col-sm-6 col-md-4 mb-4">
			<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
			<a class="item">
		
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
						<h3>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</h3>
						<xsl:if test="SubTitle!=''">
							<h4>
								<xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
							</h4>
						</xsl:if>
					</figcaption>
				</figure>
			</a>
		</div>
	</xsl:template>

</xsl:stylesheet>