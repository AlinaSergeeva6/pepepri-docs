---
description: >-
  In this example is described Dataflow task 'Generic Cloud Internal Connector -
  FTP Image Uploader' in Integration Account 'Integration Examples'
---

# Upload Images From FTP

{% tabs %}
{% tab title="Step #1" %}
create new dataflow task:

![](../../.gitbook/assets/image2.png)
{% endtab %}

{% tab title="Step #2" %}
Define the following settings (on general - or per task)

![](../../.gitbook/assets/image1.png)
{% endtab %}

{% tab title="step #3 - Optional Features" %}
**feature #1 : In case you want to upload image to different level (1-6)  you can name the file with underscore and the image level \<item id>\_1.jpg**

**feature #2 : you can change the image level separator which is by default underscore to other string using the settings field name:   `ftp_image_upload_level_seperator`**

**feature #3 : you can set the default image level using this settings field: `ftp_image_upload_level`**

**feature #4 : in case the images names are not the ExternalID of the item - you can do "join" with another task with any condition supported by the join tab and get the item ExternalID  - the image level can be used in combination with the join - and the file should contain at least 2 columns:**

1. `image_file_name  (the image name in the FTP folder)`
2. `item_id  (the item ExternalID)`

### file used for join:

![](<../../.gitbook/assets/image (470).png>)

### ftp folder:

![](<../../.gitbook/assets/image (442).png>)

### **join settings:**

![](<../../.gitbook/assets/image (196).png>)


{% endtab %}
{% endtabs %}

{% hint style="info" %}
sy&#x73;_&#x6C;ast\_image\_upload  in settings  - is read only like other sys_ settings - it shows the last time all images were synced - only files with a newer date will be synced again
{% endhint %}

In this example is described Dataflow task 'Upload Images from FTP' in Integration Account 'Integration Examples'
