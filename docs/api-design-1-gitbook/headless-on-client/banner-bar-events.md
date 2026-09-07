---
description: >-
  Banners that are designed with Text & Icon or Image and have the ability to
  run flows on onLoad & when Clicked
---

# Banner bar events

#### Events&#x20;

### BlockLoadEndpoint&#x20;

Give the ability to change the configuration object based on Profile / User / Day of the week and every thing else.&#x20;

This endpoint is called before the page is loaded.\
Checks if there is on load Flow --> if so, runs it.

#### Input

```javascript
{
}
```

#### Output

```json
   Return the configuration object with manipulation (or not)
   {
   "BannerConfig": {
      "Structure": {
         "MaxColumns": number,
         "Gap": PepSizeType, // 'xs' | 'sm' | 'md'...
         "Padding": PepSizeType, // 'xs' | 'sm' | 'md'...
         "BorderRadius": PepSizeType, // 'xs' | 'sm' | 'md'... | 'none'
      },
      "OnLoadFlow": FlowObj // convert into base64 string 
      
   },
   "Banners": [{
         "id": number,
         "FirstTitle": {
            "Use": boolean,
            "Label": string,
            "Style": 'body' | 'heading',
            "Size": PepSizeType, // 'xs' | 'sm' | 'md'...
         },
         "SecondTitle": {
            "Use": boolean,
            "Label": string,
            "Style": 'body' | 'heading',
            "Size": PepSizeType, // 'xs' | 'sm' | 'md'...
         },
         "Style": 'weak' | 'weak-invert' | 'regular' | 'strong',
         "Color": 'system-primary' | 'dimmed' | 'invert' | 'strong'
         "Icon": {
            "UseIcon": boolean,
            "Position": 'start' | 'end',
            "Url": string
         },
         "ClickedArea": 'banner' | 'first-title' | 'second-title',
         "UseFlow": boolean,
         "Flow": FlowObj // convert into base64 string   
      }]
}
    
    
```

### BlockButtonClickEndpoint&#x20;

This endpoint is called when banner clicked.\
Checks if there is a Flow connected to this button --> if so, runs it.

#### Input

```
{
    ButtonKey: number
}
```

#### Output

```markup
return the same configuration object as BlockLoadEndpoint
```
