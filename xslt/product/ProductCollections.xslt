<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/ZoneList">
		<xsl:apply-templates select="Zone[IsActive = 'true'][1]" /> 
  </xsl:template>
  <xsl:template match="Zone" > 
	<section class="product-list-2 main-section collections-template-list" style="display:none"> 
		<div class="container">
			<h2 class="main-title">
				<xsl:value-of select="Title"/>
			</h2>
			<div class="list-wrapper">
				<div class="list-item-2">
      				<xsl:apply-templates select="Product" mode="Left"/>
				</div> 
				<div class="image-collection">  
					<img>
			            <xsl:attribute name="alt">
			              <xsl:value-of select="Title"></xsl:value-of>
			            </xsl:attribute> 
			            <xsl:attribute name="src">
			              <xsl:value-of select="ImageUrl"></xsl:value-of>
			            </xsl:attribute>
					</img> 
				</div>
			</div>
			<div class="list-item"> 
      			<xsl:apply-templates select="Product" mode="Other"/>
			</div>  
		</div>
	</section> 
	<section class="the-workshop-product-2 main-section collections-template-detail" style="display:none;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-xl-3">
					<div class="image-top">
						<img >
				            <xsl:attribute name="alt">
				              <xsl:value-of select="Title"></xsl:value-of>
				            </xsl:attribute> 
				            <xsl:attribute name="src">
				              <xsl:value-of select="ImageUrl"></xsl:value-of>
				            </xsl:attribute>
						</img> 
					</div>
					<div class="list-product">
	      				<xsl:apply-templates select="Product" mode="detail" />
					</div>
				</div>
				<div class="col-lg-8 col-xl-9">
					<div class="product-detail-page-1">
						
					</div>
				</div>
			</div>
		</div>
	</section>
  </xsl:template>


  <xsl:template match="Product" mode="Left">
  	<xsl:if test="position() &lt; 5">
		<xsl:apply-templates select="."/>
  	</xsl:if>
  </xsl:template>
  <xsl:template match="Product" mode="Other">
  	
  	<xsl:if test="position() > 5">
		<xsl:apply-templates select="."/>
  	</xsl:if>
  </xsl:template>


  <xsl:template match="Product">
	<div class="item">
		<div class="image">
			<a href="#" onclick="CollectionsApp.getCollectionsDetailAndChangeTemplate(this,event);return false;">
				<img src="./img/3.png" alt="">
					<xsl:attribute name="alt">
					<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="src">
					<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
					</xsl:attribute>
				</img>
			 </a>
		</div>
		<div class="content">
			<p class="name-title">
              <xsl:value-of select="Title"></xsl:value-of>
          	</p>
			<a href="#" onclick="CollectionsApp.getCollectionsDetailAndChangeTemplate(this,event);return false;">
	            <xsl:attribute name="data-id">
	              <xsl:value-of select="ProductId"></xsl:value-of>
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
				<xsl:text>See detail</xsl:text>
	         </a>
		</div>
	</div>
  </xsl:template>
  
<xsl:template match="Product" mode="detail">
	<div class="product-item">
		<div class="name"> 
			<a href="#" onclick="CollectionsApp.getCollectionsDetail(this,event);return false;">
	            <xsl:attribute name="data-id">
	              <xsl:value-of select="ProductId"></xsl:value-of>
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
	              <xsl:value-of select="Title"></xsl:value-of>
	        </a>
		</div>
		<div class="image">
			<a href="#" onclick="CollectionsApp.getCollectionsDetail(this,event);return false;">
	            <xsl:attribute name="data-id">
	              <xsl:value-of select="ProductId"></xsl:value-of>
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
				<img src="./img/3.png" alt="">
		            <xsl:attribute name="alt">
		              <xsl:value-of select="Title"></xsl:value-of>
		            </xsl:attribute>
		            <xsl:attribute name="src">
		              <xsl:value-of select="ThumbnailUrl"></xsl:value-of>
		            </xsl:attribute>
				</img>
			</a>
		</div>
		<div class="see-detail">
			<a href="#" onclick="CollectionsApp.getCollectionsDetail(this,event);return false;">
	            <xsl:attribute name="data-id">
	              <xsl:value-of select="ProductId"></xsl:value-of>
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
	            See details
	        </a>
		</div>
	</div> 
  </xsl:template>
</xsl:stylesheet>
