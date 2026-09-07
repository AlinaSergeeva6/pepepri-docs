<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns="http://www.w3.org/1999/xhtml"
 version="1.0">
    <xsl:output indent="yes" method="xml"/>
    <!-- function to convert number to Standard format (no grouping separator, and decimal separator is '.' -->
    <xsl:template name="NumberToStandardFormat">
        <xsl:param name="inNumber" />
        <xsl:variable name="DecimalSeparator" select="//Config//*[@name='DecimalSeparator']" />
        <xsl:variable name="GroupingSeparator" select="//Config//*[@name='GroupingSeparator']" />
        <xsl:variable name="NoGroupingSeparator" select="translate($inNumber,$GroupingSeparator,'')"/>
        <xsl:variable name="GoodFormat" select="translate($NoGroupingSeparator,$DecimalSeparator,'.')"/>
        <xsl:value-of select="$GoodFormat" />
    </xsl:template>
    <xsl:template match="/">
        <xsl:processing-instruction name="mso-application">
            <xsl:text>progid="Excel.Sheet"</xsl:text>
        </xsl:processing-instruction>
                                                   <xsl:variable name="CurrencySign" select="//Header/Column[Name='Currency']/Value" />
                                         
        <xsl:variable name="ItemLinesCount" select="count(//Line)" />
        <xsl:variable name="HeaderLinesCount" select="count(//Header/Column)" />
        <xsl:variable name="WorksheetLinesCount" select="$ItemLinesCount + $HeaderLinesCount + 5" />
        <!--<xsl:variable name="WorksheetColumnsCount" select="count(//Line[@Type=1][1]//Column)" />-->
        <xsl:variable name="WorksheetColumnsCount" select="//Cart/@TotalColumnsCount" />
        <Workbook
            xmlns="urn:schemas-microsoft-com:office:spreadsheet"
            xmlns:o="urn:schemas-microsoft-com:office:office"
            xmlns:x="urn:schemas-microsoft-com:office:excel"
            xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
            xmlns:html="http://www.w3.org/TR/REC-html40">
            <DocumentProperties
                xmlns="urn:schemas-microsoft-com:office:office">
                <Version>16.00</Version>
            </DocumentProperties>
            <OfficeDocumentSettings
                xmlns="urn:schemas-microsoft-com:office:office">
                <AllowPNG/>
            </OfficeDocumentSettings>
            <ExcelWorkbook
                xmlns="urn:schemas-microsoft-com:office:excel">
                <WindowHeight>7030</WindowHeight>
                <WindowWidth>16000</WindowWidth>
                <WindowTopX>0</WindowTopX>
                <WindowTopY>0</WindowTopY>
                <ProtectStructure>False</ProtectStructure>
                <ProtectWindows>False</ProtectWindows>
            </ExcelWorkbook>
            <Styles>PHONE NUMBER
                <Style ss:ID="Default" ss:Name="Normal">
                    <Alignment ss:Vertical="Bottom"/>
                    <Borders/>
                    <Font ss:FontName="Calibri" x:CharSet="204" x:Family="Swiss" ss:Size="11"
    ss:Color="#000000"/>
                    <Interior/>
                    <NumberFormat/>
                    <Protection/>
                </Style>
                <Style ss:ID="m303543680">
                    <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="2"/>
                        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
                        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="2"/>
                    </Borders>
                </Style>
                <Style ss:ID="s16">
                    <Font ss:FontName="Calibri" x:Family="Swiss" ss:Size="11" ss:Color="#000000"
    ss:Bold="1"/>
                </Style>
                <Style ss:ID="s17">
                    <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
                    <Font ss:FontName="Calibri" x:CharSet="204" x:Family="Swiss" ss:Size="11"
    ss:Color="#000000"/>
                </Style>
                <Style ss:ID="s18">
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                    <Interior ss:Color="#AEAAAA" ss:Pattern="Solid"/>
                </Style>
                <Style ss:ID="s19">
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                    <Interior ss:Color="#AEAAAA" ss:Pattern="Solid"/>
                </Style>
                <Style ss:ID="s20">
                    <Borders>
                        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s21">
                    <Borders>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s22">
                    <Borders>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s23">
                    <Borders/>
                </Style>
                <Style ss:ID="s24">
                    <Borders>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s25">
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s26">
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s27">
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s28">
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="3"/>
                        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="3"/>
                    </Borders>
                </Style>
                <Style ss:ID="s29">
                    <Alignment ss:Vertical="Center"/>
                    <Borders>
                        <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="2"/>
                        <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="2"/>
                        <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="2"/>
                        <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="2"/>
                    </Borders>
                </Style>
                <Style ss:ID="s33">
                    <Alignment ss:Vertical="Center"/>
                </Style>
            </Styles>
            <Worksheet ss:Name="Sheet1">
                <Table ss:ExpandedColumnCount="6" ss:ExpandedRowCount="34" x:FullColumns="1"
   x:FullRows="1" ss:DefaultRowHeight="14.5">
                    <Column ss:Width="92.5"/>
                    <Column ss:AutoFitWidth="0" ss:Width="96"/>
                    <Column ss:AutoFitWidth="0" ss:Width="66.5" ss:Span="1"/>
                    <Column ss:Index="5" ss:Width="58"/>
                    <Column ss:Width="63.5"/>

                    <Row>
                        <Cell>
                            <Data ss:Type="String">ORDER ID</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='ID'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>

                    <Row ss:Index="2">
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">CUSTOMER INFO</Data>
                        </Cell>
                        <Cell ss:Index="6" ss:StyleID="s16">
                            <Data ss:Type="String">AKONI LOGO</Data>
                        </Cell>
                    </Row>
                    
                    <Row>
                        <Cell>
                            <Data ss:Type="String">NAME</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Account Name'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                        <Cell ss:Index="6">
                            <Data ss:Type="String">AKONI INFO</Data>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell>
                            <Data ss:Type="String">ID</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Account External ID'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">BILLING INFO</Data>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">Bill to Name</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Bill to Name'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">Bill to Address</Data>
                        </Cell>
                    </Row>
                    <xsl:for-each select="//Header/Column">
                        <xsl:if test="Name='Bill to Address'">
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                            Street:
                                        </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/Street" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    City:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/City" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    State:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/State" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    Zip Code:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/ZipCode" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    Country:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/Country" />
                                    </Data>
                                </Cell>
                            </Row>
                        </xsl:if>
                    </xsl:for-each>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">Bill to Phone</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Bill to Phone'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">SHIPPING INFO</Data>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">Ship to Name</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Ship to Name'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">Ship to Address</Data>
                        </Cell>
                    </Row>
                    <xsl:for-each select="//Header/Column">
                        <xsl:if test="Name='Ship to Address'">
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                            Street:
                                        </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/Street" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    City:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/City" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    State:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/State" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    Zip Code:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/ZipCode" />
                                    </Data>
                                </Cell>
                            </Row>
                            <Row>
                                <Cell ss:StyleID="s17">
                                    <Data ss:Type="String">
                                    Country:
                                </Data>
                                </Cell>
                                <Cell ss:MergeAcross="1">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="./Value/Country" />
                                    </Data>
                                </Cell>
                            </Row>
                        </xsl:if>
                    </xsl:for-each>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">Ship to Phone</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Ship to Phone'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">PHONE NUMBER</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Bill to Phone'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>



                    <Row>
                        <Cell ss:StyleID="s16">
                            <Data ss:Type="String">Account Vat</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='VAT'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>





                    <Row ss:Index="25">
                        <Cell>
                            <Data ss:Type="String">ASSIGNED SALES REP</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:if test="Name='Sales Rep Name'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row ss:Height="15">
                        <Cell>
                            <Data ss:Type="String">Currency</Data>
                        </Cell>
                        <Cell>
                            <xsl:for-each select="//Header/Column">
                                <xsl:variable name="ApiName" select="./@ApiName" />
                                <xsl:if test="$ApiName = 'Currency'">
                                    <Data ss:Type="String">
                                        <xsl:value-of select="Value"/>
                                    </Data>
                                </xsl:if>
                            </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row ss:Height="15.5">
                        <Cell ss:StyleID="s18">
                            <Data ss:Type="String">Name</Data>
                        </Cell>
                        <Cell ss:StyleID="s18">
                            <Data ss:Type="String">SKU Code</Data>
                        </Cell>
                        <Cell ss:StyleID="s18">
                            <Data ss:Type="String">Wholesale Price</Data>
                        </Cell>
                        <Cell ss:StyleID="s18">
                            <Data ss:Type="String">Currency</Data>
                        </Cell>
                        <Cell ss:StyleID="s18">
                            <Data ss:Type="String">Order QTY</Data>
                        </Cell>
                        <Cell ss:StyleID="s19">
                            <Data ss:Type="String">SUBTOTAL</Data>
                        </Cell>
                    </Row>
                    <xsl:for-each select=".//Line">
                        <Row ss:Height="15">
                            <xsl:for-each select=".//Column">
                                <xsl:variable name="ApiName" select="./@ApiName" />
                                <xsl:if test="$ApiName = 'ItemParentExternalID'">
                                    <Cell ss:Index="1" ss:StyleID="s20">
                                        <Data ss:Type="String">
                                            <xsl:value-of select="Value"/>
                                        </Data>
                                    </Cell>
                                </xsl:if>
                                <xsl:if test="$ApiName = 'ItemExternalID'">
                                    <Cell ss:Index="2"  ss:StyleID="s20">
                                        <Data ss:Type="String">
                                            <xsl:value-of select="Value"/>
                                        </Data>
                                    </Cell>
                                </xsl:if>
                                <xsl:if test="$ApiName = 'UnitPriceAfterDiscount'">
                                    <Cell ss:Index="3" ss:StyleID="s20">
                                        <Data>
                                            <xsl:attribute name="ss:Type">Number</xsl:attribute>
                                            <xsl:variable name="Value" select="Value" />
                                            <xsl:value-of select="number($Value)"/>
                                        </Data>
                                    </Cell>
                                </xsl:if>
                                <xsl:if test="$ApiName = 'UnitsQuantity'">
                                    <Cell ss:Index="5" ss:StyleID="s21">
                                        <Data>
                                            <xsl:attribute name="ss:Type">Number</xsl:attribute>
                                            <xsl:variable name="Value" select="Value" />
                                            <xsl:value-of select="number($Value)"/>
                                        </Data>
                                    </Cell>
                                </xsl:if>
                            </xsl:for-each>
                            <Cell ss:Index="4" ss:StyleID="s20">
                                <xsl:for-each select="//Header/Column">
                                    <xsl:if test="Name = 'Currency'">
                                        <Data ss:Type="String">
                                            <xsl:value-of select="Value"/>
                                        </Data>
                                    </xsl:if>
                                </xsl:for-each>
                            </Cell>
                            <Cell ss:Index="6" ss:StyleID="s21" ss:Formula="=RC[-1]*RC[-3]">
                                <xsl:attribute name="ss:Type">Number</xsl:attribute>
                            </Cell>
                        </Row>
                    </xsl:for-each>
                    
                    <Row ss:Height="15.5">
                        <Cell ss:Index="1" ss:StyleID="s20"></Cell>
                        <Cell ss:Index="2" ss:StyleID="s20"></Cell>
                        <Cell ss:Index="3" ss:StyleID="s20"></Cell>
                        <Cell ss:Index="4" ss:StyleID="s28">
                            <Data ss:Type="String">DISCOUNT</Data>
                        </Cell>
                        <Cell ss:Index="5" ss:StyleID="s28">
                        
                        <xsl:for-each select="//Footer/Column/Value/DiscountPercentage">
                                        <Data ss:Type="String">
                                            <xsl:value-of select="concat(Value,Name)"/>
                                        </Data>
                                </xsl:for-each>
                        
                        </Cell>
                        <Cell ss:StyleID="s28">
                                <xsl:for-each select="//Footer/Column/Value/Discount">
                                    
                                        <Data ss:Type="String">
                                            <xsl:value-of select="Value"/>
                                        </Data>
                                </xsl:for-each>
                        </Cell>
                    </Row>

                    <Row ss:Height="15.5">
                        <Cell ss:Index="1" ss:StyleID="s20"></Cell>
                        <Cell ss:Index="2" ss:StyleID="s20"></Cell>
                        <Cell ss:Index="3" ss:StyleID="s20"></Cell>
                        <Cell ss:Index="4" ss:StyleID="s28">
                            <Data ss:Type="String">TOTAL</Data>
                        </Cell>
                        <Cell ss:StyleID="s28" ss:Formula="=SUM(R[-{($ItemLinesCount)+1}]C:R[-2]C)">
                            <xsl:attribute name="ss:Type">Number</xsl:attribute>
                        </Cell>
                        <Cell ss:StyleID="s28">
                                <xsl:for-each select="//Footer/Column/Value/Totals">
                                
                                        <Data ss:Type="String">
                                            <xsl:value-of select="concat($CurrencySign,Value)"/>
                                        </Data>
                                </xsl:for-each>
                        </Cell>
                    </Row>
                    <Row ss:Height="15.5"/>
                    <Row ss:Height="15" ss:StyleID="s33">
                        <Cell ss:StyleID="s29">
                            <Data ss:Type="String">Order Remark</Data>
                        </Cell>
                        <Cell ss:MergeAcross="4" ss:StyleID="m303543680">
                            <xsl:for-each select="//Header/Column">
                                    <xsl:if test="Name = 'Order Remark'">
                                        <Data ss:Type="String">
                                            <xsl:value-of select="Value"/>
                                        </Data>
                                    </xsl:if>
                                </xsl:for-each>
                        </Cell>
                    </Row>
                </Table>
                <WorksheetOptions
                    xmlns="urn:schemas-microsoft-com:office:excel">
                    <PageSetup>
                        <Header x:Margin="0.3"/>
                        <Footer x:Margin="0.3"/>
                        <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
                    </PageSetup>
                    <Print>
                        <ValidPrinterInfo/>
                        <PaperSizeIndex>9</PaperSizeIndex>
                        <HorizontalResolution>300</HorizontalResolution>
                        <VerticalResolution>300</VerticalResolution>
                    </Print>
                    <Selected/>
                    <TopRowVisible>15</TopRowVisible>
                    <Panes>
                        <Pane>
                            <Number>3</Number>
                            <ActiveRow>33</ActiveRow>
                            <ActiveCol>6</ActiveCol>
                        </Pane>
                    </Panes>
                    <ProtectObjects>False</ProtectObjects>
                    <ProtectScenarios>False</ProtectScenarios>
                </WorksheetOptions>
            </Worksheet>
        </Workbook>
    </xsl:template>
</xsl:stylesheet>
