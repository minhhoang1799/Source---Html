<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <section class="news-details">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <time>
              <xsl:value-of select="/NewsDetail/CreatedDate" disable-output-escaping="yes"></xsl:value-of>
            </time>
            <h1>
              <xsl:value-of select="/NewsDetail/Title" disable-output-escaping="yes"></xsl:value-of>
              <xsl:value-of select="/NewsDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
            </h1>
			<div class="social-news clearfix">				
				<div class="face-like">
				<xsl:value-of select="/NewsDetail/FacebookLike" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="fb-share-button" data-layout="button_count"></div>
				<div class="tweet">
				<xsl:value-of select="/NewsDetail/TweetThis" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<div class="google">
				<xsl:value-of select="/NewsDetail/PlusOne" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</div>
            <xsl:value-of select="/NewsDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <div class="col-md-4">
            <div class="othernews">
              <h3>Tin liên quan</h3>
              <hr/>
              <div class="lists">
                <xsl:apply-templates select="/NewsDetail/NewsOther"></xsl:apply-templates>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </xsl:template>

  <xsl:template match="NewsOther">
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
      <div class="media">
        <img class="img-fluid mr-3">
          <xsl:attribute name="src">
            <xsl:value-of select="ImageUrl"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
        <div class="media-body">
          <h2 class="mt-0">
            <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
          </h2>
        </div>
      </div>
    </a>
  </xsl:template>

</xsl:stylesheet>