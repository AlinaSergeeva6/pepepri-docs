---
title: "Maps configuration"
description: "You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: “manage KendoMap”"
order: 209
---
# Maps configuration

*You can find existing solution in “Integration Examples” (6685) Pepperi integration platform account, UI task: “manage KendoMap”*

You can found js code in the attachment in the end of article.

**Goal**: This implementation makes possible to add a map to the page displaying the required address or addresses. For example, dealership / distribution centers, or sales stores, pick-up points, offices around the world, and so on.

You can add a map with markers by coordinates to the page using Kendo and get result like this:

![](/static/1-29.jpg)

Example of map

For changing zoom just put necessary value for "zoom" property in createMap function. Value can be in diapason from 1 to 19.

```
function createMap() {
            $("#map").kendoMap({
                center: [50.4317234, 30.4929412],
                zoom: 13,
```

In "markers" property you can found object like this:

```
{
 location: [50.4234696, 30.4933677],
 shape: "pinTarget",
 tooltip: {
            content: "Home" }
  }
```

where "**location**" - geolocation to be displayed; "**shape**" - shape of marker, "**content**" - name of your marker. Markers can be varied. For example, standard markers are "pin", "pinTarget", or you can create custom marker. For this just change “shape” ,for example, to “customMarker” and add it to the style:

```
<style>
    .k-map .k-i-marker-custom-marker {
      background-image: url('https://demos.telerik.com/kendo-ui/content/dataviz/chart/images/sunny.png');
      background-size: 30px;
      width: 30px;
      height: 30px;
    }
</style>
```

![](/static/2-21.jpg)

Example of markers

Also you can change the map positioning center in the property "center" by specifying the coordinates of the point of the desired point on the map.

If you want change type of map to “satellite image” you should replace "layers" to:

```
layers: [{type: "bing",
         imagerySet: "aerialWithLabels",
         // IMPORTANT: This key is locked to demos.telerik.com
         // Please replace with your own Bing Key
          key: "PT90GNrnG5Bqxg1PfopA~Beliai2bFxJQJPNp-d2orA~AprjUTzhdIWJ5RikqfABIFIMXmOsjE6p4KClZs6lbakU5WtN-ENqHtEHLVSwqMpa"
                }],
```

Result:

![](/static/3-15.jpg)

Example of satellite map

2KB

[KendoMap.txt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2Fdjn1LabMEEaKYxf4VsXI%2FKendoMap.txt?alt=media&token=75a64d87-4811-4e22-b60a-93d4f375c2bb)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-LfO_rsQzfnV957oTV_f%2Fuploads%2Fdjn1LabMEEaKYxf4VsXI%2FKendoMap.txt?alt=media&token=75a64d87-4811-4e22-b60a-93d4f375c2bb)

Example of code
