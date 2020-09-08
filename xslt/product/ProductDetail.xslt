<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
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
			<div class="col-md-7 product-img">
				<xsl:apply-templates select="/ProductDetail/ProductImages" mode="BigImages"></xsl:apply-templates>

				<div class="item-nav">

					<xsl:apply-templates select="/ProductDetail/ProductImages" mode="NavImages"></xsl:apply-templates>
				</div>
			</div>
			<div class="col-md-5 infomation">
				<h1>
					<xsl:value-of select="/ProductDetail/Title" disable-output-escaping="yes"></xsl:value-of>
					<xsl:value-of select="/ProductDetail/EditLink" disable-output-escaping="yes"></xsl:value-of>
				</h1>
				<!-- <div class="price">
            <span class="text-from">
			<xsl:value-of select="/ProductDetail/FromText" disable-output-escaping="yes"/></span>
					<xsl:value-of select="/ProductDetail/Price" disable-output-escaping="yes"></xsl:value-of>
				</div> -->
				<hr />
				<div class="html">
					<xsl:value-of select="/ProductDetail/FullContent" disable-output-escaping="yes"></xsl:value-of>
				</div>
				<xsl:if test="count(/ProductDetail/ProductWholesalePrice)>0">
					<table style="margin-top:10px;">
						<tbody>
							<xsl:apply-templates select="/ProductDetail/ProductWholesalePrice"></xsl:apply-templates>
						</tbody>
					</table>
				</xsl:if>
				<xsl:if test="/ProductDetail/ProductProperties!=''">
					<xsl:apply-templates select="/ProductDetail/ProductProperties"></xsl:apply-templates>
					<hr />
				</xsl:if>
				<div class="contact-btn">
					<a class="btn btn-contact" href="/contact">
						<xsl:value-of select="/ProductDetail/ContactText" />
						<span></span>
					</a>
				</div>
			</div>
			<div class="col-12 mt-4">
				<div id="productTabs">
					<ul>
						<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="nav"></xsl:apply-templates>
					</ul>
					<xsl:apply-templates select="/ProductDetail/ProductAttributes" mode="content"></xsl:apply-templates>
				</div>
			</div>
		</div>
		<xsl:if test="count(/ProductDetail/ProductOther)>0">
			<xsl:text disable-output-escaping="yes">
				&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/section&gt;</xsl:text>
			<section class="product-relates" bg-img="/Data/Sites/1/media/home/bg.png">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<h3 class="text-center">
								<xsl:value-of select="/ProductDetail/OtherProductsText" />
							</h3>
						</div>
					</div>
					<div class="row">
						<div class="col">
							<div class="boxproducts">
								<div class="product-relates-slider">
									<xsl:apply-templates select="/ProductDetail/ProductOther"></xsl:apply-templates>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ProductAttributes" mode="nav">
		<li>
			<a>
				<xsl:attribute name="href">
					<xsl:text disable-output-escaping="yes">#tab-</xsl:text>
					<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
				</xsl:attribute>
				<span>
					<xsl:value-of disable-output-escaping="yes" select="Title"></xsl:value-of>
				</span>
			</a>
		</li>
	</xsl:template>

	<xsl:template match="ProductAttributes" mode="content">
		<div class="product-tab-content">
			<xsl:attribute name="id">
				<xsl:text disable-output-escaping="yes">tab-</xsl:text>
				<xsl:value-of disable-output-escaping="yes" select="position()"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of disable-output-escaping="yes" select="Content"></xsl:value-of>
		</div>
	</xsl:template>

	<xsl:template match="ProductWholesalePrice">
		<tr>
			<td style="border-style: solid; border-width: 1px;">
				<xsl:value-of select="Title"></xsl:value-of>
			</td>
			<td style="border-style: solid; border-width: 1px;">
				<xsl:value-of select="DefaultWholesalePrice"></xsl:value-of>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="ProductImages" mode="BigImages">
		<xsl:if test="position()=1">
			<div class="item">
				<a href="./img/pd_1.png" data-fancybox="product-detail">
					<xsl:attribute name="href">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
					</xsl:attribute>
					</img>
				</a>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ProductImages" mode="NavImages">
		<xsl:if test="position()>1">
			<div class="item">
				<div class="img-wrap">
					<a href="./img/pd_1.png" data-fancybox="product-detail">
						<xsl:attribute name="href">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<img src="./img/pd_1.png">
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
				</div>
			</div>
		</xsl:if>
	</xsl:template>

	<xsl:template match="ProductOther">
		<div class="item">
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
						<p>
							<span class="text-from">
								<xsl:value-of select="/ProductDetail/FromText" disable-output-escaping="yes" /></span>
							<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
						</p>
					</figcaption>
				</figure>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="ProductProperties">
		<xsl:choose>
			<xsl:when test="FieldId=1">
				<h3>
					<xsl:value-of select="Title"></xsl:value-of>
				</h3>
				<xsl:apply-templates select="Options" mode="Color"></xsl:apply-templates>
				<input type="hidden">
				<xsl:attribute name="name">
					<xsl:text>product_attribute_</xsl:text>
					<xsl:value-of select="/ProductDetail/ProductId"></xsl:value-of>
					<xsl:text>_</xsl:text>
					<xsl:value-of select="FieldId"></xsl:value-of>
				</xsl:attribute>
				</input>
			</xsl:when>
			<xsl:otherwise>
				<h3 class="mt-3">
					<xsl:value-of select="Title"></xsl:value-of>
				</h3>
				<xsl:apply-templates select="Options" mode="Other"></xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="Options" mode="Color">
		<label class="checkbox-styled">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text>checkbox-styled active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<input type="radio">
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="name">
				<xsl:text>color</xsl:text>
				<!--<xsl:value-of select="Title"></xsl:value-of>-->
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-productid">
				<xsl:value-of select="ProductId"></xsl:value-of>
			</xsl:attribute>
			</input>
			<span>
				<xsl:value-of select="Title"></xsl:value-of>
			</span>
		</label>
	</xsl:template>

	<xsl:template match="Options" mode="Other">
		<label class="checkbox-styled">
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text>checkbox-styled active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<input type="radio">
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="name">
				<xsl:text>size</xsl:text>
				<!--<xsl:value-of select="Title"></xsl:value-of>-->
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="Title"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-id">
				<xsl:value-of select="OptionId"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="data-productid">
				<xsl:value-of select="ProductId"></xsl:value-of>
			</xsl:attribute>
			</input>
			<span>
				<xsl:value-of select="Title"></xsl:value-of>
			</span>
		</label>
	</xsl:template>

</xsl:stylesheet>