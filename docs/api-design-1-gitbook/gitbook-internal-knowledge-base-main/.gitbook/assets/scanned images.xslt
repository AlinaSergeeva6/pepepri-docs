<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
    <!-- PDF4d-3d16.xsl 24Sep2015 (PDF4d-3d15.xsl Does not Exist)-->
    <xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no" />
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
    <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />  
    <xsl:variable name="imgURL" select="//Header/Column[@Type='20']/Value" />
    <xsl:template match="/">
        <html>
        <head>
            <style type="text/css">
             * {
                margin: 5px;
                padding: 5px;
                box-sizing: border-box;
                }

             img {
                max-width: 1340px;
                max-height:1340px;
                margin:0;
           
            }
            
            .imgBlock {
                <!-- border: 1px solid black; -->
                height: 1340px;
                display: flex;
                align-items: center; 
                justify-content: center; 
            }

            .imgBlock:last-child {
                page-break-after: avoid!important;
            }
            </style>
        </head>

        <body>
        <div class="main-content">
            <xsl:for-each select="//Header/Column[@Type='20']">
            <xsl:variable name="idName" select="@ApiName" />
            <xsl:if test="Value != ''">
            <xsl:if test="not(contains(Value, 'defaultItem.jpg'))">
            <div class="imgBlock" style="page-break-after: always;">     
            <img id="{$idName}">
                <xsl:attribute name="src">
                <xsl:variable name="imgURL"  select="substring-before(Value,'&amp;')"/>
                <xsl:value-of select="$imgURL"/>
                <!-- <xsl:value-of select="Value"/> -->
                </xsl:attribute>
            </img>
        
            </div>
             </xsl:if>
            </xsl:if>
            </xsl:for-each>
        </div>
        <script type="text/javascript">

            function setVendor(element, property, value) {
            element.style["webkit" + property] = value;
            element.style["moz" + property] = value;
            element.style["ms" + property] = value;
            element.style["o" + property] = value;
            }
          

            function getImgSize(imgSrc, imgId) {
            var newImg = new Image();
            newImg.onload = function() {
            var height = newImg.height;
            var width = newImg.width;
            var a = this.width;
            var b = this.height;
            var res = (b - a)/Math.abs(b - a);
             var oElement = document.getElementById(imgId);
            if (res == -1) {
            oElement.style.minWidth = '1340px';    
            oElement.style.webkitTransform = 'rotate(90deg)';
            oElement.style.MozTransform = 'rotate(90deg)';
            oElement.style.OTransform = 'rotate(90deg)';
            oElement.style.transform = 'rotate(90deg)';
                   
            } else if (res !== -1) {
                oElement.style.minHeight = '1340px';
                }         
            }

            newImg.src = imgSrc;
        }


        <xsl:variable name="img1" select="//Header/Column[@ApiName='TSAUploadSupportingImages1']/Value" />
        <xsl:if test="not(contains($img1, 'defaultItem.jpg'))">
        <xsl:if test="//Header/Column[@ApiName='TSAUploadSupportingImages1']/Value != ''">
        var img1 = document.getElementById("TSAUploadSupportingImages1").src;
        getImgSize(img1,"TSAUploadSupportingImages1");
        </xsl:if>
         </xsl:if>

        <xsl:variable name="img2" select="//Header/Column[@ApiName='TSAUploadSupportingImages2']/Value" />
        <xsl:if test="not(contains($img2, 'defaultItem.jpg'))">
        <xsl:if test="//Header/Column[@ApiName='TSAUploadSupportingImages2']/Value != ''">
        var img2 = document.getElementById("TSAUploadSupportingImages2").src;
        getImgSize(img2,"TSAUploadSupportingImages2");
        </xsl:if>
        </xsl:if>

        <xsl:variable name="img3" select="//Header/Column[@ApiName='TSAUploadSupportingImages3']/Value" />
        <xsl:if test="not(contains($img3, 'defaultItem.jpg'))">
        <xsl:if test="//Header/Column[@ApiName='TSAUploadSupportingImages3']/Value != ''">
        var img3 = document.getElementById("TSAUploadSupportingImages3").src;
        getImgSize(img3,"TSAUploadSupportingImages3");
        </xsl:if>
         </xsl:if>

        <xsl:variable name="img4" select="//Header/Column[@ApiName='TSAUploadSupportingImages4']/Value" />
        <xsl:if test="not(contains($img4, 'defaultItem.jpg'))">
        <xsl:if test="//Header/Column[@ApiName='TSAUploadSupportingImages4']/Value != ''">
        var img4 = document.getElementById("TSAUploadSupportingImages4").src;
        getImgSize(img4,"TSAUploadSupportingImages4");
        </xsl:if>
         </xsl:if>


        <xsl:variable name="img5" select="//Header/Column[@ApiName='TSAUploadSupportingImages5']/Value" />
        <xsl:if test="not(contains($img5, 'defaultItem.jpg'))">
        <xsl:if test="//Header/Column[@ApiName='TSAUploadSupportingImages5']/Value != ''">
        var img5 = document.getElementById("TSAUploadSupportingImages5").src;
        getImgSize(img5,"TSAUploadSupportingImages5");
        </xsl:if>
         </xsl:if>

        <xsl:variable name="img6" select="//Header/Column[@ApiName='TSAUploadSupportingImages6']/Value" />
        <xsl:if test="not(contains($img6, 'defaultItem.jpg'))">
        <xsl:if test="//Header/Column[@ApiName='TSAUploadSupportingImages6']/Value != ''">
        var img6 = document.getElementById("TSAUploadSupportingImages6").src;
        getImgSize(img6,"TSAUploadSupportingImages6"); 
        </xsl:if> 
         </xsl:if>
        </script>       
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
