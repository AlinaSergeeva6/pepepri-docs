---
title: "Special syntax in IPAAS"
order: 251
---
# Special syntax in IPAAS

### @@lines

This syntax can be used when loop over table or webhook has a place if you have multiple lines in source (loop\_over\_table) or you have more than one line in transaction you need to use it. For example, in webhook you need to POST array of lines like:

```
[
    {
        "ItemExternalID":"ItemExternalID1"
    },
    {
        "ItemExternalID":"ItemExternalID2"
    },
    {
        "ItemExternalID":"ItemExternalID3"
    }
]
```

So you can implement it using @@lines:

```
[
    @@lines
    {
        "ItemExternalID":"$#ItemExternalID#$"
    }
    @@lines
]
```

### $#ItemExternalID#$

This syntax can be used when you want to take source field and put it in some place of dataflow, for example in HTTP POST body. Also in this syntax some additional functions from [here](https://kbint.pepperi.com/integration-platform-general/integration-plugin-optional-formulas) are available

```
{
    "ExternalID": $#InternalID#$,
    "Status": 2,
    "ActionDateTime": "$#ActionDateTime#$",
    "DeliveryDate": "$#DeliveryDate#$",
    "Remark": "$#IIF(Remark=='','empty',Remark)#$"
}
```

### @*Image_URL*@

@\*\*@ syntax is relevant if you don\`t know if field exists or not. The most common situation is **Image** field. If this field is not empty, field **Image\_URL** will be generated. Otherwise field **Image\_URL** will not appear. In order to avoid errors, you need to use this syntax

You can combine it with previous one "**$#@\*Image\_URL\*@#$"**

### {#page_num#}

You can use this syntax for special constants inside integration platform. List of these constants could be found here

![](https://alinasergeeva6.github.io/pepepri-docs/static/image-278.png)

Info how to use it and what it means you can find here

[https://kbint.pepperi.com/integration-platform-general/integration-tasks-tabs#syntax-fields](https://kbint.pepperi.com/integration-platform-general/integration-tasks-tabs#syntax-fields)

### !%api_timeout%!

This syntax allows to take data from general/task settings

[https://kbint.pepperi.com/integration-platform-general/integration-tasks-tabs#setting-fields](https://kbint.pepperi.com/integration-platform-general/integration-tasks-tabs#setting-fields)
