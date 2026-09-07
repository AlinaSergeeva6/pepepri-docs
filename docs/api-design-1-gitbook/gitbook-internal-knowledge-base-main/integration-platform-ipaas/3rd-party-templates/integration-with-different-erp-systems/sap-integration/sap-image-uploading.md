---
description: >-
  The article describes the step by step process of configurating IPASS settings
  for uploading images from client's SAP server
---

# SAP Image Uploading

{% hint style="info" %}
Before working with IPAAS you need to install SAP Picture Exporter.&#x20;
{% endhint %}

### How to install SAP Picture Exporter.

1. Go to [https://integration.pepperi.com/mgr](https://integration.pepperi.com/mgr)
2. there is a "Tools" panel at the top, choose desktop applications
3. In opened window click on the dropdown menu for "SAP Business One" and Download "Sap Picture Exporter"
4. Extract the files and install the picture exporter to the client's server.



{% hint style="info" %}
In order to export the images, we will use **2 dataflow tasks**. The first one will create a csv file called 'images.csv' with item id and a path to the image of the item on client's server. The second dataflow task will trigger picture exporter app which will use 'images.csv' file within its folder to POST images on customer\`s server
{% endhint %}

{% hint style="info" %}
If you want to **reload all the images**, you should  remove 'uploaded.xml' file from picture exporter folder. This is the file which contains info about already uploaded items. You can explore it and modify if you want to **reload some specific image** - just remove its list element from file
{% endhint %}

### Configuration for the first dataflow task

{% tabs %}
{% tab title="Settings" %}
<figure><img src="../../../../.gitbook/assets/image (152).png" alt=""><figcaption></figcaption></figure>

1. **Listener\_**_**run**_**\_exe**  should contain the path for SAP listener on the client's server
2. **Staticfile** is a path to the final csv file with all the necessary data.
{% endtab %}

{% tab title="SQL" %}
```sql
select  
t0.ItemCode as item,
convert(varchar(200),t1.BitmapPath)+t0.PicturName as image_path_1
FROM  OITM t0, OADP t1
```
{% endtab %}

{% tab title="Details" %}
* **Application:** SAP Desktop Plugin
* **Source Object:** SAP - Generic Desktop SQL Export
* **Target Object:** Pepperi Export Images
{% endtab %}
{% endtabs %}

### Configuration for the second dataflow task

{% tabs %}
{% tab title="Settings" %}
<figure><img src="../../../../.gitbook/assets/image (180).png" alt=""><figcaption></figcaption></figure>

**Listener\_**_**run**_**\_exe**  should contain the path for SAP Image Exporter on the client's server
{% endtab %}

{% tab title="details" %}
* **Application:** SAP Desktop Plugin
* **Source Object:** SAP - Generic Desktop SQL Export
* **Target Object:** Store Data Table For Later Use
{% endtab %}
{% endtabs %}
