<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:my="my:my">
  <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title></title>
        
        <!--Script Tags-->
        <script language="javascript" type="text/javascript">
          <xsl:comment>
                <![CDATA[
                    var IS_IPAD = navigator.userAgent.match(/iPad/i) != null;
                    var IS_IPHONE = (navigator.userAgent.match(/iPhone/i) != null) || (navigator.userAgent.match(/iPod/i) != null);
					var	IS_ANDROID = navigator.userAgent.toLowerCase().indexOf("android") > -1;
                        if(IS_IPAD || IS_IPHONE){                    
                             document.write("<script language='javascript' src='./Scripts/JQuery/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='./Files/AccountDashboardFiles/highcharts.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='./Files/AccountDashboardFiles/AccountDashboard.js?v=5.4.0.0' type='text/javascript'></script>");
                        }
                        else if(IS_ANDROID){                  
                             document.write("<script language='javascript' src='file:///android_asset/www/Dashboard/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='file:///android_asset/www/Dashboard/highcharts.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='file:///android_asset/www/Dashboard/AccountDashboard.js?v=5.4.0.0' type='text/javascript'></script>");
                        }
                        else{                    
                             document.write("<script language='javascript' src='/Scripts/JQuery/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='/Files/AccountDashboardFiles/highcharts.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='/Files/AccountDashboardFiles/AccountDashboard.js?v=5.4.0.0' type='text/javascript'></script>");
                        }                
                ]]>
          </xsl:comment>
        </script>
        
        <!--Css Tags-->
        <style>
          body{ font-size: 100%; font-size: 16px; font-size: 1em; color:#555555;height:100%; overflow: hidden;}
          .unitsrevenusCharts {height:85%;margin-left:5.2083%;width: 44.421%; font-size:0.75em;}
          .fl{float: left}
          .container{width: 96%;}
          .mainTitle{text-align:center;}
          .total{text-align:left; color:#4E81D4; font-size:1.5em;height:10%; font-weight:bold;margin-left:5.2083%;}
        </style>        
      </head>
      <body>
        <div class="container">
          <div class="mainTitle">
            <xsl:value-of select="//Companies/ChartName" />
          </div>
          
          <div id="brammer" class="unitsrevenusCharts fl">           
          </div>

          <div id="BuckAndHickman" class="unitsrevenusCharts fl">
          </div>
        </div>                          
        <script language="javascript" type="text/javascript">          
          <xsl:comment>
                <![CDATA[
                          $("#units").empty();
                          $("#revenus").empty();
                          var X_axis_brammer = new Array();
                          var Y_axis_brammer = new Array(); 
                          var X_axis_BuckHickman = new Array();
                          var Y_axis_BuckHickman = new Array();                           
                  ]]>

                <![CDATA[var ChartTitleBrammer = "]]><xsl:value-of select="//Company[@ID=1]/CompanyName" /><![CDATA[";]]>
                <xsl:for-each select="//Company[@ID=1]/SalesByFields/Field">                  
                  <![CDATA[var dataX = "]]><xsl:value-of select="FieldName" /><![CDATA[";]]>
                  <![CDATA[var dataY = "]]><xsl:value-of select="FieldValue" /><![CDATA[" == '' ? 0 :]]><![CDATA["]]><xsl:value-of select="FieldValue" /><![CDATA[";]]>
                  <![CDATA[
                            X_axis_brammer.push(dataX); 
                            Y_axis_brammer.push(parseInt(dataY));                                                            
                  ]]>                                                                                                            
                </xsl:for-each>

                <![CDATA[var ChartTitleBuckHickman = "]]><xsl:value-of select="//Company[@ID=2]/CompanyName" /><![CDATA[";]]>
                <xsl:for-each select="//Company[@ID=2]/SalesByFields/Field">
                  <![CDATA[var dataX = "]]><xsl:value-of select="FieldName" /><![CDATA[";]]>
                  <![CDATA[var dataY = "]]><xsl:value-of select="FieldValue" /><![CDATA[" == '' ? 0 :]]><![CDATA["]]><xsl:value-of select="FieldValue" /><![CDATA[";]]>
                  <![CDATA[
                            X_axis_BuckHickman.push(dataX); 
                            Y_axis_BuckHickman.push(parseInt(dataY)); 
                  ]]>             
                </xsl:for-each>

                <![CDATA[var totalSalesBrammer = "]]><xsl:value-of select="//Company[@ID=1]/TotalSales/Field/FieldName" />: <xsl:value-of select="//Company[@ID=1]/TotalSales/Field/FieldValue" /><![CDATA[";]]>                                                
                <![CDATA[var totalSalesBuckHickman = "]]><xsl:value-of select="//Company[@ID=2]/TotalSales/Field/FieldName" />: <xsl:value-of select="//Company[@ID=2]/TotalSales/Field/FieldValue" /><![CDATA[";]]>
            
                <![CDATA[ 
                          Charts.buildUnitsChart(X_axis_brammer, Y_axis_brammer, ChartTitleBrammer);
                          Charts.buildRevenusChart(X_axis_BuckHickman, Y_axis_BuckHickman, ChartTitleBuckHickman);
                          
                           $("#brammer").append("<div class='total'>" + totalSalesBrammer + "</div>");
                           $("#BuckAndHickman").append("<div class='total'>" + totalSalesBuckHickman + "</div>");
                          
                ]]>                           
           </xsl:comment>
        </script>
        <br>
        </br>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>