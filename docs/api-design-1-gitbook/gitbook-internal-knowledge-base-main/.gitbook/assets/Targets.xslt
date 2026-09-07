<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
  <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="/">    
    <html>
      <head>
        <title>Dashboard</title>
        
        <!--Script Tags-->
        <!--<script language='javascript' src='jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>
        <script language='javascript' src='highcharts.js?v=5.4.0.0' type='text/javascript'></script> -->
        
        <script type="text/javascript">
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
        <style type="text/css">
          body{ font-size: 100%; font-size: 16px; font-size: 1em; color:#555555;height:100%; overflow: hidden;}
		  svg{position:static}
          .hidden{display:none;}
          .unitsrevenusCharts {height:83%;margin-left:5.2083%;width: 88.842%; font-size:0.75em;}
          #AccountId{width:15.6%; margin-left:6.2083%; font-size:0.75em;}
          .fl{float: left}
          .container{width: 96%;}
          .mainTitle{text-align:center;}
          .total{text-align:left; color:#4E81D4; font-size:1.5em;height:10%; font-weight:bold;margin-left:5.2083%;position:relative;top:-60px}
        </style>        
      </head>      
      <body style="overflow:auto">                       
        <script type="text/javascript">  
		<xsl:comment>
            <![CDATA[ 
 
                $(document).ready(function () {
                
                  $("#AccountId").change(function () { 
                      Charts.LoadSelectedAccountNumber($('#AccountId :selected').val().replace(/ /g,''));    
                  })                                  
                  $("#AccountId").change();  
                  
                });  
                
                 var Charts = {

                          buildUnitsChart: function (X_Array, Y1_Array, Y2_Array, ChartTitle) {        
                              var options = {
                                  chart: {
                                      renderTo: 'brammer',
                                      zoomType: 'xy',
                                      margin: [40, 10, 120, 45], // top , right , bottom , left
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
                                              return this.value;
                                              //return '<p style="width:50px;" title="' + this.value + '">' + Charts.SubstringText(this.value, 0, 12) + '</p>';
                                          },
                                          //rotation: -90,
                                          align: 'center'
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
                                      enabled: true,
                                      layout: 'vertical',
                                      align: 'right',
                                      y:0,
                                      //x:-50,
                                  },
                                  series: []
                              }
                              options.series = new Array();
                              if (X_Array.length > 0) {
                                  options.series[0] = new Object();
                                  options.series[0].data = Y1_Array.data;
                                  options.series[0].type = 'column';
                                  options.series[0].color = '#3385E9';
                                  options.series[0].name = Y1_Array.name;

                                  options.series[1] = new Object();
                                  options.series[1].data = Y2_Array.data;
                                  options.series[1].type = 'column';
                                  options.series[1].color = '#FDAC37';
                                  options.series[1].name = Y2_Array.name;
                                  
                                  data1 = Y1_Array.data;
                                  data2 = Y2_Array.data;
                                  
                                  $(Y2_Array.data).each(function (index, item){
                                    var itemObj = {y: item}
                                    if (item > data1[index])
                                      itemObj.color = '#22B14C';
                                    else
                                      itemObj.color = '#ED1C24';
                                    
                                    data2[index] = itemObj;
                                  });
                              }
                              unitsChart = new Highcharts.Chart(options);
                              var svg = $('#brammer').find('svg');
                              var rects = svg[0].getElementsByTagName('rect');
                              for (ii=0; !(ii >= rects.length); ii++){
                                if (rects[ii].getAttribute('fill').toUpperCase() == '#FDAC37'){
                                  rects[ii].setAttribute('fill', '#22B14C');
                                  rects[ii].setAttribute('stroke', '#ED1C24');
                                  rects[ii].setAttribute('stroke-width', '4');
                                  break;
                                }
                              }
                              
                              //$('.highcharts-legend-item', svg).eq(1).find('rect').attr({'stroke-width': '4', 'stroke': '#ED1C24'});
                          },                               
                          
                          SubstringText: function (value, startIndex, length) {
                              return ((value.length > length + startIndex) ? value.substring(startIndex, length) + "..." : value);
                          },
                          
                          LoadSelectedAccountNumber: function(NumberID){     
                              $("#brammer").empty();    
                              var dataX, dataY, totalSalesBrammer1, totalSalesBrammer2, total1, total2;
                              var X_axis = [];
                              var Y1_axis = {data:[]};                                                                                                        
                              var Y2_axis = {data:[]};                                                                                                        
                              debugger;
                              var ChartTitleBrammer = $("#DBXml div#" + NumberID).attr("name")
                              
                              
                              $("#DBXml").find("div[id^='" + NumberID + "']").find('span').each(function(index) {
                                  if($(this).attr("name").toLowerCase() == "text"){                                  
                                    dataX = $(this).text();
                                    X_axis.push(dataX); 
                                  }
                                  else if($(this).attr("name").toLowerCase() == "value1"){                                  
                                    dataY = $(this).text() == '' ? 0 : $(this).text();
                                    Y1_axis.data.push(parseInt(dataY));                                                            
                                  }
                                  else if($(this).attr("name").toLowerCase() == "value2"){                                  
                                    dataY = $(this).text() == '' ? 0 : $(this).text();
                                    Y2_axis.data.push(parseInt(dataY));                                                            
                                  }
                                  else if($(this).attr("name") == "ValuesDescription1"){                                  
                                    dataY = $(this).text() == '' ? 0 : $(this).text();
                                    Y1_axis.name = dataY;
                                  }
                                  else if($(this).attr("name") == "ValuesDescription2"){                                  
                                    dataY = $(this).text() == '' ? 0 : $(this).text();
                                    Y2_axis.name = dataY;
                                  }
                                  else if($(this).attr("name").toLowerCase() == "totalsalestext1"){                                  
                                    totalSalesBrammer1 = $(this).text() + " : ";                                    
                                  }
                                  else if($(this).attr("name").toLowerCase() == "totalsalesvalue1"){                                  
                                    total1 = $(this).text().substr(1).replace(/,/g, '');
                                    totalSalesBrammer1 += $(this).text();                                  
                                  }
                                  else if($(this).attr("name").toLowerCase() == "totalsalestext2"){
                                    totalSalesBrammer2 = $(this).text() + " : ";                                    
                                  }
                                  else if($(this).attr("name").toLowerCase() == "totalsalesvalue2"){ 
                                    total2 = $(this).text().substr(1).replace(/,/g, '');
                                    totalSalesBrammer2 += $(this).text();                                  
                                  }
                              });                                                                                                                                                                                                 

                              Charts.buildUnitsChart(X_axis, Y1_axis, Y2_axis, ChartTitleBrammer);                                                    
                              $("#brammer").append($('#total1').clone().text(totalSalesBrammer1));
                              $("#brammer").append($('#total2').clone().text(totalSalesBrammer2).css('color', total2 > total1 ? '#22B14C' : '#ED1C24'));
                          
                           }
                     }
				]]>
          </xsl:comment>
        </script>

        <div class="container">
               <div>
                 <xsl:if test="not(count(//TwoColumnsChart/CategoryName) > 1)">
                   <xsl:attribute name="class">hidden</xsl:attribute>
                 </xsl:if>
                 <select id="AccountId" class="fl">
                    <xsl:for-each select="//TwoColumnsChart/CategoryName">
                      <option>                    
                        <xsl:attribute name="value">                      
                          <xsl:value-of select="@ID" />
                        </xsl:attribute>
                        <!--<xsl:value-of select="ChartName" />-->
                        <xsl:value-of select="@ID" />
                      </option>
                    </xsl:for-each>
                </select>
              </div>

              <div id="DBXml" class="hidden">
                <xsl:for-each select="//TwoColumnsChart/CategoryName">
                      <xsl:call-template name="BuildDBXML">
                        <xsl:with-param name="AccountNumberOriginalID" select="@ID"/>
                        <xsl:with-param name="AccountNumberID" select="translate(@ID, ' ','')"/>
                        <xsl:with-param name="AccountNumberName" select="ChartName"/>
                        <xsl:with-param name="AccountTotalSales" select="TotalSales/Field/FieldName"/>
                        <xsl:with-param name="AccountTotalValue" select="TotalSales/Field/FieldValue"/>
                      </xsl:call-template>
                </xsl:for-each>
                <div id="total1" class='total'></div>
                <div id="total2" class='total'></div>
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
      <xsl:attribute name='id'>
        <xsl:value-of select='$AccountNumberID' />
      </xsl:attribute>    
      <xsl:attribute name='name'>
        <xsl:value-of select='$AccountNumberName' />
      </xsl:attribute>
      <span name ='ValuesDescription1'><xsl:value-of select="./ValuesDescriptions/Value1" /></span>
      <span name ='ValuesDescription2'><xsl:value-of select="./ValuesDescriptions/Value2" /></span>
      <xsl:for-each select="//TwoColumnsChart/CategoryName[@ID=$AccountNumberOriginalID]/SalesByFields/Field">
        <div>
          <span name="text"><xsl:value-of select="FieldName" /></span>
          <span name="value1"><xsl:value-of select="FieldValue1" /></span>          
          <span name="value2"><xsl:value-of select="FieldValue2" /></span>          
        </div>        
      </xsl:for-each>
      <div>
        <span name="totalSalesText1"><xsl:value-of select="$AccountTotalSales" /></span>
        <span name="totalSalesValue1"><xsl:value-of select="$AccountTotalValue" /></span>
        <span name="totalSalesText2"><xsl:value-of select="./TotalSales/Field[2]/FieldName" /></span>
        <span name="totalSalesValue2"><xsl:value-of select="./TotalSales/Field[2]/FieldValue" /></span>
      </div>
    </div>
  </xsl:template>
  
</xsl:stylesheet>