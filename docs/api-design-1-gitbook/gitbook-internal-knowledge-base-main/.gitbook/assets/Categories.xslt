<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
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
                        }
                        else if(IS_ANDROID){                    
                             document.write("<script language='javascript' src='file:///android_asset/www/Dashboard/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='file:///android_asset/www/Dashboard/highcharts.js?v=5.4.0.0' type='text/javascript'></script>");                             
                        }
                        else{                    
                             document.write("<script language='javascript' src='/Scripts/JQuery/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='/Files/AccountDashboardFiles/highcharts.js?v=5.4.0.0' type='text/javascript'></script>");                             
                        }                                
                       
                ]]>
          </xsl:comment>
        </script>
        
        <!--Css Tags-->
        <style>
          body{ font-size: 100%; font-size: 16px; font-size: 1em; color:#555555;height:100%; overflow: hidden;}
          .hidden{display:none;}
          .unitsrevenusCharts {height:83%;margin-left:5.2083%;width: 88.842%; font-size:0.75em;}
          #AccountId{width:15.6%; margin-left:6.2083%; font-size:0.75em;}
          .fl{float: left}
          .container{width: 96%;}
          .mainTitle{text-align:center;}
          .total{text-align:left; color:#4E81D4; font-size:1.5em;height:10%; font-weight:bold;margin-left:5.2083%;}
        </style>        
      </head>      
      <body>                       
        <script language="javascript" type="text/javascript">          
          <xsl:comment>
            <![CDATA[            
                $(document).ready(function () {
                
                  $("#AccountId").change(function () { 
                      Charts.LoadSelectedAccountNumber($('#AccountId :selected').val());    
                  })                                  
                  $("#AccountId").change();                  
                });  
                
                 var Charts = {

                          buildUnitsChart: function (X_Array, Y_Array, ChartTitle) {        
                              var options = {
                                  chart: {
                                      renderTo: 'brammer',
                                      zoomType: 'xy',
                                      margin: [40, 10, 80, 45] // top , right , bottom , left
                                  },
                                  credits: {
                                      enabled: false
                                  },
                                  title: {
                                      style: {
                                          color: '#555555'
                                      },
                                      text: ChartTitle
                                  },
                                  xAxis: [{
                                      categories: X_Array,
                                      labels: {
                                          formatter: function () {
                                              return '<p style="width:50px;" title="' + this.value + '">' + Charts.SubstringText(this.value, 0, 12) + '</p>';
                                          },
                                          rotation: -40,
                                          align: 'right'
                                      }
                                  }],
                                  yAxis: [{ // Primary yAxis
                                      min: 0,
                                      title: '',
                                      endOnTick: true
                                  }],
                                  tooltip: {
                                      formatter: function () {
                                          return '' + this.x + ': ' + this.series.name + ' ' + ': ' + Highcharts.numberFormat(this.y, 0);
                                      }
                                  },
                                  legend: {
                                      enabled: false
                                  },
                                  series: []
                              }
                              options.series = new Array();
                              if (X_Array.length > 0) {
                                  options.series[0] = new Object();
                                  options.series[0].data = Y_Array;
                                  options.series[0].type = 'column';
                                  options.series[0].color = '#3385E9';

                              }
                              unitsChart = new Highcharts.Chart(options);
                          },                               
                          
                          SubstringText: function (value, startIndex, length) {
                              return ((value.length > length + startIndex) ? value.substring(startIndex, length) + "..." : value);
                          },
                          
                          LoadSelectedAccountNumber: function(NumberID){     
                              $("#brammer").empty();    
                              var dataX, dataY, totalSalesBrammer;
                              var X_axis_brammer = [];
                              var Y_axis_brammer = [];                                                                                                        
                              var ChartTitleBrammer = $("#DBXml div#" + NumberID).attr("name")
                              
                              
                              $("#DBXml").find("div[id^='" + NumberID + "']").find('span').each(function(index) {
                                  if($(this).attr("name").toLowerCase() == "text"){                                  
                                    dataX = $(this).text();
                                    X_axis_brammer.push(dataX); 
                                  }
                                  else if($(this).attr("name").toLowerCase() == "value"){                                  
                                    dataY = $(this).text() == '' ? 0 : $(this).text();
                                    Y_axis_brammer.push(parseInt(dataY));                                                            
                                  }
                                  else if($(this).attr("name").toLowerCase() == "totalsalestext"){                                  
                                    totalSalesBrammer = $(this).text() + " : ";                                    
                                  }
                                  else if($(this).attr("name").toLowerCase() == "totalsalesvalue"){                                  
                                    totalSalesBrammer += $(this).text();                                  
                                  }
                              });                                                                                                                                                                                                 

                              Charts.buildUnitsChart(X_axis_brammer, Y_axis_brammer, ChartTitleBrammer);                                                    
                              $("#brammer").append("<div class='total'>" + totalSalesBrammer + "</div>");                          
                          
                           }
                     }
                ]]>
          </xsl:comment>
        </script>

        <div class="container">
               <div>             
                <select id="AccountId" class="fl">
                    <xsl:for-each select="//AccountNumbersBrammer/AccountNumber">
                      <option>                    
                        <xsl:attribute name="value">                      
                          <xsl:value-of select="translate(@ID, ' ','')" />
                        </xsl:attribute>
                        <xsl:value-of select="@ID" />
                      </option>
                    </xsl:for-each>
                </select>                          
              </div>

              <div id="DBXml" class="hidden">
                <xsl:for-each select="//Sales/AccountNumbersBrammer/AccountNumber">
                      <xsl:call-template name="BuildDBXML">
                        <xsl:with-param name="AccountNumberOriginalID" select="@ID"/>
                        <xsl:with-param name="AccountNumberID" select="translate(@ID, ' ','')"/>
                        <xsl:with-param name="AccountNumberName" select="ChartName"/>
                        <xsl:with-param name="AccountTotalSales" select="TotalSales/Field/FieldName"/>
                        <xsl:with-param name="AccountTotalValue" select="TotalSales/Field/FieldValue"/>
                      </xsl:call-template>
                </xsl:for-each>
              </div>
          
              <div id="brammer" class="unitsrevenusCharts fl">           
              </div>         
        </div>                                 
      </body>
    </html>    
  </xsl:template>  
  
  <xsl:template name="BuildDBXML">    
    <xsl:param name="AccountNumberOriginalID"/>
    <xsl:param name="AccountNumberID"/>
    <xsl:param name="AccountNumberName"/>
    <xsl:param name="AccountTotalSales"/>
    <xsl:param name="AccountTotalValue"/>
    <div>
      <xsl:attribute name='ID'>
        <xsl:value-of select='$AccountNumberID' />
      </xsl:attribute>    
      <xsl:attribute name='name'>
        <xsl:value-of select='$AccountNumberName' />
      </xsl:attribute>
      <xsl:for-each select="//Sales/AccountNumbersBrammer/AccountNumber[@ID=$AccountNumberOriginalID]/SalesByFields/Field">
        <div>
          <span name="text"><xsl:value-of select="FieldName" /></span>
          <span name="value"><xsl:value-of select="FieldValue" /></span>          
        </div>        
      </xsl:for-each>
      <div>
        <span name="totalSalesText"><xsl:value-of select="$AccountTotalSales" /></span>
        <span name="totalSalesValue"><xsl:value-of select="$AccountTotalValue" /></span>
      </div>
    </div>
  </xsl:template>
  
</xsl:stylesheet>