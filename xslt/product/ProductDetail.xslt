<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ProductDetail">
		<section class="the-workshop-product-2 main-section">
			<div class="container">
				<div class="row">
					<div class="col-12 mb-2">
						<div class="link-pre-after">
							<xsl:if test="/ProductDetail/ProductPrevious/Url != '' ">
								<a class="link-pre">
									<xsl:attribute name="href">
										<xsl:value-of select="/ProductDetail/ProductPrevious/Url" />
									</xsl:attribute>
									<xsl:value-of select="/ProductDetail/PreviousText" />
								</a>
							</xsl:if>

							<xsl:if test="/ProductDetail/ProductAfter/Url != '' ">
								<a class="link-after">
									<xsl:attribute name="href">
										<xsl:value-of select="/ProductDetail/ProductAfter/Url" />
									</xsl:attribute>
									<xsl:value-of select="/ProductDetail/NextText" />
								</a>
							</xsl:if>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="product-detail-page-2">
							<div class="main-product-top">
								<div class="row">
								
									<div class="col-lg-7">
										<div class="main-slick">
											<div class="slick-wrapper">
												<xsl:apply-templates select="ProductImages"/>
											</div>
										</div>
									</div>
									<div class="col-lg-5"> 
										<div class="box-content">
											<h1 class="name">
												<xsl:value-of select="Title" disable-output-escaping="yes"/>
											</h1>
												<xsl:value-of select="EditLink" disable-output-escaping="yes"/>
											<div class="brief-content">
												<xsl:value-of select="BriefContent" disable-output-escaping="yes"/>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="main-product-bottom">
								<div class="tabslet" data-toggle="tabslet">
									<ul class="tabslet-tab">
										<li class="active"><a href="#tab-1">Description</a></li>
										<xsl:apply-templates select="ProductAttributes" mode="Tab"/>
										<li><a href="#tab-98">Collections</a></li>
										<li><a href="#tab-99">More choices</a></li>
									</ul> 
									<div class="tabslet-content active" id="tab-1">
										<div class="full-content">
											<xsl:value-of select="FullContent" disable-output-escaping="yes"/>
										</div>
										<div class="view-more"><a href="javascript:void(0)">View more</a></div>
									</div>
										<xsl:apply-templates select="ProductAttributes" mode="Content"/>
									<div class="tabslet-content" id="tab-98">
										<div class="row list-item">
											<xsl:apply-templates select="ProductOtherInCollections"/>
										</div>
									</div> 
									<div class="tabslet-content" id="tab-99">
										<div class="row list-item"> 
											<xsl:apply-templates select="ProductInCollections"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Tab">
		<li class="">
			<a href="#tab-1">
				<xsl:attribute name="href">
					<xsl:text>#tab-</xsl:text>
					<xsl:value-of select="position() + 1"/>
				</xsl:attribute>
				<xsl:value-of select="Title" />
			</a>
		</li>
	</xsl:template>
	<xsl:template match="ProductAttributes" mode="Content">
		<div class="tabslet-content" >
				<xsl:attribute name="id">
					<xsl:text>tab-</xsl:text>
					<xsl:value-of select="position() + 1"/>
				</xsl:attribute>
			<div class="row list-item"> 
				<xsl:value-of select="Content" disable-output-escaping="yes"/>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductInCollections" >
		<div class="col-sm-6 col-md-4">
			<div class="item">
				<div class="image">
					<img src="./img/1.png" alt="">
			            <xsl:attribute name="alt">
			              <xsl:value-of select="Title"/>
			            </xsl:attribute>
			            <xsl:attribute name="src">
			              <xsl:value-of select="ThumbnailUrl"/>
			            </xsl:attribute>
					</img>
				</div>
				<div class="content">
					<a class="btn-right" href="#">
			            <xsl:attribute name="href">
			              <xsl:value-of select="Url"/>
			            </xsl:attribute>
			            <xsl:attribute name="title"> 
			              <xsl:value-of select="Title"/>
			            </xsl:attribute>
			            <xsl:attribute name="target">
			              <xsl:value-of select="Target"/>
			            </xsl:attribute>
			              <xsl:value-of select="Title"/>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductOtherInCollections" >
		<div class="col-sm-6 col-md-4">
			<div class="item">
				<div class="image">
					<img src="./img/1.png" alt="">
			            <xsl:attribute name="alt">
			              <xsl:value-of select="Title"/>
			            </xsl:attribute>
			            <xsl:attribute name="src">
			              <xsl:value-of select="ThumbnailUrl"/>
			            </xsl:attribute>
					</img>
				</div>
				<div class="content">
					<a class="btn-right" href="#">
			            <xsl:attribute name="href">
			              <xsl:value-of select="Url"/>
			            </xsl:attribute>
			            <xsl:attribute name="title"> 
			              <xsl:value-of select="Title"/>
			            </xsl:attribute>
			            <xsl:attribute name="target">
			              <xsl:value-of select="Target"/>
			            </xsl:attribute>
			              <xsl:value-of select="Title"/>
					</a>
				</div>
			</div>
		</div>
	</xsl:template>
	<xsl:template match="ProductImages" >
		<div class="slick-slide">
			<div class="image-product">
				<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"/>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"/>
					</xsl:attribute>
				</img>
			</div>
		</div> 
	</xsl:template>
</xsl:stylesheet>
