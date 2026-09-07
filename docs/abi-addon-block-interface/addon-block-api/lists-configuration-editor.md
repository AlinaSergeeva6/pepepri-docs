---
description: ABI component for list configuration.
---

# Lists configuration editor

name = ListConfigurationEditor

## host object properties

* draft : ListDraft
*   ~~menuBlocksRelationNames?: string\[]~~&#x20;

    Deprecated in favor of `options.menuBlocksRelations`
*   ~~lineMenuBlocksRelationNames?: string\[]~~

    Deprecated in favor of `options.lineMenuBlocksRelations`
*   options?: object

    ```typescript
    {
        allowPublish: boolean,
        allowAddProfile: boolean
        menuBlocksRelations?: {
            // the relation name
            name: string,

            // an array of MenuAvailableBlockKeys to include
            // undefined includes all keys
            include: string[] | undefined
            
            // an array of MenuAvailableBlockKeys to exclude
            exclude: string[] | undefined
        }[] | undefined,
        lineMenuBlocksRelations?: {
            // the relation name
            name: string,

            // an array of LineMenuAvailableBlockKeys to include
            // undefined includes all keys
            include?: string[]
            
            // an array of LineMenuAvailableBlockKeys to exclude
            exclude?: string[] 
        }[]
    }
    ```



<pre class="language-typescript"><code class="lang-typescript">export interface ListDraft extends <a data-footnote-ref href="#user-content-fn-1">Draft</a>{
    Data: List
    Profiles: {Key: string, Data: Partial&#x3C;List>}[]
}
</code></pre>

## host events

event which is fired by the lists settings component. the event has two optional actions, 'on-save', 'on-cancel

```typescript
// 'on-save' action is fired when the user click the Update button. 
// the 'data' property contains the list that have been configured by the component.
hostEvents.emit({    
	'action': 'on-save',
	'data': {
		'draft': ListDraft
	}
})
// 'on-cancel' action is fired when the user click the Cancel button. 
hostEvents.emit({    
	'action': 'on-cancel',
})
```

[^1]: look at drafts section
