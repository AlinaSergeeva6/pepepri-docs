---
description: 'Effort Estimation: 8h'
---

# Integrating Package Promotions from SAP

{% hint style="info" %}
Allows creation of Package Promotions using integration with SAP instead of creating them manually in Pepperi.&#x20;
{% endhint %}

### Implementation details:&#x20;

Group of dataflow tasks:

* [**Promotions Get Items data**](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=79886) - get data from SAP;

<details>

<summary>Example of SQL: </summary>

```sql
SELECT
     T0.Code
     ,T0.Name
     ,T2.U_BOM "Discount"
     ,t1.Code
     ,t1.Quantity
	 ,t2.U_OPM_Status
	 ,t2.U_PROMOVIS
FROM
     SBO_IG_LIVE.dbo.OITT T0
     JOIN SBO_IG_LIVE.dbo.ITT1 T1 ON T0.Code=T1.FATHER
     JOIN SBO_IG_LIVE.dbo.OITM T2 ON T0.CODE=T2.ItemCode
Where
	T0.TreeType='S'
```



</details>

* [**Promotions Prepare Items data**](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=79895) **/** [**Promotions Prepare Quantity**](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=79974) - preparing data to be uploaded to Pepperi;
*   [**Promotions Export PPI UDT**](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=79888) - Prepare data and upload it to UDT 'PPI\_PackagePromotion\_Details'<br>

    <figure><img src="../.gitbook/assets/image (42).png" alt=""><figcaption></figcaption></figure>
* [**Promotions Export Package Item** ](https://integration.pepperi.com/mgr/PluginSettings/ClientTask?TaskId=79900)- export PPI item for each package.

<figure><img src="../.gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

**Tags**: Package Promotions, SAP, Integration.
