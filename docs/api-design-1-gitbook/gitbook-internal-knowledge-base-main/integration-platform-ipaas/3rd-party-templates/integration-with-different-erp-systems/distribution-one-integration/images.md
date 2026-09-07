# Images

D1 supports image retrieval and image assignment through the Image API.

The API can be used to:

* fetch item images
* fetch customer images
* assign images to records
* retrieve thumbnails

### Supported Record Categories

The following record categories are supported:

| Category   | Description         |
| ---------- | ------------------- |
| item       | Inventory item      |
| customer   | Customer record     |
| it\_note   | Inventory item note |
| it\_tree   | Item category tree  |
| it\_prodln | Product line        |
| it\_majcls | Major class         |
| ord\_note  | Order note          |
| shipto     | Customer ship-to    |

### Fetch Image Endpoint

```
GET /distone/rest/service/image/fetch
```

### Required Parameters

| Parameter | Description     |
| --------- | --------------- |
| category  | Record category |
| key       | Record key      |

### Optional Parameters

| Parameter   | Description          |
| ----------- | -------------------- |
| max\_width  | Maximum image width  |
| max\_height | Maximum image height |

### Example Request

```
/distone/rest/service/image/fetch?category=item&key=ABC123
```

### Example Response

```
{  "category": "item",  "key": "ABC123",  "encoding": "image/png;base64",  "image": "iVBORw0KGgoAAA..."}
```

### Thumbnail Endpoint

D1 also supports thumbnail retrieval.

### Endpoint

```
POST /distone/rest/service/image/thumbnails
```

### Notes About Images

The D1 Image API returns images in Base64 format.

In one client implementation, images were intentionally not extracted directly through the API because:

* the image catalog was large
* Base64 responses increased payload size
* performance was affected

Instead, FTP/SFTP image synchronization was used.

### Recommendation

#### Use the API When

* the image catalog is small
* images are needed on demand
* real-time image retrieval is required

#### Use FTP/SFTP When

* there are many item images
* images are large
* bulk synchronization is required

### Assign Image Endpoint

D1 also supports uploading images to records.

### Endpoint

```
POST /distone/rest/service/image/assign
```

### Required Parameters

| Parameter | Description             |
| --------- | ----------------------- |
| category  | Record category         |
| key       | Record key              |
| image     | Base64 image            |
| overwrite | Optional overwrite flag |

### Example Request Body

```
{  "category": "item",  "key": "ABC123",  "image": "iVBORw0KGgoAAA...",  "overwrite": true}
```

### Example Response

```
{  "category": "item",  "key": "ABC123",  "assigned": true}
```

### Notes

For Pepperi implementations, image synchronization strategy should be selected based on:

* catalog size
* expected sync frequency
* performance requirements
* customer infrastructure

{% hint style="info" %}
For large implementations, FTP/SFTP is usually preferred over Base64 API extraction.
{% endhint %}
