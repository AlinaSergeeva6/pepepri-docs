---
description: >-
  Rich text is text that is formatted with common formatting options, such as
  bold and italics, that are unavailable with plain text.
---

# Rich Text events

## Events&#x20;

#### OnClientRichTextLoad

Give the ability to change the configuration object based on Profile / User / Day of the week and every thing else.&#x20;

#### Input

```javascript
{
    "OnLoadFlow": FlowObj // convert into base64 string 
    "RichText": "Hello World", // the string that we got from the editor
    "Structure": {
         "FillHeight": false;
         "Height": 5; // rem 
         "MaxWidth": 20; // rem
         "InnerPadding": 'sm'; // 'xs', 'sm', 'md'
                "Alignment": {
                    "Horizontal": "left", // 'left','center' or 'right'
                    "Vertical": "start" // 'start' | 'middle' | 'end' (still not in use)
                }; 
    }
}
```

#### Output

```json
   Return the OnLoad (configuration) object with manipulation (or not)
   for example: the RichText, Fillheight & Height properties has changed: 
   
   {
    "OnLoadFlow": FlowObj // convert into base64 string 
    "RichText": "Good morning", // the string that we got from the editor
    "Structure": {
         "FillHeight": true;
         "Height": 7; // rem 
         "MaxWidth": 20; // rem
         "InnerPadding": 'sm'; // 'xs', 'sm', 'md'
                "Alignment": {
                    "Horizontal": "left", // 'left','center' or 'right'
                    "Vertical": "start" // 'start' | 'middle' | 'end' (still not in use)
                }; 
    }
}
```

#### EventResult
