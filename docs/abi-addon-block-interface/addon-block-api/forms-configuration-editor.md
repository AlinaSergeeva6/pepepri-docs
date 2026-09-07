---
description: name=FormConfigurationEditor
---

# Forms Configuration Editor

## host object properties

{% hint style="info" %}
make sure that form field relations include the relations that hold the fields that already exists on the form.
{% endhint %}

* draft: FormDraft&#x20;
* [viewBlockRelationNames:](https://app.gitbook.com/o/-LUP1oYCM4aw4IDpwJDW/s/-LVCwP9BVdmHIds0xwia/~/changes/1748/addon-relations/addons-link-table/relation-names/form-layout-block) string\[] - relation names array that expose functions that returns the available blocks

<pre class="language-typescript"><code class="lang-typescript">export interface FormDraft extends <a data-footnote-ref href="#user-content-fn-1">Draft</a> {
    Data: Form
    Profiles: {Key: string, Data: Partial&#x3C;Form>}[]
}
</code></pre>

## host events

event which is fired by the forms component. the event has two optional actions, 'on-save', 'on-cancel

```typescript
// 'on-save' action is fired when the user click the Update button. 
hostEvents.emit({
	action: 'on-save'
	data: {
		draft: FormDraft // form defined in API of forms
	}
})

// 'on-cancel' action is fired when the user click the Cancel button. 
hostEvents.emit({
	action: 'on-cancel',
})
```

[^1]: look at drafts section
