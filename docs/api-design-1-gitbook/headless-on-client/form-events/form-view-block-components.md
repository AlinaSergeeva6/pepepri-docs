---
description: form block view is the configuration of the layout of each block of the form.
---

# Form View Block Components

### TextBox Block View

```typescript
{
    "ViewType": "TextBox",
    "View": {
        Title: string
        FieldID: string 
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        FieldType: 'text' | 'link' | 'email' | 'phone' | 'duration' | 'int' | 'percentage' | 'currency' | 'real'
        MaxFieldCharacters?: number
        MinValue?: number
        MaxValue?: number
        Regex?: string
        RegexErrorMessage?: string
    }
}
```

### TextArea Block View

```typescript
{
    "ViewType": "TextArea",
    "View": {
        Title: string
        FieldID: string 
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        FieldType: 'textarea'        
        MaxFieldCharacters?: number
        RowSpan?: number
    }
}
```

### DropDown Block View

<pre class="language-typescript"><code class="lang-typescript"><strong>{
</strong>    "ViewType": "DropDown",
    "View": {
        Title: string
        FieldID: string 
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        FieldType: 'select' | 'multi-select'
        Options: { Key: string, Value: string }[]
        EmptyOption: boolean // defaut true
    }
}
</code></pre>

### CheckBox Block View

<pre class="language-typescript"><code class="lang-typescript"><strong>{
</strong>    "ViewType": "CheckBox",
    "View": {
        Title: string
        FieldID: string
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        FieldType: 'checkbox' | 'booleanText'
        AdditionalValue?: string // For booleanText usage need to JSON.stringify this object for ex. { CheckedText: ';)', UncheckedText: ';(' }
    }
}
</code></pre>

### Date Block View

```typescript
{
    "ViewType": "Date",
    "View": {
        Title: string
        FieldID: string
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        FieldType: 'datetime' | 'date'
        MinDateValue?: Date
        MaxDateValue?: Date
    }
}
```

### QuantitySelector Block View

```typescript
{
    "ViewType": "QuantitySelector",
    "View": {
        Title: string
        FieldID: string 
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        AllowDecimal: boolean
        StyleType?: PepStyleType
    }
}
```

### Button Block View

```typescript
{
    "ViewType": "Button",
    "View": {
        Key: string
        Title: string
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        Value: string;
        StyleType?: PepStyleType
        SizeType?: PepSizeType
        IconName?: string
        IconPosition?: 'start' | 'end'
    }
}
```

### Separator Block View

```typescript
{
    "ViewType": "Separator",
    "View": {
        Title: string
        Alignment?: 'left' | 'right' | 'center' // default left
    }
}
```

### JSON Editor Block View

<pre class="language-typescript"><code class="lang-typescript"><strong>{
</strong>    "ViewType": "JsonEditor",
    "View": {
        Title: string
        FieldID: string
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        JsonData: any
    }
}
</code></pre>

### Form Block View

<pre class="language-typescript"><code class="lang-typescript"><strong>{
</strong>    "ViewType": "JsonEditor",
    "View": {
        Title: string
        FieldID: string
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        FormKey: string,
        MappedParameters: any
    }
}
</code></pre>

### List Block View

<pre class="language-typescript"><code class="lang-typescript"><strong>{
</strong>    "ViewType": "JsonEditor",
    "View": {
        Title: string
        FieldID: string
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        ListKey: string;
        ListContainer?: ListContainer;
        MappedParameters: any;
    }
}
</code></pre>

### Resource Block View

<pre class="language-typescript"><code class="lang-typescript"><strong>{
</strong>    "ViewType": "Resource",
    "View": {
        Title: string
        FieldID: string
        Mandatory: boolean // default false
        Readonly: boolean // default false
        RenderTitle: boolean // default true
        DefaultValue: any,
        IsArray: boolean,
        Options: { Key: string, Value: string }[],
        EmptyOption: boolean // defaut true
    }
}
</code></pre>
