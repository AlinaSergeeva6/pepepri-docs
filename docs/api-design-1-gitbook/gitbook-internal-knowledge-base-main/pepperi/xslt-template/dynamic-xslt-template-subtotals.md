# Dynamic XSLT template - SubTotals

By default, sub totals in the template are calculated for 2 fields:

![](<../../.gitbook/assets/1 (30).png>)

but if you need to add subtotals for other columns, then you need to write a little additional code in the existing template. This example will describe how to add subtotal for number, decimal with/without currency.

First, add a cell with a new amount to the subtotal line:

![](<../../.gitbook/assets/2 (23).png>)

then add this code:<br>

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

Result:<br>

![](<../../.gitbook/assets/3 (12).png>)

You can download the example here:

{% file src="../../.gitbook/assets/DynamicTemplateV_subTotals.xslt" %}
example of SubTotals
{% endfile %}
