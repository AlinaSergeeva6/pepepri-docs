---
title: "Dynamic XSLT template - SubTotals"
order: 300
---
# Dynamic XSLT template - SubTotals

By default, sub totals in the template are calculated for 2 fields:

![](https://alinasergeeva6.github.io/pepepri-docs/static/1-6.png)

but if you need to add subtotals for other columns, then you need to write a little additional code in the existing template. This example will describe how to add subtotal for number, decimal with/without currency.

First, add a cell with a new amount to the subtotal line:

![](https://alinasergeeva6.github.io/pepepri-docs/static/2-2.png)

then add this code:

```
    <script language="javascript">
                var arr = [],
                result = [];
                <xsl:for-each select = "//Line" >
                    <!--FILTERING BY PARAMETER-->
                    <!--<xsl:if test="./Column[@ApiName='ItemMainCategory']/Value!='Hats'">-->
                    <xsl:for-each select = "Column[@ApiName='TSAStockQuantity']" >
                        <xsl:if test="Value != '' and Value &gt; 0 ">
                            arr.push(Math.abs("<xsl:value-of select='Value'/>"));
                        </xsl:if>
                    </xsl:for-each>
                    <!-- </xsl:if>-->
                </xsl:for-each>
                arr.forEach(function(item, i, arr) {
                    result.push(parseInt(arr[i]));
                });
                var sum = result.reduce(function(a,b) { return a + b;}, 0);
                sum = String(sum);
                document.getElementById("stock-total").innerHTML = sum.replace(/\B(?=(\d{3})+(?!\d))/g, ",");

            </script>
```

Result:

![](https://alinasergeeva6.github.io/pepepri-docs/static/3-2.png)

You can download the example here:

54KB

[DynamicTemplateV\_subTotals.xslt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MPdpiQECgySbbQYuHyI%2F-MPdqplOzPG5tuBi_jwl%2FDynamicTemplateV_subTotals.xslt?alt=media&token=a3e8c5b8-e214-42a1-a501-7dcfb9467c80)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MPdpiQECgySbbQYuHyI%2F-MPdqplOzPG5tuBi_jwl%2FDynamicTemplateV_subTotals.xslt?alt=media&token=a3e8c5b8-e214-42a1-a501-7dcfb9467c80)

example of SubTotals
