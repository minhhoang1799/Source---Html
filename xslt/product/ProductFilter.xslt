<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div class="ajaxfilterresponse">
		<div class="filter-group clearfix">
			<div class="filter-title">
			  <h4>
				<xsl:text>Price: </xsl:text>
				<span id="min">
				  <xsl:value-of select="/ProductFilter/PriceMinText"/>
				</span>
				<xsl:text> - </xsl:text>
				<span id="max">
				  <xsl:value-of select="/ProductFilter/PriceMaxText"/>
				</span>
			  </h4>
			</div>
			<div class="filter-range">
				<div id="slider-range" onchange="showVal(this.value)"></div>
				<div class="price-range">
					<div class="sliderValue min-input" data-index="0" style="float:left">
					  <xsl:value-of select="/ProductFilter/PriceMinText"/>
					</div>
					<div class="sliderValue max-input" data-index="1" style="float:right">
					  <xsl:value-of select="/ProductFilter/PriceMaxText"/>
					</div>
				</div>
				<div class="hidden" style="display:none;">
				<a class="urlwithoutprice">
				  <xsl:attribute name="href">
					<xsl:value-of select="/ProductFilter/UrlWithoutPrice"></xsl:value-of>
				  </xsl:attribute>
				</a>
				<a class="urlwithprice">
				  <xsl:attribute name="href">
					<xsl:value-of select="/ProductFilter/UrlWithPrice"></xsl:value-of>
				  </xsl:attribute>
				</a>
				<a class="pricemin">
				  <xsl:value-of select="/ProductFilter/PriceMin"></xsl:value-of>
				</a>
				<a class="pricemax">
				  <xsl:value-of select="/ProductFilter/PriceMax"></xsl:value-of>
				</a>
				</div>
			</div>
		</div>
      <input id="hdfCurrentPoint" name="hdfCurrentPoint" type="hidden" value="0"></input>
      <br><hr/></br>
      <h4>Min Order Quantity: <span id="currentPoint">0</span></h4>
      <input type="range" min="0" max="50" value="0" class="slider" id="myRange" style="width:100%"/>
      <span>
        <xsl:text>0</xsl:text>
      </span>
      <span class="pull-right">
        <xsl:text>50</xsl:text>
      </span>
    </div>
    <script type="text/javascript">
      function showVal(sliderVal){
      sliderVal += '';
      arr = sliderVal.split(',');
      document.getElementById("min").innerHTML=lkAddCommas(arr[0]);
      document.getElementById("max").innerHTML=lkAddCommas(arr[1]);
      }

      function lkAddCommas(nStr) {
      nStr += '';
      x = nStr.split('.');
      x1 = x[0];
      x2 = x.length > 1 ? '.' + x[1] : '';
      var rgx = /(\d+)(\d{3})/;
      while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + '.' + '$2');
      }
      return x1 + x2;
      }
    </script>
  </xsl:template>
</xsl:stylesheet>