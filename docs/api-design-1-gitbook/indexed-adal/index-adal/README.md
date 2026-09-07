---
description: Extension for the ADAL type Data
---

# Index -ADAL

#### Phase 1 - only PFS and UDC will be supported

When creating schemes of type data, now you  index the fields by mark them with Indexed=true (see [pepperi-resource-schema](../../pepperi-resource-schema/ "mention"))

The type data will stay as it is today if no fields will be marked as indexed, **but** if at lease one field will be indexed  - filtering and sorting of data will allowed only on the indexed fields (otherwise - an exception will be thrown)
