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
		<xsl:variable name="ItemLinesCount" select="count(//Line)" />
		<xsl:variable name="HeaderLinesCount" select="count(//Header/Column)" />
		<xsl:variable name="WorksheetLinesCount" select="$ItemLinesCount + $HeaderLinesCount + 5" />
		<!--<xsl:variable name="WorksheetColumnsCount" select="count(//Line[@Type=1][1]//Column)" />-->
		<xsl:variable name="WorksheetColumnsCount" select="//Cart/@TotalColumnsCount" />
		<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
			<DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
				<Version>15.00</Version>
			</DocumentProperties>
			<OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
				<AllowPNG/>
			</OfficeDocumentSettings>
			<ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
				<WindowHeight>9375</WindowHeight>
				<WindowWidth>9705</WindowWidth>
				<WindowTopX>270</WindowTopX>
				<WindowTopY>615</WindowTopY>
				<ProtectStructure>False</ProtectStructure>
				<ProtectWindows>False</ProtectWindows>
			</ExcelWorkbook>
			<Styles>
				<Style ss:ID="Default" ss:Name="Normal">
					<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" ss:WrapText="1"/>
					<Borders/>
					<Font ss:FontName="Arial" x:CharSet="177" x:Family="Swiss" ss:Size="11"
    ss:Color="#000000"/>
					<Interior/>
					<NumberFormat/>
					<Protection/>
				</Style>
				<Style ss:ID="s1">
					<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" ss:WrapText="1"/>
					<Borders>
						<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
						<Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
						<Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
						<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
					</Borders>
					<Interior/>
				</Style>
				<Style ss:ID="s2">
					<Alignment ss:Horizontal="Center" ss:Vertical="Bottom" ss:WrapText="1"/>
					<Font ss:FontName="Arial" x:Family="Swiss" ss:Size="11" ss:Color="#000000"    ss:Bold="1"/>
				</Style>
				<Style ss:ID="totals">
					<Interior ss:Color="#BFBFBF" ss:Pattern="Solid"/>
				</Style>
				<Style ss:ID="splitter">
					<Alignment ss:Horizontal="Left" ss:Vertical="Bottom" ss:WrapText="1"/>
					<Borders>
						<Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
						<Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
					</Borders>
					<Interior/>
				</Style>
			</Styles>
			<Worksheet ss:Name="Sheet1">
				<Names>
					<NamedRange ss:Name="Print_Area">
						<xsl:attribute name="ss:RefersTo">
							<xsl:text>=Sheet1!R1C1:R</xsl:text>
							<xsl:value-of select="$WorksheetLinesCount" />
							<xsl:text>C</xsl:text>
							<xsl:value-of select="$WorksheetColumnsCount" />

						</xsl:attribute>
					</NamedRange>
				</Names>
				<Table x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="30" ss:DefaultRowHeight="14.25">

					<xsl:for-each select="//Line[@Type=1][1]//Column">									
						<xsl:if test="not(./@IsScale = 1)">
							<Column>
								<xsl:attribute name="ss:Width">
									<xsl:value-of select="./@width" />
								</xsl:attribute>	
							</Column>
						</xsl:if>							
					</xsl:for-each>		

					<!--Header-->
					<Row ss:AutoFitHeight="1">
						<Cell ss:StyleID="s2">
							<xsl:attribute name="ss:MergeAcross">
								<xsl:value-of select="$WorksheetColumnsCount - 1" />
							</xsl:attribute>
							<Data ss:Type="String">
								<xsl:value-of select="/Root/Title/Caption" />
							</Data>
						</Cell>
					</Row>
					<Row/>
					<xsl:for-each select="//Header/Column">
						<xsl:variable name="Type" select="./@Type" />												
						<Row ss:AutoFitHeight="1">
							<Cell>
								<xsl:choose>					
									<xsl:when test="$Type = 13">
										<xsl:attribute name="ss:MergeAcross">
											<xsl:value-of select="$WorksheetColumnsCount - 1" />
										</xsl:attribute>
										<xsl:attribute name="ss:StyleID">splitter</xsl:attribute>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="ss:MergeAcross">1</xsl:attribute>
									</xsl:otherwise>							
								</xsl:choose>
								<Data ss:Type="String">
									<xsl:value-of select="Name" />
								</Data>				
							</Cell>
							<xsl:choose>					
								<xsl:when test="$Type = 14">
									<Cell ss:MergeAcross="1">
										<Data ss:Type="String">
											<xsl:value-of select="./Value/Street" />
										</Data>
									</Cell>
									<Cell ss:MergeAcross="1">
										<Data ss:Type="String">
											<xsl:value-of select="./Value/City" />
										</Data>
									</Cell>
									<Cell ss:MergeAcross="1">
										<Data ss:Type="String">
											<xsl:value-of select="./Value/State" />
										</Data>
									</Cell>
									<Cell ss:MergeAcross="1">
										<Data ss:Type="String">
											<xsl:value-of select="./Value/ZipCode" />
										</Data>
									</Cell>
									<Cell ss:MergeAcross="1">
										<Data ss:Type="String">
											<xsl:value-of select="./Value/Country" />
										</Data>
									</Cell>
								</xsl:when>						
								<xsl:otherwise>
									<Cell ss:MergeAcross="1">
										<Data ss:Type="String">
											<xsl:value-of select="Value" />
										</Data>
									</Cell>
								</xsl:otherwise>							
							</xsl:choose>					
						</Row>

					</xsl:for-each>

					<Row ss:AutoFitHeight="1">
					</Row>

					<!--header columns-->	
					<Row ss:AutoFitHeight="1">
						<xsl:for-each select="(//Line[@Type=1])[1]/Column">									
							<Cell ss:StyleID="s1">
								<Data ss:Type="String">
									<xsl:if test="not(./@IsScale = 1)">
										<xsl:value-of select="./Name" />												
									</xsl:if>							
								</Data>
							</Cell>
						</xsl:for-each>		
					</Row>
					<!-- item lines -->
					<xsl:for-each select="//Line">							
						<xsl:choose>
							<xsl:when test="@Type = 2 and count(//Scales/Scale) &gt; 0">								
								<Row ss:AutoFitHeight="1">
									<xsl:variable name="ScaleID" select="./@ScaleID" />						
									<Cell ss:StyleID="s1">
										<xsl:attribute name="ss:MergeAcross">
											<xsl:value-of select="./@ColumnCount - 1" />
										</xsl:attribute>
										<Data ss:Type="String">
											<xsl:value-of select="//Scale[@ScaleID=$ScaleID]/@Name" />
										</Data>
									</Cell>
									<xsl:for-each select="//Scale[@ScaleID=$ScaleID]/Column">						
										<Cell ss:StyleID="s1">
											<Data ss:Type="String">
												<xsl:value-of select="Name" />
											</Data>
										</Cell>
									</xsl:for-each>								
								</Row>
							</xsl:when>
							<xsl:otherwise>		
								<Row ss:AutoFitHeight="1">

									<xsl:for-each select=".//Column">							

										<xsl:variable name="Type" select="./@Type" />						
										<xsl:variable name="IsScale" select="./@IsScale" />													
										<xsl:variable name="Value" select="Value" />													
										<xsl:variable name="ApiName" select="./@ApiName" />						

										<Cell ss:StyleID="s1">
											<Data>

												<xsl:choose>		
													<xsl:when	 test="$ApiName = 'UnitPriceAfterDiscount'">	
														<xsl:attribute name="ss:Type">Number</xsl:attribute>
													</xsl:when>
													<xsl:when	 test="$ApiName = 'TotalUnitsPriceAfterDiscount'">	
														<xsl:attribute name="ss:Type">Number</xsl:attribute>
													</xsl:when>
													<xsl:when	 test="$ApiName = 'UnitsQuantity'">	
														<xsl:attribute name="ss:Type">Number</xsl:attribute>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="ss:Type">String</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>	

												<xsl:choose>					
													<xsl:when test="$Type = 20">
														<img>
															<xsl:attribute name="src">
																<xsl:value-of select="Value" />
															</xsl:attribute>
														</img>
													</xsl:when>
													<xsl:otherwise>
														<xsl:call-template name="NumberToStandardFormat">
															<xsl:with-param name="inNumber" select="$Value" />
														</xsl:call-template>
													</xsl:otherwise>							
												</xsl:choose>
											</Data>
										</Cell>
									</xsl:for-each>			
								</Row>
							</xsl:otherwise>
						</xsl:choose>								
					</xsl:for-each>		

					<!--totals-->
					<Row ss:AutoFitHeight="1">
						<xsl:for-each select="(//Line[@Type=1])[1]/Column">									
							<xsl:variable name="ApiName" select="./@ApiName" />						
							<Cell ss:StyleID="totals">
								<xsl:choose>		
									<xsl:when	 test="$ApiName = 'TotalUnitsPriceAfterDiscount'">	
										<xsl:attribute name="ss:Formula">=SUM(R[-1]C:R[-<xsl:value-of select="$ItemLinesCount" />]C)</xsl:attribute>
										<Data>
											<xsl:attribute name="ss:Type">Number</xsl:attribute>
										</Data>
									</xsl:when>
									<xsl:when	 test="$ApiName = 'UnitsQuantity'">	
										<xsl:attribute name="ss:Formula">=SUM(R[-1]C:R[-<xsl:value-of select="$ItemLinesCount" />]C)</xsl:attribute>
										<Data>
											<xsl:attribute name="ss:Type">Number</xsl:attribute>
										</Data>
									</xsl:when>
									<xsl:otherwise>
										<Data>
											<xsl:attribute name="ss:Type">String</xsl:attribute>
										</Data>
									</xsl:otherwise>
								</xsl:choose>	
							</Cell>
						</xsl:for-each>
					</Row>

				</Table>

				<WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
					<PageSetup>
						<Layout x:Orientation="Portrait"/>
						<Header x:Margin="0.3"/>
						<Footer x:Margin="0.3"/>
						<PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
					</PageSetup>
					<FitToPage/>
					<Print>
						<FitHeight>100</FitHeight>
						<ValidPrinterInfo/>
						<Scale>50</Scale>
						<!-- stretch worksheet by this value (in percentage)  -->
						<HorizontalResolution>600</HorizontalResolution>
						<VerticalResolution>600</VerticalResolution>
					</Print>
					<Selected/>
					<ProtectObjects>False</ProtectObjects>
					<ProtectScenarios>False</ProtectScenarios>
					<ShowPageBreakZoom/>
				</WorksheetOptions>
				<PageBreaks xmlns="urn:schemas-microsoft-com:office:excel">
					<RowBreaks>
						<RowBreak>
							<Row>50</Row>
							<ColEnd>
								<xsl:value-of select="$WorksheetColumnsCount" />
							</ColEnd>
						</RowBreak>
					</RowBreaks>
				</PageBreaks>
			</Worksheet>
		</Workbook>


	</xsl:template>
</xsl:stylesheet>