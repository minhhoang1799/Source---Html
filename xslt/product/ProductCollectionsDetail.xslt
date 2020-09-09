<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/ProductDetail">
		<section class="the-workshop-product-2 main-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="product-detail-page">
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
										<li class="active"><a href="#tab-1"> Mô tả chi tiết</a></li>
										<li><a href="#tab-2">Bộ sưu tập</a></li>
										<li><a href="#tab-3">Lựa chọn khác</a></li>
									</ul> 
									<div class="tabslet-content active" id="tab-1">
										<div class="full-content">
											<xsl:value-of select="FullContent" disable-output-escaping="yes"/>
										</div>
										<div class="view-more"><a href="javascript:void(0)">Xem thêm</a></div>
									</div>
									<div class="tabslet-content" id="tab-2">
										<div class="row list-item">
											<xsl:apply-templates select="ProductInCollections"/>
										</div>
									</div>
									<div class="tabslet-content" id="tab-3">
										<div class="row list-item"> 
											<xsl:apply-templates select="ProductOtherInCollections"/>
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
