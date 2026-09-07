---
description: The cpi-node scripts resource. Standard ADAL Resource.
---

# Scripts

## Get a list of CPI Node scripts

<mark style="color:blue;">`GET`</mark> `https://papi.pepperi.com/v1.0/scripts`

{% tabs %}
{% tab title="200: OK " %}
```javascript
[
    {
        // Standard Resource fields
        // CreationDateTime, ModificationDateTime, Hidden
    
        // UUID - created if none is sent
        "Key": "26d490a7-7e37-448e-b744-6e18998b0409",
        
        // display name
        "Name": "",
        
        // optional
        "Description": "",
        
        // mandatory
        // A Typescript module text that is compiled an run by the
        // scripts addon
        "Code": ""
    }
]
```
{% endtab %}
{% endtabs %}

## The Script code

The script code is an ES6 module (typescript or javascript?)\
The module must expose 2 function:

#### main

the main function to run when running the script

#### metaData

The script returns the function expected parameters and descriptions<br>

```typescript
interface ScriptParam {
    // the name of the parameter
    // the parameter will be sent to the script main function
    // eg. if Name='MyParam'
    // the param value will be sent in the data param as data.MyParam
    Name: string;
    
    // javascript types
    Type: 'string' | 'boolean' | 'number';
    
    // shown in the script picker
    Description: string;
    
    //  shown in the script picker
    DefaultValue?: any;
    
    // a set array of values to allow the user
    // to choose from in the action picker
    OptionalValues?: {
        Key: string;
        Value: string;
    }[];
}

interface ScriptMetaData {
    params: ScriptParams[]
}

async function metaData(): Promise<ScriptMetaData> {
    
}

async function main(data: any): Promise<any> {
}
```

## Run script

The Scripts addon exposes a cpi-side addon api endpoint for running scripts.



### Run a script

#### POST {CPAS\_BASE\_URL}/addon/api/scripts/:key/run

#### Request Body&#x20;

```json
{
    // the script params
    "Data": {}
}
```

#### Return body

```json
{
    "Result": {}
}
```
