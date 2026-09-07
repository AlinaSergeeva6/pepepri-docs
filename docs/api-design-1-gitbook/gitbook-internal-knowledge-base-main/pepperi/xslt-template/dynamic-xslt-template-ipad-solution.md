# Dynamic XSLT template - iPad solution

With new updates of applications appeared issues with styles in IPad.

To avoid this, additional styles should be added.

Add new styles in this block:

```
@supports (-webkit-touch-callout: none) {
			/*iOS*/
			/*EXAMPLE*/
        *{
        font-size: 8px;
        }

        .mainTable{
        width:100%;
        }

        .splitter,
        .hb_splitter {
          font-size: 10px;
        }
        .item-info th,
        .hb_item-info th{
          font-size: 8px;
        }

        .item-info td,
        .hb_item-info td {
          font-size: 8px;
        }

        .footerName{
        font-size:8px;
        }

        .footerValue,
        .foterNameHb{
        text-align:right;
        font-size:8px;
        }

        .footerValueHb{
        text-align:left;
        font-size:8px;
        }

        #units-total,
        #interim,
        #total-sum{
        padding-left:40px;
        padding-right:40px;
        }
           
		  }
```

