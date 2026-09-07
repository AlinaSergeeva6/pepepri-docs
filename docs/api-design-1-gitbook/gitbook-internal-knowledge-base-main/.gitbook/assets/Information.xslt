<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:my="my:my">
  <xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title></title>

        <!--Script Tags-->
        <script>
          <xsl:comment>
            <![CDATA[
                    var IS_IPAD = navigator.userAgent.match(/iPad/i) != null;
                    var IS_IPHONE = (navigator.userAgent.match(/iPhone/i) != null) || (navigator.userAgent.match(/iPod/i) != null);
					var	IS_ANDROID = navigator.userAgent.toLowerCase().indexOf("android") > -1;
                        if(IS_IPAD || IS_IPHONE){                    
                             document.write("<script language='javascript' src='./Scripts/JQuery/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");                             
                             document.write("<script language='javascript' src='./Files/AccountDashboardFiles/AccountDashboard.js?v=5.4.0.0' type='text/javascript'></script>");
                        }
                        else if(IS_ANDROID){                    
                             document.write("<script language='javascript' src='file:///android_asset/www/Dashboard/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");                             
                             document.write("<script language='javascript' src='file:///android_asset/www/Dashboard/AccountDashboard.js?v=5.4.0.0' type='text/javascript'></script>");
                        }
                        else{                    
                             document.write("<script language='javascript' src='/Scripts/JQuery/jquery-1.7.1.min.js?v=5.4.0.0' type='text/javascript'></script>");
                             document.write("<script language='javascript' src='/Files/AccountDashboardFiles/AccountDashboard.js?v=5.4.0.0' type='text/javascript'></script>");
                        }                
                ]]>
          </xsl:comment>
        </script>

        <!--Css Tags-->
        <style>
          body{ font-size: 100%; font-size: 16px; font-size: 1em; color:#555555; height:100%; overflow: hidden;}
          .fl{float: left}
          .mainBody{text-align:center;font-size: 1em;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;}		  
          .header{ background-color:#E1E1E1; text-align:center; font-size:0.75em;}
          .container{-moz-border-radius:5px; /* Firefox */-webkit-border-radius:5px; /* Safari and chrome */border-radius:5px; /* CSS3 */width: 32.10526%;height: 3.5em;border:1px solid #E1E1E1;}
          .marginTop{ margin-top: 1.05263%;}
          .marginLeft{margin-left: 0.7263%; }
          .wrapper{width: 98%;}
          .rating {unicode-bidi: bidi-override; direction: rtl; text-align: center;}
          .ratingGold { content: "°5"; color: gold;   }		  		  
		  .wordWrap{overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;text-align:center;font-size: 1em;max-height: 2.5em;}		  						
		  
        </style>
      </head>
      <body>
        <div class="wrapper">
          <xsl:for-each select="//GeneralInformation/Field">
            <div class="container marginTop marginLeft fl">
              <div class="header">
                <xsl:value-of select="FieldName" />
              </div>
              <div class="mainBody">
                <xsl:choose>
                  <xsl:when test="@type = 'stars' and ./FieldValue &lt; '6'">
                    <xsl:call-template name="loop">
                      <xsl:with-param name="i" select="number(1)"/>
                      <xsl:with-param name="max">
                        <xsl:value-of select="./FieldValue"/>
                      </xsl:with-param>
                      <xsl:with-param name="class" select="'ratingGold'"/>
                    </xsl:call-template>
                    <xsl:call-template name="loop">
                      <xsl:with-param name="i" select="./FieldValue"/>
                      <xsl:with-param name="max">
                        <xsl:value-of select="number(4)"/>
                      </xsl:with-param>
                      <xsl:with-param name="class" select="'rating'"/>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <!--xsl:value-of select="FieldValue" /-->	
					<xsl:call-template name="loopRegularField">					
					  <xsl:with-param name="fieldValue">
                        <xsl:value-of select="FieldValue"/>
                      </xsl:with-param>
                      <xsl:with-param name="class" select="'wordWrap'"/>										
					</xsl:call-template>
                  </xsl:otherwise>
                </xsl:choose>
              </div>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>


  <xsl:template name="loop">
    <xsl:param name="i"/>
    <xsl:param name="max"/>
    <xsl:param name="class"/>
    <xsl:if test="$i &lt;= $max">
      <span>
        <xsl:attribute name="class">
          <xsl:value-of select="$class"/>
        </xsl:attribute>
        ★
      </span>     
      <xsl:call-template name="loop">
        <xsl:with-param name="i" select="$i + 1"/>
        <xsl:with-param name="max" select="$max"/>
        <xsl:with-param name="class" select="$class"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  
  <xsl:template name="loopRegularField">
    <xsl:param name="fieldValue"/>    
    <xsl:param name="class"/>   
        <xsl:attribute name="class">
          <xsl:value-of select="$class"/>
        </xsl:attribute>	    
		<xsl:value-of select="$fieldValue"/>      		
  </xsl:template>
  
</xsl:stylesheet>