---
description: This is a template example
---

# OnClientExampleOperation

## General

Computing the color of the block based on number of activities performed by the user today, if it is below the defined number it will return "red". In case it is the middle of the day, and the number of activities is less than 50% an alert will be presented to the user

## Input

```typescript
{
   "ExampleKey":"aaa-aaa"
}
```

## Output&#x20;

```typescript
{
    "Color":"red"|"greetypen"
}
```



## UserFlows

### before computing color

can decide to disable the middle of the day alert &#x20;

### before returning the result&#x20;

override the default business logic&#x20;
