<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
<!-- PDF4d-3d16.xsl 24Sep2015 (PDF4d-3d15.xsl Does not Exist)-->
<xsl:output encoding="UTF-8" indent="yes" method="xml" standalone="no" omit-xml-declaration="no"/>

<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
  
<xsl:variable name="decimal-separator" select="//Config/Key[@*[translate(name(.), $uppercase, $smallcase)='name' and .='DecimalSeparator']]"/>
<xsl:variable name="grouping-separator" select="//Config/Key[@*[translate(name(.), $uppercase, $smallcase)='name' and .='GroupingSeparator']]"/>

<xsl:variable name="separators" select="concat($decimal-separator, $grouping-separator)"/>
 
<xsl:variable name="heightPixelsPerUnit" select="30"/> <!--44.62-->
<xsl:variable name="heightMarginPerUnit" select="20"/> <!--10-->

<xsl:variable name="maxImgDimensions" select="500"/>

  <xsl:template name="precedingSibling">
    <xsl:param name="nodeSet"/>
    <xsl:for-each select="$nodeSet">
      <xsl:value-of select="count(preceding-sibling::*)"/>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="addTdsThs">
    <xsl:param name="numToAdd"/>
    <xsl:param name="isTd"/>
    <xsl:choose>
      <xsl:when test="$numToAdd &lt;= 0"></xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$isTd"><td>&#160;</td></xsl:when>
          <xsl:otherwise><th>&#160;</th></xsl:otherwise>
        </xsl:choose>
        <xsl:call-template name="addTdsThs">
          <xsl:with-param name="numToAdd" select="-1 + $numToAdd"/>
          <xsl:with-param name="isTd" select="$isTd"/>
        </xsl:call-template>      
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
    
  <xsl:template name="max">
    <xsl:param name="seq"/>
    <xsl:param name="maxSoFar"/>
    <xsl:variable name="curr" select="substring-before($seq, ' ')"/>
    <xsl:variable name="numToChk">
      <xsl:choose>
        <xsl:when test="$curr=''"><xsl:value-of select="$seq"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="$curr"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$seq=''"><xsl:value-of select="$maxSoFar"/></xsl:when>
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="$numToChk > $maxSoFar">
            <xsl:call-template name="max">
              <xsl:with-param name="seq" select="substring-after($seq, ' ')"/>
              <xsl:with-param name="maxSoFar" select="$numToChk"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="max">
              <xsl:with-param name="seq" select="substring-after($seq, ' ')"/>
              <xsl:with-param name="maxSoFar" select="$maxSoFar"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
    
  <xsl:template name="addValue">
    <xsl:param name="value"/>
    <xsl:param name="canChgClass"/>
    <xsl:param name="isNumber"/>
     <xsl:choose>
      <xsl:when test="$value != ''">
        <xsl:choose>
          <xsl:when test="$value/@disable-output-escaping = 'yes'">
            <xsl:value-of select="$value" disable-output-escaping="yes"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$isNumber">
                <!--<xsl:value-of select="translate($value,'.,', $separators)"/>-->
                <xsl:value-of select="$value"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="$value" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:if test="$canChgClass">
          <xsl:attribute name="class">
            <xsl:if test=".=''">hidden</xsl:if>
          </xsl:attribute>
        </xsl:if>
        <!--<xsl:value-of select="name(..)"/>&#160;<xsl:value-of select="name()"/>-->
        <xsl:choose>
          <xsl:when test="@Type = '10'">False</xsl:when>
          <xsl:otherwise>&#160;</xsl:otherwise>
        </xsl:choose>
        <!-- &#160; -->
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="calcFieldHeight">
    <xsl:param name="heightUnits"/>
    <xsl:variable name="heightUnitsNum" select="number($heightUnits)"/>
    <xsl:choose>
      <xsl:when test="heightUnitsNum &lt;= 1">
        <xsl:value-of select="$heightPixelsPerUnit"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="ceiling($heightPixelsPerUnit * $heightUnitsNum + (-1 + $heightUnitsNum) * $heightMarginPerUnit)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="addField">
    <xsl:param name="elementNode"/>
    <xsl:for-each select="$elementNode">
      <xsl:variable name="Type" select="@Type"/>
      <xsl:variable name="X" select="@X"/>
      <!--<xsl:variable name="ApiName" select="@ApiName"/>-->
      <xsl:variable name="clear">
        <xsl:choose>
          <xsl:when test="$X='0'"><xsl:text>left</xsl:text></xsl:when>
          <xsl:when test="$X='1'"><xsl:text>right</xsl:text></xsl:when>
          <xsl:otherwise>left</xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      
      <xsl:if test="$Type='13'">
        <div class="seperator break-word" style="clear:{$clear};">
          <!--<xsl:value-of select="Name"/>-->
          <xsl:call-template name="addValue">
            <xsl:with-param name="value" select="Name"/>
          </xsl:call-template>
        </div>
      </xsl:if>
      <xsl:if test="$Type!='13'">
        <div style="clear:{$clear}; min-height:12px; width:100%; display:inline-block;">
          <xsl:variable name="width">
            <xsl:if test="Value != '' or $Type='10'">width50</xsl:if> <!-- Type=10: Boolean-->
            <xsl:if test="Value = '' and $Type!='10'">width100</xsl:if>
          </xsl:variable>
          <xsl:if test="Value = '' and $Type!='10'"> <!-- Type=10: Boolean-->
            <div class="{$width} break-word no-justify">
              <!--<xsl:value-of select="Name" disable-output-escaping="yes"/>-->
              <xsl:call-template name="addValue">
                <xsl:with-param name="value" select="Name"/>
              </xsl:call-template>
            </div>
          </xsl:if>
          <xsl:if test="Value != '' or $Type='10'">
            <xsl:choose>
              <xsl:when test="$Type = '20' or $Type = '25'"> <!--Img or Signature-->
                <div class="width100 break-word no-justify">
                  <div>
                    <xsl:call-template name="addValue">
                      <xsl:with-param name="value" select="Name"/>
                    </xsl:call-template>
                  </div>
                  <div style="text-align:center">
                    <xsl:variable name="fieldHeight">
                      <xsl:call-template name="calcFieldHeight">
                        <xsl:with-param name="heightUnits" select="@Field_Height"/>
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="isMissingImg">
                      <xsl:call-template name="isMissingImage">
                        <xsl:with-param name="imgUrl" select="Value"/>
                      </xsl:call-template>
                    </xsl:variable>
                    <xsl:choose>
                      <xsl:when test="$isMissingImg != 'true'">
                        <img src="{Value}" style="max-width:50%; height:{$fieldHeight}px;"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <div  style="height:{$fieldHeight}px;">&#160;</div>
                      </xsl:otherwise>
                    </xsl:choose>
                  </div>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <div class="{$width} floatLeft break-word no-justify">
                  <!--<xsl:value-of select="Name" disable-output-escaping="yes"/>-->
                  <xsl:call-template name="addValue">
                    <xsl:with-param name="value" select="Name"/>
                  </xsl:call-template>
                </div>
                <xsl:choose>
                  <xsl:when test="$Type = '14'"> <!-- Address-->
                    <xsl:variable name="fieldHeight">
                      <xsl:call-template name="calcFieldHeight">
                        <xsl:with-param name="heightUnits" select="@Field_Height"/>
                      </xsl:call-template>
                    </xsl:variable>
                    <!--<div class="width50 floatRight adjustLeft break-word no-justify" style="height:{$fieldHeight}px;"> 16Feb15 -->
                    <div class="width50 floatRight adjustLeft break-word no-justify">
                      <xsl:for-each select="Value/*">
                        <div>
                          <!--<xsl:value-of select="."/>-->
                          <xsl:call-template name="addValue">
                            <xsl:with-param name="value" select="."/>
                            <xsl:with-param name="canChgClass" select="true()"/>
                          </xsl:call-template>
                        </div>
                      </xsl:for-each>
                    </div>
                  </xsl:when>
                  <xsl:otherwise>
                    <div class="width50 floatRight adjustLeft break-word no-justify formatNumber" data="type={$Type}">
                      <xsl:call-template name="addValue">
                        <xsl:with-param name="value" select="Value"/>
                        <xsl:with-param name="isNumber" select="$Type = '7' or $Type = '8' or $Type = '9' or $Type = '15'"/>
                      </xsl:call-template>
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
            <div style="height:0;clear:both;display:none">&#160;</div>
          </xsl:if>
        </div>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="chkFollowingSiblingIfSameFloat">
    <xsl:param name="pp"/>
    <xsl:param name="sideLeftOrRight"/>
    <xsl:param name="isPosChk"/>
    <xsl:for-each select="$pp">
      <xsl:variable name="pos" select="position()"/>
      <xsl:variable name="X" select="@X"/>
      <xsl:variable name="Y" select="@Y"/>
      <xsl:variable name="Type" select="@Type"/>
      <xsl:variable name="Size" select="@Size"/>
      <xsl:variable name="nextY" select="following-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prevY" select="preceding-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prev2Y" select="preceding-sibling::*[@Type!='23'][2]/@Y"/>
      <xsl:variable name="prev3Y" select="preceding-sibling::*[@Type!='23'][3]/@Y"/>

      <xsl:choose>
        <xsl:when test="$X=$sideLeftOrRight and $Type!='23'">
          <xsl:choose>
            <xsl:when test="$X='0'">
              <xsl:choose>
                <xsl:when test="$pos=last() and $prev2Y=$prevY">
                  <xsl:choose>
                    <xsl:when test="$Size='2'">
                      <xsl:if test="$isPosChk &lt; 0">010</xsl:if>
                      <!--do not add size=2 here - it will be added in normal flow -->
                    </xsl:when>
                    <xsl:otherwise> <!-- $Size!='2'-->
                      <xsl:choose>
                        <xsl:when test="$isPosChk &lt; 0">10</xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="$pos &lt; $isPosChk">
                            <xsl:call-template name="addField">
                              <xsl:with-param name="elementNode" select="."></xsl:with-param>
                            </xsl:call-template>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:when>
                <xsl:otherwise>

                  <xsl:choose>
                    <xsl:when test="$nextY=$Y">
                      <xsl:choose>
                        <xsl:when test="$isPosChk &lt; 0">1</xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="$pos &lt; $isPosChk">
                            <xsl:call-template name="addField">
                              <xsl:with-param name="elementNode" select="."></xsl:with-param>
                            </xsl:call-template>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:if test="$isPosChk &lt; 0">0</xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>

                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$X='1'">
              <xsl:choose>
                <xsl:when test="$pos>1">

                  <xsl:choose>
                    <xsl:when test="$prevY=$Y">
                      <xsl:choose>
                        <xsl:when test="$isPosChk &lt; 0">1</xsl:when>
                        <xsl:otherwise>
                          <xsl:if test="$pos &lt; $isPosChk">
                            <xsl:call-template name="addField">
                              <xsl:with-param name="elementNode" select="."></xsl:with-param>
                            </xsl:call-template>
                          </xsl:if>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:if test="$isPosChk &lt; 0">0</xsl:if>
                    </xsl:otherwise>

                  </xsl:choose>

                </xsl:when>
                <xsl:otherwise>
                  <!-- $pos=1-->
                  <xsl:choose>
                    <xsl:when test="$isPosChk &lt; 0">1</xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="addField">
                        <xsl:with-param name="elementNode" select="."></xsl:with-param>
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:when>
          </xsl:choose>

        </xsl:when>

        <xsl:otherwise>
          <xsl:if test="$isPosChk &lt; 0">
            <xsl:choose>
              <xsl:when test="$Size='2'">0</xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when test="$X = '1' and ($prevY!=$Y or $pos=1) or 
                                  $X = '0' and ($nextY!=$Y or $pos = last())">0</xsl:when>
                  <xsl:otherwise>1</xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
        </xsl:otherwise>
        
      </xsl:choose>
    </xsl:for-each>
    <xsl:if test="$isPosChk &lt; 0">10</xsl:if>
  </xsl:template>

  <xsl:template name="addLineBreak">
    <div class="lineBreak width100">##Sep##</div>
  </xsl:template>
  
  <xsl:template name="addEmptyCells">
    <xsl:param name="currRow"/>
    <xsl:param name="targetRow"/>
    <xsl:if test="$currRow &lt; $targetRow">
      <div class="emptyCell width50" style="height:{$heightPixelsPerUnit}px;">##empty##</div>
      <xsl:call-template name="addEmptyCells">
        <xsl:with-param name="currRow" select="$currRow+1"/>
        <xsl:with-param name="targetRow" select="$targetRow"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name ="applyFields">
    <xsl:param name="fieldsSet"/>
    <xsl:variable name="divOpen" select="concat('&lt;','div')" />
    <xsl:variable name="divClose" select="'&gt;'"/>
    <xsl:variable name="divEnd" select="concat('&lt;','/div','&gt;')" />

    <!--<xsl:for-each select="$fieldsSet[@ApiName!='TotalsBox' and @ApiName!='Signature']">-->
    <!--<xsl:for-each select="$fieldsSet[@Type!='23' and (@ApiName!='Signature' or count(@ApiName)=0)]">-->
    <xsl:for-each select="$fieldsSet[@Type!='23']">

      <xsl:variable name="pos" select="position()"/>
      <xsl:variable name="Y" select="@Y"/>
      <xsl:variable name="X" select="@X"/>
      <xsl:variable name="line" select="@Line_Number"/>
      <xsl:variable name="height" select="@Field_Height"/>
      <xsl:variable name="nextY" select="following-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prevY" select="preceding-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prev2Y" select="preceding-sibling::*[@Type!='23'][2]/@Y"/>
      <xsl:variable name="prev3Y" select="preceding-sibling::*[@Type!='23'][3]/@Y"/>
      <xsl:variable name="prevX" select="preceding-sibling::*[@Type!='23'][1]/@X"/>
      <xsl:variable name="prev2X" select="preceding-sibling::*[@Type!='23'][2]/@X"/>
      <xsl:variable name="prevSize" select="preceding-sibling::*[@Type!='23'][1]/@Size"/>
      <xsl:variable name="nextSize" select="following-sibling::*[@Type!='23'][1]/@Size"/>

      <xsl:variable name="nextLine" select="following-sibling::*[@Type!='23'][1]/@Line_Number"/>
      <xsl:variable name="prevLine" select="preceding-sibling::*[@Type!='23'][1]/@Line_Number"/>
      <xsl:variable name="prev2Line" select="preceding-sibling::*[@Type!='23'][2]/@Line_Number"/>
      <xsl:variable name="prevHeight" select="preceding-sibling::*[@Type!='23'][1]/@Field_Height"/>

      <xsl:variable name="isNewHighField" select="$prev2Line != $prevLine and $prevHeight > '1'"/>

      <xsl:choose>
        <xsl:when test="$prevLine != $line">
          <xsl:if test="$pos > 1">
            <xsl:value-of select="$divEnd" disable-output-escaping="yes"/>
          </xsl:if>
          <xsl:call-template name="addLineBreak"></xsl:call-template>
          <xsl:value-of select="$divOpen" disable-output-escaping="yes"/>
          <xsl:text> class=&quot;</xsl:text>
          <xsl:text>floatLeft width100</xsl:text>
          <xsl:text>&quot;</xsl:text>
          <xsl:value-of select="$divClose" disable-output-escaping="yes"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="$prevY + 1 &lt; $Y or ($prevY &lt; $Y and $X = '1' and $isNewHighField)">
            <xsl:variable name="updatedRow">
              <xsl:choose>
                <xsl:when test="not($isNewHighField) or $X = '0' and $isNewHighField">
                  <xsl:value-of select="$prevY + 1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$prevY"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>

            <xsl:call-template name="addEmptyCells">
              <xsl:with-param name="currRow" select="$updatedRow"/>
              <xsl:with-param name="targetRow" select="$Y"/>
            </xsl:call-template>

          </xsl:if>

        </xsl:otherwise>
      </xsl:choose>

      <xsl:choose>
        <xsl:when test="@Size='2'">
          <div style="height:0;clear:both;line-height:0px;visibilty:hidden;">&#160;</div>
          <div class="floatLeft width100">
            <xsl:call-template name="addField">
              <xsl:with-param name="elementNode" select="."></xsl:with-param>
            </xsl:call-template>
          </div>
          <div style="height:0;clear:both;line-height:0px;">&#160;</div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="@X='0'">
              <div class="floatLeft width50">
                <xsl:call-template name="addField">
                  <xsl:with-param name="elementNode" select="."></xsl:with-param>
                </xsl:call-template>
              </div>
            </xsl:when>
            <xsl:when test="@X='1'">
              <div class="floatRight width50">
                <xsl:call-template name="addField">
                  <xsl:with-param name="elementNode" select="."></xsl:with-param>
                </xsl:call-template>
              </div>
            </xsl:when>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
    
  <xsl:template name ="applyFieldsOld">
    <xsl:param name="fieldsSet"/>
    <xsl:variable name="divOpen" select="concat('&lt;','div')" />
    <xsl:variable name="divClose" select="'&gt;'"/>
    <xsl:variable name="divEnd" select="concat('&lt;','/div','&gt;')" />

    <!--<xsl:for-each select="$fieldsSet[@ApiName!='TotalsBox' and @ApiName!='Signature']">-->
    <xsl:for-each select="$fieldsSet[@Type!='23']">

      <xsl:variable name="pos" select="position()"/>
      <xsl:variable name="Y" select="@Y"/>
      <xsl:variable name="X" select="@X"/>
      <xsl:variable name="line" select="@Line_Number"/>
      <xsl:variable name="height" select="@Field_Height"/>
      <xsl:variable name="nextY" select="following-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prevY" select="preceding-sibling::*[@Type!='23'][1]/@Y"/>
      <xsl:variable name="prev2Y" select="preceding-sibling::*[@Type!='23'][2]/@Y"/>
      <xsl:variable name="prev3Y" select="preceding-sibling::*[@Type!='23'][3]/@Y"/>
      <xsl:variable name="prevX" select="preceding-sibling::*[@Type!='23'][1]/@X"/>
      <xsl:variable name="prev2X" select="preceding-sibling::*[@Type!='23'][2]/@X"/>
      <xsl:variable name="prevSize" select="preceding-sibling::*[@Type!='23'][1]/@Size"/>
      <xsl:variable name="nextSize" select="following-sibling::*[@Type!='23'][1]/@Size"/>
      
      <xsl:variable name="isEndFloatBeforeCurrent">
        <xsl:choose>
          <xsl:when test="$pos > 1">
            <xsl:choose>
              <xsl:when test="@Size='2'">
                <xsl:choose>
                  <xsl:when test="$pos > 2">
                    <xsl:choose>
                      <xsl:when test="$prev2Y=$prevY">true</xsl:when>
                      <xsl:otherwise>false</xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise> <!--@Size='1'-->
                <xsl:choose>
                  <xsl:when test="$prevSize = '2'">false</xsl:when>
                  <xsl:when test="$prevSize = '1'">
                    <xsl:choose>
                      <xsl:when test="$pos > 1">
                        <xsl:choose>
                          <xsl:when test="$X='1' and $prevY=$Y">
                            <xsl:choose>
                              <xsl:when test="$pos > 3">
                                <xsl:choose>
                                  <xsl:when test="$prev3Y=$prev2Y">false</xsl:when>
                                  <xsl:otherwise>true</xsl:otherwise>
                                </xsl:choose>
                              </xsl:when>
                              <xsl:otherwise>true</xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
                          <xsl:when test="$pos > 2">
                            <xsl:choose>
                              <xsl:when test="$prev2Y=$prevY">
                                <xsl:choose>
                                  <xsl:when test="$nextY=$Y or $pos=last()">false</xsl:when>
                                  <xsl:otherwise>true</xsl:otherwise>
                                </xsl:choose>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:choose>
                                  <xsl:when test="$pos > 3">
                                    <xsl:choose>
                                      <xsl:when test="$prev3Y=$prev2Y and $prevY=$Y">true</xsl:when>
                                      <xsl:otherwise>false</xsl:otherwise>
                                    </xsl:choose>
                                  </xsl:when>
                                  <xsl:otherwise>false</xsl:otherwise>
                                </xsl:choose>
                              </xsl:otherwise>
                            </xsl:choose>
                          </xsl:when>
                          <xsl:otherwise>false</xsl:otherwise><!--$pos <= 2 -->
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>false</xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:when>
          <xsl:otherwise>false</xsl:otherwise><!-- $pos <= 1 -->
        </xsl:choose
      ></xsl:variable>

      <xsl:if test="$isEndFloatBeforeCurrent='true'">
        <xsl:value-of select="$divEnd" disable-output-escaping="yes"/>
      </xsl:if>
      <!--<xsl:if test="$prevSize='1' and $prevX = '0' and $prevY!=$Y">
        <div class="width50 floatRight">&#160;</div>
      </xsl:if>-->
      <!--<xsl:if test="@Size='1' and $X = '0' and ($nextSize='2' and $nextY!=$Y)">-->
      <xsl:if test="@Size='1' and $X = '0' and ($nextY!=$Y or $pos = last())">
        <div class="width50 floatRight">&#160;</div>
      </xsl:if>
      <!--<xsl:if test="@Size='1' and $X = '1' and ($nextSize='2' and $prevY!=$Y)">-->
      <xsl:if test="@Size='1' and $X = '1' and ($prevY!=$Y or $pos=1)">
        <div class="width50 floatLeft">&#160;</div>
      </xsl:if>

      <xsl:variable name="isNewFloatBeforeCurrent">
        <xsl:choose>
          <xsl:when test="position() = last()">false</xsl:when>
          <xsl:when test="@Size='2'">false</xsl:when>
          <xsl:otherwise>  <!--@Size='1'-->
            <xsl:choose>
              <xsl:when test="$pos > 1">
                <xsl:choose>
                  <xsl:when test="$X='0' and $nextY=$Y">
                    <xsl:choose>
                      <xsl:when test="$pos > 2">
                        <xsl:choose>
                          <xsl:when test="$prev2Y=$prevY">false</xsl:when>
                          <xsl:otherwise>true</xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>true</xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:when test="$X='1' and $prevY=$Y">
                    <xsl:choose>
                      <xsl:when test="$pos > 3">
                        <xsl:choose>
                          <xsl:when test="$prev3Y=$prev2Y">false</xsl:when>
                          <xsl:otherwise>true</xsl:otherwise>
                        </xsl:choose>
                      </xsl:when>
                      <xsl:otherwise>true</xsl:otherwise>
                    </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise> <!--$pos=1-->
                <xsl:choose>
                  <xsl:when test="$nextY=$Y">true</xsl:when>
                  <xsl:otherwise>false</xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise> <!--$pos=1-->
            </xsl:choose>
            
          </xsl:otherwise> <!--@Size='1'-->
        </xsl:choose
      ></xsl:variable>


      <xsl:if test="$isNewFloatBeforeCurrent = 'true'">
        <xsl:value-of select="$divOpen" disable-output-escaping="yes"/>
        <xsl:text> class=&quot;</xsl:text>
        <xsl:choose>
          <xsl:when test="@X='0'"><xsl:text>floatLeft</xsl:text></xsl:when>
          <xsl:when test="@X='1'"><xsl:text>floatRight</xsl:text></xsl:when>
          <xsl:otherwise><xsl:text>floatLeft</xsl:text></xsl:otherwise>
        </xsl:choose>
        <xsl:text> </xsl:text>
        
        <xsl:choose>
          <xsl:when test="@Size='1'"><xsl:text>width50</xsl:text></xsl:when>
          <xsl:when test="@Size='2'"><xsl:text>width100</xsl:text>
          </xsl:when><xsl:otherwise><xsl:text>width50</xsl:text></xsl:otherwise>
        </xsl:choose>
        <xsl:text>&quot;</xsl:text>
        <xsl:value-of select="$divClose" disable-output-escaping="yes"/>
      </xsl:if>

      <xsl:choose>
        <xsl:when test="$isNewFloatBeforeCurrent = 'true'">
          <xsl:variable name="posString" >
            <xsl:call-template name="chkFollowingSiblingIfSameFloat">
              <xsl:with-param name="pp" select="self::* | following-sibling::*"/>
              <xsl:with-param name="sideLeftOrRight" select="@X"/>
              <xsl:with-param name="isPosChk" select="-1"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="posEndChk" select="string-length(substring-before($posString,'0'))+1"/>
          
          <xsl:call-template name="chkFollowingSiblingIfSameFloat">
            <xsl:with-param name="pp" select="self::* | following-sibling::*"/>
            <xsl:with-param name="sideLeftOrRight" select="@X"/>
            <xsl:with-param name="isPosChk" select="$posEndChk"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="@Size='2'">
              <div class="floatLeft width100">
                <xsl:call-template name="addField">
                  <xsl:with-param name="elementNode" select="."></xsl:with-param>
                </xsl:call-template>
              </div>
              <div style="height:0;clear:both;line-height:0px;">&#160;</div>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="@X='0'">
                  <xsl:if test="$nextY!=$Y or ($pos=last() and ($prev2Y!= $prevY or $pos=1))">
                    <div class="floatLeft width50">
                      <xsl:call-template name="addField">
                        <xsl:with-param name="elementNode" select="."></xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="@X='1'">
                  <xsl:if test="$prevY!=$Y or $pos=1 or 
                          ($pos=last() and 
                            ($prevY=$Y or not($pos > 1)) and 
                            ($prev3Y!=$prev2Y or not($pos > 3)))">
                    <div class="floatRight width50">
                      <xsl:call-template name="addField">
                        <xsl:with-param name="elementNode" select="."></xsl:with-param>
                      </xsl:call-template>
                    </div>
                  </xsl:if>
                </xsl:when>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>


      <xsl:if test="$pos = last()">
        <xsl:if test="$pos > 1">
          <xsl:choose>
            <xsl:when test="@Size='2'"></xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="@X='0'">
                  <xsl:if test="$pos > 2 and $prev2Y=$prevY">
                    <xsl:value-of select="$divEnd" disable-output-escaping="yes"/>
                  </xsl:if>
                </xsl:when>
                <xsl:when test="@X='1'">
                  <xsl:if test="$pos > 3 and $prevY=$Y and $prev3Y = $prev2Y">
                    <xsl:value-of select="$divEnd" disable-output-escaping="yes"/>
                  </xsl:if>
                </xsl:when>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:if>
      </xsl:if>


    </xsl:for-each>
    
  </xsl:template>

  <xsl:template name="footerTotals">
    <xsl:param name="totalsData"/>
    <xsl:param name="otherTotalsData"/>
    <table class="footerTotals" width="100%">
      <tr>
        <td style="float:left; visibility:hidden;">

          <xsl:variable name="sigSource1" select="$totalsData/Column[@Type='25']"/>
          <xsl:variable name="sigSource2" select="$otherTotalsData/Column[@Type='25']"/>
          <!--<xsl:variable name="sigSource3" select="$totalsData/Column[@Type='20']"/>
          <xsl:variable name="sigSource4" select="$otherTotalsData/Column[@Type='20']"/>-->
          <xsl:variable name="isMissingImg1">
            <xsl:call-template name="isMissingImage">
              <xsl:with-param name="imgUrl" select="$sigSource1/Value"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="isMissingImg2">
            <xsl:call-template name="isMissingImage">
              <xsl:with-param name="imgUrl" select="$sigSource2/Value"/>
            </xsl:call-template>
          </xsl:variable>
          <!--<xsl:variable name="isMissingImg3">
            <xsl:call-template name="isMissingImage">
              <xsl:with-param name="imgUrl" select="$sigSource3/Value"/>
            </xsl:call-template>
          </xsl:variable>
          <xsl:variable name="isMissingImg4">
            <xsl:call-template name="isMissingImage">
              <xsl:with-param name="imgUrl" select="$sigSource4/Value"/>
            </xsl:call-template>
          </xsl:variable>-->
          <xsl:variable name="sigValue">
            <xsl:choose>
              <xsl:when test="($sigSource1/Value != '' and $isMissingImg1 != 'true') or $sigSource1/Name != ''">
                <xsl:value-of select="$sigSource1/Value"/>
              </xsl:when>
              <xsl:when test="($sigSource2/Value != '' and $isMissingImg2 != 'true') or $sigSource2/Name != ''">
                <xsl:value-of select="$sigSource2/Value"/>
              </xsl:when>
              <!--<xsl:when test="($sigSource3/Value != '' and $isMissingImg3 != 'true') or $sigSource3/Name != ''">
                <xsl:value-of select="$sigSource3/Value"/>
              </xsl:when>
              <xsl:when test="($sigSource4/Value != '' and $isMissingImg4 != 'true') or $sigSource4/Name != ''">
                <xsl:value-of select="$sigSource4/Value"/>
              </xsl:when>-->
            </xsl:choose>
          </xsl:variable>
          <xsl:variable name="sigName">
            <xsl:choose>
              <xsl:when test="($sigSource1/Value != '' and $isMissingImg1 != 'true') or $sigSource1/Name != ''">
                <xsl:value-of select="$sigSource1/Name"/>
              </xsl:when>
              <xsl:when test="($sigSource2/Value != '' and $isMissingImg2 != 'true') or $sigSource2/Name != ''">
                <xsl:value-of select="$sigSource2/Name"/>
              </xsl:when>
              <!--<xsl:when test="($sigSource3/Value != '' and $isMissingImg3 != 'true') or $sigSource3/Name != ''">
                <xsl:value-of select="$sigSource3/Name"/>
              </xsl:when>
              <xsl:when test="($sigSource4/Value != '' and $isMissingImg4 != 'true') or $sigSource4/Name != ''">
                <xsl:value-of select="$sigSource4/Name"/>
              </xsl:when>-->
            </xsl:choose>
          </xsl:variable>

          <table>
            <tr>
              <td apiName="Signature" >
                <span class="caption">
                  <xsl:variable name="imgSrc" select="$sigValue"/>
                  <xsl:variable name="isMissingImg">
                    <xsl:call-template name="isMissingImage">
                      <xsl:with-param name="imgUrl" select="$imgSrc"/>
                    </xsl:call-template>
                  </xsl:variable>
                  
                  <xsl:if test="$isMissingImg != 'true'">
                    <img>
                      <xsl:attribute name="src">
                        <xsl:value-of select="$imgSrc" />
                      </xsl:attribute>
                      <xsl:attribute name="class">imgSignature</xsl:attribute>
                    </img>
                  </xsl:if>
                  <xsl:if test="$isMissingImg = 'true'">
                    <div style="line-height:50px;width:150px">&#160;</div>
                  </xsl:if>
                </span>
              </td>
            </tr>
            <tr>
              <!--<td apiName="Signature" style="border-top:1px solid black;text-align:center;">-->
              <td apiName="Signature" style="border-top:0px solid black;text-align:center;"> 
                <span class="field" style="font-size:16px;">
                  <xsl:value-of select="$sigName"/>
                </span>
              </td>
            </tr>

          </table>
        </td>
        <td style="float:right; padding-top:20px;margin-left:auto;margin-right:auto">

          <table style="float:right">
            <xsl:variable name="totalsDataValues" select="$totalsData/Column[@Type='23']/Value/*"/>

            <xsl:for-each select="$totalsDataValues[name()!='DiscountPercentage']">
              <xsl:variable name="totalsClass">
                <xsl:choose>
                  <xsl:when test="name() = 'Totals'">total</xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="name(following-sibling::*[1])='Totals'">subTotalsNoBottom</xsl:when>
                      <xsl:otherwise>subTotals</xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <tr>
                <td class="{$totalsClass}" style="text-align:right">
                    <span>
                      <xsl:value-of select="./Name"/>
                      <xsl:if test="name()='Discount'">
                        <xsl:text> (</xsl:text>
                        <span class="formatNumber" data="type=9"><xsl:value-of select="$totalsDataValues[name()='DiscountPercentage']/Value"/></span>
                        <xsl:value-of select="$totalsDataValues[name()='DiscountPercentage']/Name"/>
                        <xsl:text>)</xsl:text>
                      </xsl:if>
                    </span>
                </td>
                <td class="{$totalsClass} formatNumber" data="type=9" style="text-align:left">
                  <xsl:choose>
                    <xsl:when test="$decimal-separator != '.' or $grouping-separator != ','">
                      <!--<xsl:value-of select="translate(./Value,'.,', $separators)"/>-->
                      <xsl:value-of select="./Value"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="./Value"/>
                    </xsl:otherwise>
                  </xsl:choose>
                  
                </td>
              </tr>
            </xsl:for-each>

            <xsl:if test="count($totalsDataValues) = 0">
              <tr>
                <td>&#160;</td>
              </tr>
            </xsl:if>

          </table>
        </td>
      </tr>
    </table>

  </xsl:template>

  <xsl:template name="applyOldXsl">
    <table id="headerTable" class="header" border="0" width="100%" cellpadding="0" cellspacing="0">
      <xsl:variable name="trStart" select="concat('&lt;','tr', '&gt;')" />
      <xsl:variable name="trEnd" select="concat('&lt;','/tr','&gt;')" />

      <xsl:for-each select="//Header/Column[@Type!='20' and @Type!='25' and @Type!='23']">
        <xsl:variable name="pos" select="position()"/>
        <xsl:choose>
          <xsl:when test="$pos mod 2 = 1">
            <xsl:if test="$pos > 1">
              <xsl:value-of select="$trEnd" disable-output-escaping="yes"/>
            </xsl:if>
            <xsl:value-of select="$trStart" disable-output-escaping="yes"/>
          </xsl:when>
        </xsl:choose>
        <td width="50%" valign="top" style="padding:0;">
          <xsl:call-template name="addField">
            <xsl:with-param name="elementNode" select="."></xsl:with-param>
          </xsl:call-template>
        </td>
      </xsl:for-each>
      <xsl:value-of select="$trEnd" disable-output-escaping="yes"/>
    </table>


  </xsl:template>

  <xsl:template name="isMissingImage">
    <xsl:param name="imgUrl"/>
    <xsl:variable name="missingImgParm0" >
      <xsl:value-of select="substring-after($imgUrl,'missingImage=')" disable-output-escaping="yes"/>
    </xsl:variable>
    <xsl:variable name="missingImgParm1" select="substring-before($missingImgParm0, '&amp;')"/>
    <xsl:variable name="missingImgParm">
      <xsl:choose>
        <xsl:when test="$missingImgParm1=''">
          <xsl:value-of select="$missingImgParm0"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$missingImgParm1"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$missingImgParm='true' or $missingImgParm='True' or $imgUrl= ''"/>
  </xsl:template>

  <xsl:template name="replaceKeyValueInUrl">
    <xsl:param name="url"/>
    <xsl:param name="key"/>
    <xsl:param name="value"/>
    <xsl:variable name="url0" select="substring-before($url, $key)"/>
    <xsl:variable name="url1">
      <xsl:choose>
        <xsl:when test="$url0=''"><xsl:value-of select="$url"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="concat($url0, $key, $value)"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="url2">
      <xsl:choose>
        <xsl:when test="$url0=''"></xsl:when>
        <xsl:otherwise>
          <xsl:variable name="url3" select="substring-after(substring-after($url, $key), '&amp;')"/>
          <xsl:choose>
            <xsl:when test="$url3=''"></xsl:when>
            <xsl:otherwise><xsl:value-of select="concat('&amp;', $url3)"/></xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="concat($url1, $url2)"/>
  </xsl:template>
  
  <xsl:template name="setImgUrlDimensions">
    <xsl:param name="url"/>
    <xsl:variable name="strMaxWidth" select="'&amp;maxWidth='"/>
    <xsl:variable name="strMaxHeight" select="'&amp;maxHeight='"/>
    <xsl:variable name="newUrl1">
      <xsl:call-template name="replaceKeyValueInUrl">
        <xsl:with-param name="url" select="$url"/>
        <xsl:with-param name="key" select="$strMaxWidth"/>
        <xsl:with-param name="value" select="$maxImgDimensions"/>
      </xsl:call-template>
    </xsl:variable>
    <xsl:call-template name="replaceKeyValueInUrl">
      <xsl:with-param name="url" select="$newUrl1"/>
      <xsl:with-param name="key" select="$strMaxHeight"/>
      <xsl:with-param name="value" select="$maxImgDimensions"/>
    </xsl:call-template>
  </xsl:template>
  
  <xsl:template name="copyXml">
    <xsl:param name="nodeSet"/>
    <xsl:for-each select="$nodeSet">
      <xsl:text>&lt;</xsl:text><xsl:value-of select="name()"/><xsl:text> </xsl:text>
      <xsl:for-each select="@*">
        <xsl:value-of select="name()"/>="<xsl:value-of select="."/>" <xsl:text> </xsl:text>
      </xsl:for-each><xsl:text>&gt;</xsl:text>
      <xsl:choose>
        <xsl:when test="count(./*) = 0">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:otherwise>
          <br/>
        </xsl:otherwise>      
      </xsl:choose>
      <xsl:call-template name="copyXml">
          <xsl:with-param name="nodeSet" select="./*"/>
      </xsl:call-template>
      <xsl:text>&lt;/</xsl:text><xsl:value-of select="name()"/><xsl:text>&gt;</xsl:text>
      <br/>
    </xsl:for-each>
  </xsl:template>
  
<xsl:template match="/">
<xsl:variable name="firstColumn" select="//Header/Column[1]"/>
<xsl:variable name="count1X" select="count($firstColumn/@X)"/>
<xsl:variable name="count1Y" select="count($firstColumn/@Y)"/>
<xsl:variable name="count1Size" select="count($firstColumn/@Size)"/>
<xsl:variable name="isOldStyleXsl" select="($count1X=0 or $count1Y=0 or $count1Size=0) and count($firstColumn) > 0"/>
<xsl:variable name="areLinesUsed" select="count(//Header/Column[@Field_Height > '1']) > 0 or count($firstColumn) = 0" /> 

  <html>	
<head>
	<title>Report</title>
  <meta charset="utf-8" />
  <xsl:choose>
    <xsl:when test="$isOldStyleXsl">
    </xsl:when>    
  </xsl:choose>
  <style type="text/css">
    <![CDATA[

      .emptyCell {
          float: left;                
          visibility: hidden;
          padding: 0;
          margin:5px;                
      }

      .lineBreak {
          clear: both;
          height: 0px;
          float: left;
          margin: 0;
          padding: 0;
          visibility: hidden;
      }
    
        #headerTable table, #headerTable td, #headerTable td {border:0px!important;}
        /*div{border:1px solid black!important;}*/

        *{text-align:justify;font-family:Arial, Arial Hebrew, Helvetica,Garuda,sans-serif;font-weight:normal;font-size:12px;color:#000}
        body{text-align:justify;font-family:Arial, Arial Hebrew, Helvetica,Garuda,sans-serif;font-weight:normal;font-size:12px;color:#000}

		header, .table-container, footer{width:96%; margin:20px auto 20px auto;}
		.table-container table{}
        .table-container{clear:both;}

		[rel=fl], .fl{float:left;}								
		[rel=fr], .fr{float:right;}
        
        .tdTile{
            padding-left:15px; border:0 none!important; background-color:#f1f1f2; line-height:20px;
            margin-top:25px; margin-bottom:8px; text-align:left; vertical-align:middle;
            font-family:Arial, Arial Hebrew, Helvetica,Garuda,sans-serif;font-weight:normal;font-size:12px; color:#000;
        }

        .divParagraph
        {
            font-size:medium;
            text-align:justify;
        }

        .paragrapgPadding{
            padding-left:2%;
            padding-right:2%;
        }

        .colSpace{width:3%;min-width:3%;max-width:3%}

	.tableFieldsData{
            font-size:12px;
	}			
	
	.tableFields td{
	   padding:3px 5px;
	}

        .logo{width:100px;height:auto; margin-left:auto; margin-right:auto; margin-top:15px}
		.logo img{max-width:400px;}

		.groupTitle{margin-top: 0px}

        h1, h1 span{text-align: center;font-size:28px;font-weight:bold;margin-top:5px;}
		h1.scale-Old{text-align:left;font-size:28px;font-weight:bold;}
        h1.scale{
            margin-top:26px; background-color:#f1f1f2;line-height:38px;
            padding-left:1.5%;padding-right:1.5%;vertical-align:middle;text-align:left;
            font-family:Arial, Arial Hebrew, Helvetica,Garuda,sans-serif;font-size:20px;font-weight:bold;
            color:#000;
        }
		th{font-weight:normal;text-align:center;font-weight:bold;color:#333333;text-align:center;}
		td.old, th.old { border: thin   #333333 collapse ; border-color:#333333;padding:5px;vertical-align: top;}
		table { border: 0 solid #BBBDC0;border-collapse:collapse;  /*border-spacing:0; empty-cells:show;*/}
        td,th{border:1px solid #BBBDC0 ;border-collapse:collapse;padding:5px;vertical-align: top;/*border-spacing:0; empty-cells:show;*/}
        .footerTotals table, .footerTotals td, .footerTotals th{border:0;border-collapse:collapse}
        .subTotals{font-size:14px;height:22px;border-bottom:1px solid #bbbdc0!important;vertical-align:middle;width:94px;}
        .subTotalsNoBottom{font-size:14px;height:22px;vertical-align:middle;width:94px;}
        .total{font-size:16px;font-weight:bold; height:22px;background-color:#f1f1f2;border-top:1px solid #000!important;vertical-align:middle;width:94px;}
		
		.table-container td {text-align:center;/*color:#053B87;*/color:#000; overflow:hidden;text-align:center; vertical-align:middle;}

		header table.header{width:100% !important;}
		header table.header td span.field{float:left;width:25%;font-weight:bold;color:#555;}
		header table.header td.caption{}
		
		table.header td{width:50% !important;}

		tr td.scale-empty{color:#666;text-align:left;border:0; vertical-align:middle;}
        td.scale-empty{padding:0;
        }
        .div-scale-empty{
            margin-top:5px;margin-bottom:5px;background-color:#f1f1f2;
            line-height:16px;
            padding-left:10px;padding-right:10px;padding-top:1px;padding-bottom:1px; vertical-align:middle;text-align:left;
            font-family:Arial, Arial Hebrew, Helvetica,Garuda,sans-serif;font-weight:normal;font-size:12px; color:#000;
        }

		tr td.td-scale{color:#406A9C;font-weight:bold;/*border-color:#000;*/}
		tr td.count-empty{color:#fff;/*border-color:#000;*/}
		tr td.count-zero{color:#ddd;/*border-color:#000;*/}	
		tr.scale td{color:#666;font-weight: bold;}
		td.td-scale{width:30px;}
		td img{/*width:25px*/;height:auto;}


		/* Address table */
		header table.address td{text-align:left;color:#000;border:none;padding:0;}
		header .one table.address{width:400px;text-align:left;color:#000;border:none;padding:0;}
		header .two table.address{width:150px;text-align:left;color:#000;border:none;padding:0;}
		
		

		.headerSeperator{font-weight:bold;margin-top:10px;padding:5px 0 5px 15px;width:100%}
		.seperator1{font-weight:bold;border-top:solid 2px #aaa;border-bottom:solid 1px #ccc;margin-top:10px;padding:5px 0 5px 15px;width:100%}
		
		.seperator{
            padding-left:15px; padding-right:15px; border:0 none!important; background-color:#f1f1f2; line-height:30px;
            margin-top:12px; margin-bottom:8px; text-align:left; vertical-align:middle;
            font-family:Arial, Arial Hebrew, Helvetica,Garuda,sans-serif;font-weight:normal;font-size:16px; color:#000;
        }
        
        .floatLeft{float:left; display:block; clear:left;}
        .floatRight{float:right;display:block; clear:right;}
        .width50{width:48%;}
        .width100{width:100%;}
        .adjustLeft{text-align:left;}
        .hidden{display:none}
        .clearLeft{clear:left;}
        .clearRight{clear:right;}
        .clearBoth{clear:both;}
        .break-word {word-wrap:break-word;}
        .no-justify {text-align:left;}

		td .seperator{width:90%}
		
		.imgSignature{width: auto !important; height: auto !important;}
		
		/* clearfix */
		.clearfix:after {content: ".";display: block;clear: both;visibility: hidden;line-height: 0;height: 0;}		
		.clearfix {display: inline-block;}
		html[xmlns] .clearfix {display: block;}
		* html .clearfix {height: 1%;}

        .myclearfix:after {
          content: "";
          display: table;
          clear: both;
        }
		
		.footer-tc {width:50%;}
		.footer-tc p {font-size:9px;margin:0px;padding:0px;}
		
		.footer-3tc {width:33%;}
		.footer-3tc p {font-size:8px;margin:0px;padding:0px;}

	]]></style>

</head>
<body>
  <xsl:if test="false()">
    <div>
      <h1>XML</h1>
      <xsl:call-template name="copyXml">
        <xsl:with-param name="nodeSet" select="/"/>
      </xsl:call-template>
      <br/>
      END XML
    </div>
  </xsl:if>
  
	<!-- Language Dictionary -->
	<xsl:variable name="Language" select="//Column[@ApiName='AccountLanguage_Code']/Value" />	
	<xsl:variable name="Currency" select="//Column[@ApiName='Currency']/Value" />
	<xsl:variable name="SubTotal" select="//Column[@ApiName='SubTotal']/Value" />
	<xsl:variable name="DiscountPercentage" select="//Column[@ApiName='DiscountPercentage']/Value" />
	<xsl:variable name="AccountVAT" select="//Column[@ApiName='AccountVAT']/Value" />

  
	<script language="javascript" type="text/javascript">
		function getGroupingSeparator(TheNumber) {		
			
      		return "<xsl:value-of select='$grouping-separator'/>";
    }

    var GroupingSeparator="";

    var requested_decimal_separator = "<xsl:value-of select='$decimal-separator'/>";
    var requested_grouping_separator = "<xsl:value-of select='$grouping-separator'/>";

    var groupRegExp = new RegExp(requested_grouping_separator=='.'?'\\.':requested_grouping_separator, 'g');
    var decimalRegExp = new RegExp(requested_decimal_separator=='.'?'\\.':requested_decimal_separator, 'g');
    
    function addCommas(nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = !(x.length == 1 || x.length == 0)  ? '.' + x[1] : ''; // cannot code greater than
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
    x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
    }

  </script>
	
	<div style="display:none;">	
		<select lang="DEU">	
			<!-- German Header Fields -->
			<option id="DEUAccountExternalID">Kundencode</option>
			<option id="DEUWrntyID">Ursprungsorder</option>
			<option id="DEUBillToName">Firma</option>
			<option id="DEUDate">Auftragsdatum</option>
			<option id="DEUBillToStreet">Anschrift</option>
			<option id="DEUType">Auftragsart</option>
			<option id="DEUBillToCity">Stadt</option>
			<option id="DEUBillToZipCode">Postleitzahl</option>
			<option id="DEUAgentName">Handelsvertretung</option>
			<option id="DEUBillToCountry">Land</option>
			<option id="DEUAccountLanguage_Code">Konto Sprachen</option>
			<option id="DEUShipToExternalID">Liefercode</option>
			<option id="DEUShipToName">Lieferung an</option>
			<option id="DEUShipToStreet">Anschrift</option>
			<option id="DEUShipToCity">Stadt</option>
			<option id="DEUShipToZipCode">Postleitzahl</option>
			<option id="DEUShipToCountry">Land</option>
			<option id="DEUAccountEmail">Email</option>
			<option id="DEUBillToPhone">Telefon</option>	
			<option id="DEUSubTotal">Orderwert vor Rabatt</option>
			<option id="DEUDiscountPercentage">Orderwert nach Rabatt</option>
			<option id="DEUAccountVat">MwSt.</option>
			<option id="DEUExternalDocNum">Kundenreferenz</option>
			<option id="DEUYourReference">Ihre Referenz</option>
			
			
			<!-- German Cart Fields -->
			<option id="DEUImage">Bild</option>
			<option id="DEUStyleImage">SupeRep Bestell-Nr.</option>
			<option id="DEUItemMainCategory">Kategorie</option>			
			<option id="DEUItemProp4">Gender</option>
			<option id="DEUItemMainCategoryCode">Artikel</option>
			<option id="DEUItemDimension1Code">Farbcode</option>
			<option id="DEUItemName">Name</option>
			<option id="DEUItemProp6">Original Phase</option>
			<option id="DEUItemPrice">UVP</option>
			<option id="DEUUnitPrice">Preis €</option>
			<option id="DEUUnitDiscountPercentage">Rabatt %</option>
			<option id="DEUUnitPriceAfterDiscount">Preis nach Rabatt</option>
			<option id="DEUTotalUnitsPriceAfterDiscount">Gesamtpreis €</option>
			<option id="DEUUnitsQuantity">Menge</option>
			<option id="DEUItemPhaseForCombo">Phase</option>
			
			<!-- German Hard-Coded -->
			<option id="DEUtxtOrderAcknowledgement">Auftrag</option>
			<option id="DEUtxtCustomerInformation">Kunde</option>
			<option id="DEUtxtDeliveryAddress">Lieferanschrift</option>
			<option id="DEUtxtContactInformation">Kontakt Information</option>
			<option id="DEUtxtOrderInformation">Bestell-Informationen</option>
			
			
		</select>
		<select lang="EN">	
			<!-- English Header Fields -->
			<option id="ENAccountExternalID">Bill-to Customer No :</option>
			<option id="ENWrntyID">Original Order No :</option>
			<option id="ENBillToName">Account Name</option>
			<option id="ENDate">Submission Date</option>
			<option id="ENBillToStreet">Address</option>
			<option id="ENType">Order Type</option>
			<option id="ENBillToCity">City</option>
			<option id="ENBillToZipCode">Zip Code</option>
			<option id="ENAgentName">Agent Name</option>
			<option id="ENBillToCountry">Country</option>
			<option id="ENAccountLanguage_Code">Account Language</option>
			<option id="ENShipToExternalID">Ship-to Customer No :</option>
			<option id="ENShipToName">Ship To Account Name</option>
			<option id="ENShipToStreet">Street</option>
			<option id="ENShipToCity">City</option>
			<option id="ENShipToZipCode">Zip Code</option>
			<option id="ENShipToCountry">Country</option>
			<option id="ENAccountEmail">Email</option>
			<option id="ENBillToPhone">Phone</option>	
			<option id="ENSubTotal">Total Value Before Discount</option>
			<option id="ENDiscountPercentage">Main Discount Percentage</option>
			<option id="ENAccountVat">VAT </option>			
			<option id="ENExternalDocNum">External Doc reference</option>
			<option id="ENYourReference">Your Reference</option>
			
			<!-- English Cart Fields -->
			<option id="ENImage">Image</option>
			<option id="ENStyleImage">account wrnty</option>
			<option id="ENMainCategoryCode">Range</option>
			<option id="ENItemProp4">Gender</option>
			<option id="ENItemMainCategoryCode">Item</option>
			<option id="ENItemDimension1Code">Color Code</option>
			<option id="ENItemName">Name</option>
			<option id="ENItemProp6">Original Phase</option>
			<option id="ENItemPrice">List Price</option>
			<option id="ENUnitPrice">Price</option>
			<option id="ENUnitDiscountPercentage">Disc %</option>
			<option id="ENUnitPriceAfterDiscount">Price</option>
			<option id="ENTotalUnitsPriceAfterDiscount">Total Price</option>
			<option id="ENUnitsQuantity">QTY</option>
			<option id="ENItemPhaseForCombo">Selected Phase</option>
			
			<!-- English Hard-Coded -->
			<option id="ENtxtOrderAcknowledgement">Order Acknowledgement</option>
			<option id="ENtxtCustomerInformation">Bill-to Customer</option>
			<option id="ENtxtDeliveryAddress">Ship-to Address</option>
			<option id="ENtxtContactInformation">Contact Information2</option>
			<option id="ENtxtOrderInformation">Order Information</option>
			
		</select>			
	</div>
		<header>
      <div>
		<!-- Header + Logo-->
		<h1>
      <xsl:variable name="imgSrc" select="/Root/Title/Image"/>
      <xsl:variable name="isMissingImg">
        <xsl:call-template name="isMissingImage">
          <xsl:with-param name="imgUrl" select="$imgSrc"/>
        </xsl:call-template>
      </xsl:variable>

      <div class="logo">

        <xsl:if test="$isMissingImg != 'true'">
          <img><xsl:attribute name="src"><xsl:value-of select="$imgSrc" /></xsl:attribute></img>
        </xsl:if>
        <xsl:if test="$isMissingImg = 'true'"><xsl:text> </xsl:text></xsl:if>
          
			</div>
      <xsl:if test="$isMissingImg = 'true'">
        <span style="margin-top:5px" >
          <xsl:value-of select="/Root/Title/Caption" />
        </span>
      </xsl:if>
      
		</h1>

        <div style="margin-top:14px;line-height:0px;height:0;">&#160;</div>
        
        <xsl:choose>
          <xsl:when test="$isOldStyleXsl">
            <xsl:call-template name="applyOldXsl">
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$areLinesUsed">
                <xsl:call-template name="applyFields">
                  <xsl:with-param name="fieldsSet" select="//Header/Column"/>
                </xsl:call-template>
              </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="applyFieldsOld">
                  <xsl:with-param name="fieldsSet" select="//Header/Column"/>
                </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>

        <div class="floatLeft" style="clear:both">
          <br />
          <br />
          <br />
        </div>

      </div>
	</header>

  <xsl:variable name="areThereGroupings" select="not(count(//Group) &lt;= 1 and (//Group[1]/@Name = '' or count(//Group) = 0))"/>

  <xsl:for-each select="//Group">

		<xsl:variable name="GroupName" select="@Name" /> 
	
		<header class="table-container">
			
      <xsl:variable name="count1" select="count(./Line[@Type=1][1]//Column)"/>
      <xsl:variable name="count2" select="12"/>
      <xsl:variable name="count3">
        <xsl:for-each select="./Line">							
					<xsl:choose>
						<xsl:when test="@Type = 2 and count(//Scales/Scale) &gt; 0">								
						
							<xsl:variable name="ScaleID" select="./@ScaleID" />																												
							<xsl:value-of select="./@ColumnCount + count(//Scale[@ScaleID=$ScaleID]/Column)" />

						</xsl:when>
						<xsl:otherwise>		
              <xsl:value-of select="count(.//Column)" />
						</xsl:otherwise>
					</xsl:choose>								
          
          <xsl:text> </xsl:text>
				</xsl:for-each>
      </xsl:variable>      

      <xsl:variable name="maxCols">
        <xsl:call-template name="max">
          <xsl:with-param name="seq">
            <xsl:value-of select="$count1"/>
            <xsl:text> </xsl:text>
            <!--<xsl:value-of select="$count2"/>
            <xsl:text> </xsl:text>-->
            <xsl:value-of select="$count3"/>
          </xsl:with-param>
          <xsl:with-param name="maxSoFar" select="'0'"/>        
        </xsl:call-template>
      </xsl:variable>
      <!--<script language="javascript" type="text/javascript">alert(<xsl:value-of select="$maxCols"/>)</script>-->

      <xsl:variable name="areThereScales" select="count(//Scales/Scale) > 0" />
		
			<table id="cartTable" border="1" cell-spacing="0" cell-padding="0" width="100%" >

        <xsl:variable name="totalWidth" select="sum(./Line[@Type=1][1]//Column/@width)"></xsl:variable>

        <thead id="cartHeader" style="display: table-header-group;background-color:#f1f1f2">

          <tr>
            <xsl:for-each select="./Line[@Type=1][1]//Column">

              <td>
                <xsl:attribute name="style">
                  width:<xsl:value-of select="(./@width div $totalWidth) * 100" />%;
                </xsl:attribute>

                <xsl:attribute name="id">
                  <xsl:value-of select="./@ApiName" />
                  <xsl:value-of select="$GroupName" />
                </xsl:attribute>
                <xsl:attribute name="class">
                  <xsl:value-of select="./@ApiName" />Field
                </xsl:attribute>

                <xsl:if test="not(./@IsScale = 1)">

                  <xsl:value-of select='./Name' />
                  <script language="javascript" type="text/javascript">

                    var id = "<xsl:value-of select='$Language' /><xsl:value-of select='./@ApiName' />";
                    var groupName = '<xsl:value-of select='$GroupName' />';

                    if(document.getElementById(id) != null){
                    if(!groupName.trim().length)
                    {
                    document.getElementById("<xsl:value-of select='./@ApiName' />").innerHTML = "<xsl:value-of select='./Name' />";
                    }
                    else
                    {
                    document.getElementById("<xsl:value-of select='./@ApiName' /><xsl:value-of select='$GroupName' />").innerHTML = document.getElementById(id).innerHTML;
                    }
                    }
                    else{
                    if(!groupName.trim().length){
                    document.getElementById("<xsl:value-of select='./@ApiName' />").innerHTML = "<xsl:value-of select='./Name' />";
                    }
                    else{
                    document.getElementById("<xsl:value-of select='./@ApiName' /><xsl:value-of select='$GroupName' />").innerHTML = "<xsl:value-of select='./Name' />";
                    }
                    }


                  </script>
                </xsl:if>
              </td>

            </xsl:for-each>

            <xsl:if test="$areThereScales">
              <xsl:call-template name='addTdsThs'>
                <xsl:with-param name="numToAdd" select="$maxCols - $count1"/>
                <xsl:with-param name="isTd" select="false()"/>
              </xsl:call-template>
            </xsl:if>

          </tr>


        </thead>
        
        <!--Start Group Custom Headers-->

        <xsl:if test="$areThereGroupings">
          <tr>
            <td colspan="{$maxCols}" style="border:0;padding:0">
              <xsl:variable name="phaseName">
                <xsl:choose>
                  <xsl:when test="number(@Name) != @Name">
                    <xsl:value-of select="@Name"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:choose>
                      <xsl:when test="substring-before(@Name, '.00') != ''">
                        <xsl:value-of select="substring-before(@Name, '.00')"/>
                      </xsl:when>
                      <xsl:otherwise>
                        <!--<xsl:value-of select="translate(@Name,'.,', $separators)"/>-->
                        <xsl:value-of select="@Name"/>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <h1 class="scale">
                <!--<xsl:text>Phase:</xsl:text>
                <xsl:text>&#160;</xsl:text>-->
                <xsl:value-of select="$phaseName" />
              </h1>
            </td>
          </tr>
        </xsl:if>

        <xsl:if test="@Name = '1' or @Name = '2' or @Name = '3'">
          <tr>
            <td colspan="{$maxCols}" style="border:0;padding:0">
              <h2 class="scale groupTitle">

                <xsl:if test="@Name = '1'">
                  <xsl:if test="//Header/Column[@ApiName='Phase1newstart']/Value != ''">
                    <xsl:value-of select="//Header/Column[@ApiName='Phase1newstart']/Value" />
                  </xsl:if>
                  <xsl:if test="//Header/Column[@ApiName='Phase1newstart']/Value = ''">
                    <xsl:text>25/06/2014</xsl:text>
                  </xsl:if>
                </xsl:if>

                <xsl:if test="@Name = '2'">
                  <xsl:if test="//Header/Column[@ApiName='Phase2NewStartDate']/Value != ''">
                    <xsl:value-of select="//Header/Column[@ApiName='Phase2NewStartDate']/Value" />
                  </xsl:if>
                  <xsl:if test="//Header/Column[@ApiName='Phase2NewStartDate']/Value = ''">
                    <xsl:text>01/08/2014</xsl:text>
                  </xsl:if>
                </xsl:if>

                <xsl:if test="@Name = '3'">
                  <xsl:if test="//Header/Column[@ApiName='Phase3NewStartDate']/Value != ''">
                    <xsl:value-of select="//Header/Column[@ApiName='Phase3NewStartDate']/Value" />
                  </xsl:if>
                  <xsl:if test="//Header/Column[@ApiName='Phase3NewStartDate']/Value = ''">
                    <xsl:text>29/08/2014</xsl:text>
                  </xsl:if>
                </xsl:if>
              </h2>
            </td>
          </tr>
          <tr>
            <td colspan="{$maxCols}" style="border:0;padding:0">
              <h2 class="scale groupTitle">

                <xsl:if test="@Name = '1'">
                  <xsl:if test="//Header/Column[@ApiName='Phase1newenddate']/Value != ''">
                    <xsl:value-of select="//Header/Column[@ApiName='Phase1newenddate']/Value" />
                  </xsl:if>
                  <xsl:if test="//Header/Column[@ApiName='Phase1newenddate']/Value = ''">
                    <xsl:text>11/08/2014</xsl:text>
                  </xsl:if>
                </xsl:if>

                <xsl:if test="@Name = '2'">
                  <xsl:if test="//Header/Column[@ApiName='Phase2NewEndDate']/Value != ''">
                    <xsl:value-of select="//Header/Column[@ApiName='Phase2NewEndDate']/Value" />
                  </xsl:if>
                  <xsl:if test="//Header/Column[@ApiName='Phase2NewEndDate']/Value = ''">
                    <xsl:text>15/09/2014</xsl:text>
                  </xsl:if>
                </xsl:if>

                <xsl:if test="@Name = '3'">
                  <xsl:if test="//Header/Column[@ApiName='Phase3NewEndDate']/Value != ''">
                    <xsl:value-of select="//Header/Column[@ApiName='Phase3NewEndDate']/Value" />
                  </xsl:if>
                  <xsl:if test="//Header/Column[@ApiName='Phase3NewEndDate']/Value = ''">
                    <xsl:text>26/09/2014</xsl:text>
                  </xsl:if>
                </xsl:if>
              </h2>
            </td>
          </tr>
        </xsl:if>
        
        <!--END Group Custom Headers-->

        <!--<xsl:variable name="totalWidth" ... -->
        <!--<tr>...</tr>-->

					<xsl:for-each select="./Line">							
					<xsl:choose>
						<xsl:when test="@Type = 2 and count(//Scales/Scale) &gt; 0">								
						<tr class="scale">		
						
							<xsl:variable name="ScaleID" select="./@ScaleID" />																												
							<td class="scale-empty">
								<xsl:attribute name="colspan">
									<xsl:value-of select="./@ColumnCount" />
								</xsl:attribute>
                <div class="div-scale-empty">
                  <xsl:value-of select="//Scale[@ScaleID=$ScaleID]/@Name" />
                  <xsl:text>&#160;</xsl:text>
                </div>
							</td>
							<xsl:for-each select="//Scale[@ScaleID=$ScaleID]/Column">						
								<td><xsl:value-of select="Name" /> <xsl:text>&#160;</xsl:text></td>							
							</xsl:for-each>

              <xsl:if test="$areThereScales">
                <xsl:call-template name='addTdsThs'>
                  <xsl:with-param name="numToAdd" select="$maxCols - (./@ColumnCount + count(//Scale[@ScaleID=$ScaleID]/Column))"/>
                  <xsl:with-param name="isTd" select="true()"/>
                </xsl:call-template>
              </xsl:if>
				
						</tr>								
						</xsl:when>
						<xsl:otherwise>		
						<tr style="page-break-inside : avoid">		
							
							<xsl:for-each select=".//Column">					
								<td class="formatNumber" data="type={./@Type}">							
									<xsl:variable name="Type" select="./@Type" />						
									<xsl:variable name="IsScale" select="./@IsScale" />													
									<xsl:variable name="Value" select="Value" />													
									<xsl:variable name="ApiName" select="./@ApiName" />
									
									<xsl:if test="$IsScale = 1">																								
										<xsl:choose>					
											<xsl:when test="$Value = '-'"><xsl:attribute name="class">td-scale count-empty</xsl:attribute></xsl:when>
											<xsl:when test="$Value = 0"><xsl:attribute name="class">td-scale count-zero</xsl:attribute></xsl:when>
											<xsl:otherwise><xsl:attribute name="class">td-scale</xsl:attribute></xsl:otherwise>							
										</xsl:choose>	
									</xsl:if>			
									
									<xsl:choose>					
										<xsl:when test="$Type = 20">
                      <xsl:attribute name="style">
                        max-width:<xsl:value-of select="(./@width div $totalWidth) * 100" />%;
                      </xsl:attribute>
                      <xsl:variable name="imgUrl">
                        <xsl:call-template name="setImgUrlDimensions">
                          <xsl:with-param name="url" select="Value"/>
                        </xsl:call-template>
                      </xsl:variable>
											<img class="cartImg" data="w={(./@width div $totalWidth) * 100}">
												<xsl:attribute name="src"><xsl:value-of select="$imgUrl" /></xsl:attribute>												
											</img>
										</xsl:when>
										<!--<xsl:otherwise><xsl:value-of select="translate($Value,'.,', $separators)" /> <xsl:text>&#160;</xsl:text></xsl:otherwise>-->
                    <xsl:otherwise><xsl:value-of select="$Value" /> <xsl:text>&#160;</xsl:text></xsl:otherwise>
									</xsl:choose>

								</td>
                
                							
							</xsl:for-each>

              <xsl:if test="$areThereScales">
                <xsl:call-template name='addTdsThs'>
                  <xsl:with-param name="numToAdd" select="$maxCols - count(.//Column)"/>
                  <xsl:with-param name="isTd" select="true()"/>
                </xsl:call-template>
              </xsl:if>

            </tr>
						</xsl:otherwise>
					</xsl:choose>								
					</xsl:for-each>

        <tr>
            <td style="border:0;line-height:0px;padding:5px">&#160;</td>
        </tr>
					
        <xsl:variable name="colsBeforeUnitsQuantity" >
          <xsl:call-template name="precedingSibling">
            <xsl:with-param name="nodeSet" select="./Line[@Type=1][1]//Column[@ApiName='UnitsQuantity']"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="colsBeforeTotalPriceAfterDiscount" >
          <xsl:call-template name="precedingSibling">
            <xsl:with-param name="nodeSet" select="./Line[@Type=1][1]//Column[@ApiName='TotalUnitsPriceAfterDiscount']"/>
          </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="cols1Before">
          <xsl:choose>
            <xsl:when test="$colsBeforeTotalPriceAfterDiscount > $colsBeforeUnitsQuantity">
              <xsl:value-of select="$colsBeforeUnitsQuantity"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="$colsBeforeTotalPriceAfterDiscount=''">
                  <xsl:value-of select="$colsBeforeUnitsQuantity"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$colsBeforeTotalPriceAfterDiscount"/>                  
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:variable name="cols2Before">
          <xsl:choose>
            <xsl:when test="$colsBeforeTotalPriceAfterDiscount > $colsBeforeUnitsQuantity">
              <xsl:value-of select="$colsBeforeTotalPriceAfterDiscount - $colsBeforeUnitsQuantity"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="$colsBeforeTotalPriceAfterDiscount=''">
                  <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:when test="$colsBeforeUnitsQuantity=''">
                  <xsl:value-of select="1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$colsBeforeUnitsQuantity - $colsBeforeTotalPriceAfterDiscount"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <xsl:if test="$colsBeforeUnitsQuantity!='' or $colsBeforeTotalPriceAfterDiscount!=''">
          <tr>


            <td colspan="{$cols1Before}" style="text-align:right;">Total:</td>
            <xsl:if test="$colsBeforeUnitsQuantity!=''">
              <td>
                <xsl:value-of select="sum(./Line/Column[@ApiName='UnitsQuantity']/Value)"/>
              </td>
            </xsl:if>

            <xsl:if test="$colsBeforeTotalPriceAfterDiscount!=''">
              <xsl:if test="$cols2Before > 1">
                <td colspan="{$cols2Before - 1}">&#160;</td>
              </xsl:if>
              <td>
                <span id="TotalUnitsPriceAfterDiscount_{$GroupName}">0</span>

                <br />
                <xsl:for-each select="./Line/Column[@ApiName='TotalUnitsPriceAfterDiscount']">
                  <script language="javascript" type="text/javascript">

                    var curItem="<xsl:value-of select='./Value'/>";

                    var totalSum=document.getElementById("TotalUnitsPriceAfterDiscount_<xsl:value-of select='$GroupName' />").innerHTML;

                    //GroupingSeparator=getGroupingSeparator(curItem);
                    //var requested_decimal_separator = "<xsl:value-of select='$decimal-separator'/>";
                    //var requested_grouping_separator = "<xsl:value-of select='$grouping-separator'/>";

                    if (requested_decimal_separator != "." || requested_grouping_separator != ","){
                    //if (GroupingSeparator==".") {
                    //var groupRegExp = new RegExp(requested_grouping_separator=='.'?'\.':requested_grouping_separator, 'g');
                    //var decimalRegExp = new RegExp(requested_decimal_separator=='.'?'\.':requested_decimal_separator, 'g');
                    curItem=curItem.replace(groupRegExp,"_");
                    totalSum=totalSum.replace(groupRegExp,"_");

                    curItem=curItem.replace(decimalRegExp,".");
                    totalSum=totalSum.replace(decimalRegExp,".");

                    curItem=curItem.replace(/_/g,",");
                    totalSum=totalSum.replace(/_/g,",");
                    }

                    totalSum = totalSum.replace(/[^0-9.-]/gi,"");
                    totalSum=Number(totalSum);
                    curItem = curItem.replace(/[^0-9.-]/gi,"");
                    totalSum+=Number(curItem);
                    totalSum=totalSum.toFixed(2);
                    totalSum = addCommas(totalSum);

                    //var requested_decimal_separator = "<xsl:value-of select='$decimal-separator'/>";
                    //var requested_grouping_separator = "<xsl:value-of select='$grouping-separator'/>";

                    if (requested_decimal_separator != "." || requested_grouping_separator != ","){
                    totalSum=totalSum.replace(/\./g,"_");
                    totalSum=totalSum.replace(/,/g,requested_grouping_separator);
                    totalSum=totalSum.replace(/_/g,requested_decimal_separator);
                    }
                    document.getElementById("TotalUnitsPriceAfterDiscount_<xsl:value-of select='$GroupName' />").innerHTML = totalSum;
                  </script>
                </xsl:for-each>
              </td>

            </xsl:if>

            <xsl:variable name='usedCol1'>
              <xsl:choose>
                <xsl:when test="$colsBeforeUnitsQuantity!=''">
                  <xsl:value-of select="$cols1Before + 1"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$cols1Before"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:variable>
            <xsl:variable name='usedCol2'>
              <xsl:choose>
                <xsl:when test="$colsBeforeTotalPriceAfterDiscount!=''">
                  <xsl:value-of select="($cols2Before - 1) + 1"/>
                </xsl:when>
                <xsl:otherwise>0</xsl:otherwise>
              </xsl:choose>
            </xsl:variable>

            <xsl:variable name='restCols' select='$maxCols - ($usedCol1 + $usedCol2)'/>

            <xsl:if test='$restCols > 0'>
              <td colspan='{$restCols}'>&#160;</td>
            </xsl:if>

          </tr>
        </xsl:if>

      </table>
		</header>	
	
	
	
	</xsl:for-each>

		<!-- Footer - Sub Total -->
  <header style="margin:0px auto 0px auto;">
  <div style="margin:20px auto 20px auto;border-top:2px solid #aaa;border-bottom:2px solid #aaa; width:100%;display:table;">
    <xsl:choose>
      <xsl:when test="$isOldStyleXsl">
        <table class="footerTotals" width="100%">
          <tr>
            <td style="float:left; visibility:hidden;">
              <table>
                <tr>
                  <td apiName="Signature" >
                    <span class="caption">
                      <img>
                        <xsl:attribute name="src">
                          <xsl:value-of select="//Header/Column[@ApiName='Signature']/Value" />
                        </xsl:attribute>
                        <xsl:attribute name="class">imgSignature</xsl:attribute>
                      </img>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td apiName="Signature" style="border-top:1px solid black;text-align:center;">
                    <span class="field" style="font-size:16px">
                      <xsl:text>Signature</xsl:text>
                    </span>
                  </td>
                </tr>

              </table>
            </td>
            <td style="float:right; padding-top:20px">

              <table>
                <tr>
                  <td>
                    <b>
                      <span id="TotalItemsField">Total Qty.</span>:
                    </b>
                  </td>
                  <td align="right">
                    <span id="TotalItemsCalculated">0</span>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b>
                      <span id="SubTotalField"><xsl:text>Sub Total:</xsl:text></span>:
                    </b>
                  </td>
                  <td align="right">
                    <xsl:value-of select="$Currency" />
                    <span id="SubTotalCalculated">0</span>
                  </td>
                </tr>
                <xsl:if test="$DiscountPercentage != '0'">
                  <tr>
                    <td>
                      <b>
                        <span id="DiscountPercentageField">
                          <xsl:text>Discount:</xsl:text>
                        </span> (<xsl:value-of select="//Header/Column[@ApiName='DiscountPercentage']/Value" />%):
                      </b>
                    </td>
                    <td align="right">
                      <xsl:value-of select="$Currency" />
                      <span id="DiscountPercentageCalculated">0</span>
                    </td>
                  </tr>

                  <xsl:if test="($AccountVAT != '0') and ($AccountVAT != '0.00') and ($AccountVAT != '0,00') and ($AccountVAT != '')">
                    <tr>
                      <td>
                        <b>
                          <span id="AccountVATField">
                            <xsl:text>VAT:</xsl:text>
                          </span> (<xsl:value-of select="//Header/Column[@ApiName='AccountVAT']/Value" />%):
                        </b>
                      </td>
                      <td align="right">
                        <xsl:value-of select="$Currency" />
                        <span id="AccountVATCalculated">0</span>
                      </td>
                    </tr>
                  </xsl:if>

                  <tr>
                    <td>
                      <b>
                        <span id="TotalField">Total</span>:
                      </b>
                    </td>

                    <td align="right">
                      <xsl:value-of select="$Currency" />
                      <span id="TotalCalculated">0</span>
                    </td>

                  </tr>
                </xsl:if>
              </table>
            </td>
          </tr>
        </table>                        
      </xsl:when>
    </xsl:choose>

    <xsl:if test="not($isOldStyleXsl)">
      <xsl:choose>
        <xsl:when test="//Footer!=''">
          <xsl:call-template name="footerTotals">
            <xsl:with-param name="totalsData" select="//Footer"/>
            <xsl:with-param name="otherTotalsData" select="//Header"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="footerTotals">
            <xsl:with-param name="totalsData" select="//Header"/>
            <xsl:with-param name="otherTotalsData" select="//Footer"/>
          </xsl:call-template>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>

    <xsl:if test="not($isOldStyleXsl)">
      <span id="SubTotalCalculated" style="display:none;">0</span>
      <span id="TotalItemsCalculated" style="display:none;">0</span>
      <span id="DiscountPercentageCalculated" style="display:none;">0</span>
      <span id="TotalCalculated" style="display:none;">0</span>
      <span id="AccountVATCalculated" style="display:none;">0</span>
    </xsl:if>
    
	</div>
  </header>
    
	<!-- start Footer-->
	<footer>

    <xsl:choose>
      <xsl:when test="$areLinesUsed">
        <xsl:call-template name="applyFields">
          <xsl:with-param name="fieldsSet" select="//Footer/Column"/>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="applyFieldsOld">
          <xsl:with-param name="fieldsSet" select="//Footer/Column"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>    

    <div style="margin-top:40px; margin-left:auto;margin-right:auto;float:left;width:100%; text-align:center">
      <xsl:for-each select="//Footer/ColumnCentered">

        <div style="margin-left:auto;margin-right:auto;font-size:12px;text-align:center">
          <xsl:value-of select="Value"/>
        </div>
      </xsl:for-each>
    </div>    
    
		

	</footer>
	<!-- End Footer-->
		
		<!-- End Conditions & Terms -->
	
		<!-- Languages Script -->
	<script type="text/javascript">
	
		var language = '<xsl:value-of select="$Language" />';
								
		function setApiName(apiName) {		
			if(document.getElementById(apiName + 'Field') != null){		
			document.getElementById(apiName + 'Field').innerHTML = document.getElementById(language + apiName).innerHTML;
			}
		}

		function setApiName2(apiName) {		
			if(document.getElementById(apiName) != null){		
				document.getElementById(apiName).innerHTML = document.getElementById(language + apiName).innerHTML;
			}
			if(document.getElementById(apiName+'2') != null){		
				document.getElementById(apiName+'2').innerHTML = document.getElementById(language + apiName).innerHTML;
			}
		}
		
		setApiName('AccountExternalID');
		setApiName('WrntyID');
		setApiName('BillToName');
		setApiName('Date');
		setApiName('BillToStreet');
		setApiName('Type');
		setApiName('BillToCity');
		setApiName('BillToZipCode');
		setApiName('AgentName');
		setApiName('BillToCountry');
		setApiName('AccountLanguage_Code');
		setApiName('ShipToExternalID');
		setApiName('ShipToName');
		setApiName('ShipToStreet');
		setApiName('ShipToCity');
		setApiName('ShipToZipCode');
		setApiName('ShipToCountry');
		setApiName('AccountEmail');
		setApiName('BillToPhone');
		setApiName('SubTotal');
		setApiName('ExternalDocNum');
		setApiName('YourReference');
		
	
		/* Hard Coded */		
		setApiName2('txtCustomerInformation');
		setApiName2('txtDeliveryAddress');
		setApiName2('txtContactInformation');
		setApiName2('txtOrderInformation');
		setApiName2('txtOrderAcknowledgement');
		
		
		
	</script>

		<!-- SubTotal Calculation -->
  <script type="text/javascript">
    var subTotalX = document.getElementById("SubTotalCalculated");
    if (subTotalX != null)
      subTotalX.innerHTML="0";
  </script>
	
	<xsl:for-each select="//Group/Line/Column[@ApiName='TotalUnitsPriceAfterDiscount']">
		<script type="text/javascript">
			var curItem2="<xsl:value-of select='./Value'/>";
      var SubTotalCalculated="";
      if (subTotalX != null)
      SubTotalCalculated = subTotalX.innerHTML;

      if (requested_decimal_separator != "." || requested_grouping_separator != ","){
      //if (GroupingSeparator==".") {
      curItem2=curItem2.replace(groupRegExp,"_");
      SubTotalCalculated=SubTotalCalculated.replace(groupRegExp,"_");

      curItem2=curItem2.replace(decimalRegExp,".");
      SubTotalCalculated=SubTotalCalculated.replace(decimalRegExp,".");

      curItem2=curItem2.replace(/_/g,",");
      SubTotalCalculated=SubTotalCalculated.replace(/_/g,",");
      }

      SubTotalCalculated=Number(SubTotalCalculated);
      SubTotalCalculated+=Number(curItem2);
      SubTotalCalculated=SubTotalCalculated.toFixed(2);

      if (requested_decimal_separator != "." || requested_grouping_separator != ","){
      SubTotalCalculated=SubTotalCalculated.replace(/\./g,"_");
      SubTotalCalculated=SubTotalCalculated.replace(/,/g,".");
      SubTotalCalculated=SubTotalCalculated.replace(/_/g,",");
      }

      if (subTotalX != null)
      subTotalX.innerHTML = SubTotalCalculated;
    </script>		
	</xsl:for-each>

	<script type="text/javascript">
    var SubTotalCalculated="";
    if (subTotalX != null)
      SubTotalCalculated = subTotalX.innerHTML;
    var DiscountPercentage="<xsl:value-of select='$DiscountPercentage'/>";
		var DiscountPercentageCalculated=0;
		var AccountVAT="<xsl:value-of select='$AccountVAT'/>";
		var AccountVATCalculated=0;
		var TotalCalculated=0;
		
		var TotalItemsCalculated=<xsl:value-of select="sum(//Line/Column[@ApiName='UnitsQuantity']/Value)" />;

    //if (GroupingSeparator==".") {
    //SubTotalCalculated=SubTotalCalculated.replace(/\./g,"_");
    //SubTotalCalculated=SubTotalCalculated.replace(/,/g,".");
    //SubTotalCalculated=SubTotalCalculated.replace(/_/g,",");
    //}
    if (requested_decimal_separator != "." || requested_grouping_separator != ","){
    SubTotalCalculated=SubTotalCalculated.replace(groupRegExp,"_");
    SubTotalCalculated=SubTotalCalculated.replace(decimalRegExp,".");
    SubTotalCalculated=SubTotalCalculated.replace(/_/g,",");
    }

    AccountVAT=AccountVAT.replace(",",".");

    DiscountPercentageCalculated=Number(SubTotalCalculated)*Number(DiscountPercentage)*0.01;
    TotalCalculated=Number(SubTotalCalculated)-Number(DiscountPercentageCalculated);
    AccountVATCalculated=Number(TotalCalculated)*Number(AccountVAT)*0.01;
    TotalCalculated=Number(TotalCalculated)+Number(AccountVATCalculated);

    DiscountPercentageCalculated=DiscountPercentageCalculated.toFixed(2);
    AccountVATCalculated=AccountVATCalculated.toFixed(2);
    TotalCalculated=TotalCalculated.toFixed(2);

    if (requested_decimal_separator != "." || requested_grouping_separator != ","){
    //if (GroupingSeparator==".") {
    DiscountPercentageCalculated=DiscountPercentageCalculated.replace(groupRegExp,"_");
    DiscountPercentageCalculated=DiscountPercentageCalculated.replace(decimalRegExp,".");
    DiscountPercentageCalculated=DiscountPercentageCalculated.replace(/_/g,",");

    AccountVATCalculated=AccountVATCalculated.replace(groupRegExp,"_");
    AccountVATCalculated=AccountVATCalculated.replace(decimalRegExp,".");
    AccountVATCalculated=AccountVATCalculated.replace(/_/g,",");

    TotalCalculated=TotalCalculated.replace(groupRegExp,"_");
    TotalCalculated=TotalCalculated.replace(decimalRegExp,".");
    TotalCalculated=TotalCalculated.replace(/_/g,",");

    AccountVAT=AccountVAT.replace(groupRegExp,",");
    }

    // Vat Calculation and Update the Total with the VAT

    document.getElementById("TotalItemsCalculated").innerHTML = TotalItemsCalculated;
    document.getElementById("DiscountPercentageCalculated").innerHTML = DiscountPercentageCalculated;
    document.getElementById("TotalCalculated").innerHTML = TotalCalculated;
    var AccountVATCalculated = document.getElementById("AccountVATCalculated");
    if (AccountVATCalculated != null)
    AccountVATCalculated.innerHTML = AccountVATCalculated;

  </script>

  <div id="div1" style="display:none">
    <span>Test</span>
    <br/>
  </div>

  <script type="text/javascript">
    var target_decimal_separator = "<xsl:value-of select='$decimal-separator'/>";
    var target_grouping_separator = "<xsl:value-of select='$grouping-separator'/>";

    var element = document.getElementById("div1");
    //element.innerHTML += " QQQQQ";
    
        //element.innerHTML += " " + "Working...";
        var chkElements = document.body.childNodes;
        //element.innerHTML += " " + (chkElements?"OK":"BAD");
        var chkElementsLen = chkElements.length;
        //element.innerHTML += " " + chkElementsLen;
        var jj = 0;
        var areCulturedSeparators = target_decimal_separator != "." || target_grouping_separator != ",";
        
        var cartTable = document.getElementById("cartTable");
        //var clientWidth = document.getElementById("cartTable").clientWidth;
        var clientWidth =  cartTable != null ? 
            cartTable.clientWidth : document.getElementsByTagName("body")[0].clientWidth;
        
        traverseNodes(document.body);

        function traverseNodes(node){
          var childElements = node.childNodes;
          var childElementsLen = childElements.length;
          //element.innerHTML += " " + "traverse called";
          
          for (var ii=0; !(ii==childElementsLen); ii++){
            var el = childElements[ii];
            //element.innerHTML += " " + el.className;
            //element.innerHTML += " " + el.nodeName;
            var dataAttr;
            if (el.nodeName != "#text") {
              dataAttr = el.getAttribute("data");
            }
            //element.innerHTML += " " + "Attr...";
            traverseNodes(el);
            if (!el.className)
              continue;
            if (el.className.indexOf("formatNumber") == -1)
              if(el.className.indexOf("cartImg") == -1)
                continue;
            if (!dataAttr)
              continue;
            var attrs = dataAttr.split("=");
            if (attrs.length == 1 || attrs.length == 0)
              continue;
            if (el.className.indexOf("formatNumber") != -1) {              
              var type = attrs[1];
              if (!(type == "7" || type == "8" || type == "9" || type == "15")) //NumberInetger = 7, NumberReal = 8, Currency = 9, Percentage = 15
                continue;
              jj++;
              
              var text = el.innerHTML;
          
              if (areCulturedSeparators) {
                //text=text.replace(/\./g,"_");
                //text=text.replace(/,/g,".");
                text=text.replace(groupRegExp,"_");
                text=text.replace(decimalRegExp,".");
                text=text.replace(/_/g,",");
              }
          
              var numPlaceHolder = text.replace(/[0-9.,-]+/i,"***");
              var num = text.replace(/[^0-9.-]/gi,"");
              var formatedNum = addCommas(num);

              if (areCulturedSeparators){
                formatedNum=formatedNum.replace(/\./g,"_");
                formatedNum=formatedNum.replace(/,/g,target_grouping_separator);
                formatedNum=formatedNum.replace(/_/g,target_decimal_separator);
              }

              el.innerHTML = numPlaceHolder.replace("***", formatedNum);
            }
            else { // (el.className.indexOf("cartImg") != -1)
              var widthPercent = attrs[1];
              var width = Math.round(Math.min((clientWidth * widthPercent) / 100, <xsl:value-of select='$maxImgDimensions'/>));
              var widthPx = width + 'px';
            
              el.style.maxWidth = widthPx;
              el.style.width = widthPx;
              
              var src = el.src;
              var widthServer = Math.min(width * 2, <xsl:value-of select='$maxImgDimensions'/>);
              el.src = src.replace('maxWidth=' + '<xsl:value-of select='$maxImgDimensions'/>', 'maxWidth=' + widthServer).
                  replace('maxHeight=' + '<xsl:value-of select='$maxImgDimensions'/>', 'maxHeight=' + widthServer);
              
              //element.innerHTML += " ==== " + el.src;
            
            }
              
          }
        }
        
  </script>

</body>
</html>
</xsl:template>
</xsl:stylesheet>
