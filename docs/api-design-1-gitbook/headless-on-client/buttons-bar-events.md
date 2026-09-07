---
description: >-
  Buttons that are designed like Pepperi buttons with all our design options,
  such as badge , icon , sizes and color ....
---

# Buttons bar events

## Events&#x20;

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
   "ButtonsBarConfig": {
      "Structure": {
         "MaxColumns": number,
         "Gap": PepSizeType, // 'xs' | 'sm' | 'md'...
         "WidthType": WidthType, // 'dynamic' | 'set' | 'stretch'
         "Width": number,
         "Size": PepSizeType, // 'xs' | 'sm' | 'md'...
         "Aligment": {
            "Horizontal": 'left' | 'center' | 'right',
            "Vertical": 'start' | 'middle' | 'end'
         }
      },
      "OnLoadFlow": FlowObj // convert into base64 string 
      
   },
   "Buttons": [
      {
         "id": number,
         "Label": {
            "UseLabel": boolean,
            "Label": string
         },
         "Style": 'weak' | 'weak-invert' | 'regular' | 'strong',
         "Icon": {
            "UseIcon": boolean,
            "Position": 'start' | 'end',
            "Url": string
         },
         "Badge": {
            "UseBadg": boolean,
            "LinkBadge": string
         },
         "Flow": FlowObj // convert into base64 string   
      }
   ]
}
    
    
```

### BlockButtonClickEndpoint&#x20;

This endpoint is called when button is click.\
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
