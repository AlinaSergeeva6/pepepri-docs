---
description: >-
  List actions are used in order to invoke some actions on the list after menu
  clicked list event.
---

# List Actions

### ListAction

```typescript
interface ListAction{
    Type: string,
    Data: Object
}
```

The way to tell the lists addon to invoke some action after menu clicked event is simply by returning the action from the executeURL of that specific menu block.

Examples:

let assume we want to implement delete menu block, so we will provide the execute url for this menu block. because we are deleting items we want the list to refresh(otherwise the user will see the deleted item in the list).\
so we will return in the listContainer object an Action object that tells the list to refresh.

```typescript
router.post('/delete', async (req, res, next) => {
    //do some logic here in order to delete
    return res.json({
        Action: {
            Type: "Refresh",
            //there is no additional data that we need to supply for refresh, so we sending just a key
        }
    }
```

### Actions:

#### Refresh

```typescript
//this action will enforce the list to reload itself
{
    Type: "Refresh"
}
```

#### Export&#x20;

<pre class="language-typescript"><code class="lang-typescript">//this action will export the data of the list using dimx
{
    Type: "Export",
    Data: {
        ExportBody: <a data-footnote-ref href="#user-content-fn-1">DIMXExportAPIBody</a>
    }
}
</code></pre>

#### Import

<pre class="language-typescript"><code class="lang-typescript">//this action will import data to the resource using dimx
{
    Type: "Import",
    Data: {
        ImportBody: <a data-footnote-ref href="#user-content-fn-2">DIMXImportAPIBody</a>
    }
}
</code></pre>

#### ContainedResourceListChange

```typescript
//this action will import data to the resource using dimx
{
    Type: "ContainedResourceListChange",
    Data: {
        Objects: any[] // The Objects list to set
    }
}
```

[^1]: [#input](../data-import-export/file-export.md#input "mention")

[^2]: [#input](../data-import-export/recursive-file-import.md#input "mention")
