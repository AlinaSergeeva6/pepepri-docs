# Lists Client Events

## Introduction

the lists addons is an headless service that communicate with the client side using events mechanism.

Every event provides at the ListState object and returns the ListContainer object. Both objects can be sent partially. The only mandatory field is the list key

the resource views addons support the following client events

### OnClientListLoad

Triggered only once when the page is loaded, Changes object must contain ListKey

Input:  { State: ListState, Changes: Partial\<ListState>, List?: List }

Output: ListContainer&#x20;

### OnClientListStateChange

Triggered every time the user is manipulating the list state by changing search params, scrolling data etc... every action that changes the ListState Object will fire this event\
ListState must contains ListKey and ViewKey\
input: { State: ListState, Changes: Partial\<ListState>, List?: List }\
output: ListContainer

### OnClientListButtonClick

triggered on every menu click/line menu click/ button click. needs to supply also to the state the key of the menu block that was clicked.\
Line menu's actions will use the objects in the \`ItemSelection\` in the \`ListState\`\
input: {State: ListState, ButtonKey: string, List?: List }\
output:  ListContainer



#### ListState

data that represents list state, it is part of the pepperi deep link and page parameters

```typescript
//2 events, 
/**
*/
export interface ListState {
        ListKey: string;
        ViewKey?: string; // default use the first
        SearchString?: string; // default no search 
        SmartSearchQuery?: JSONFilter; //default no search
        Sorting?: ListSorting; // default CreationDateTime, Ascending = false
        PageSize?: number //default = 100
        PageIndex?: number; // default = 1 (first page)
        PagerType: ListPagerType; //by default pages
        ItemSelection?: ListItemSelection; // default Items is empty array and SelectAll is false,
        RecycleBinMode?: boolean;
        DynamicFilter?: JSONFilter; //used to filtering dynamically, if you update it at runtime you probably also want to send refresh action. 
        Parameters?: {}; // key-value map of values for the list parameters
        ContainedResourceList: any[] // The data objects of the contained resource list
}

interface ListSorting {
    FieldID: string;
    Ascending: boolean;
}

interface ListPagerType = 'Scroll' | 'Pages';

/*
    Items is limited to 500 elements
    when select all is true the items will be the non selected items, when selectAll false the items will be the selected items 
*/
interface ListItemSelection {
    SelectAll: Boolean; // default false 
    Items: string[];
}
```

#### ListContainer

Contains all the data requires the client to draw a generic list

<pre class="language-typescript"><code class="lang-typescript"><strong>export interface ListContainer {
</strong><strong>    Layout?: Partial&#x3C;ListLayout>;
</strong><strong>    Data?: ListData;
</strong><strong>    State?: Partial&#x3C;ListState>;
</strong><strong>    List?: ListConfiguration;
</strong><strong>    Actions?: ListAction[]
</strong><strong>}
</strong><strong>
</strong><strong>export interface ListData {
</strong>    Items: ListRowData[];
    Count?: number
}

<strong>
</strong><strong>export interface ListLayout {
</strong>    Title: string;
    ViewsMenu: ListLayoutViewsMenu;
    Menu: ListLayoutMenu;
    LineMenu: ListLayoutMenu;
    Search: ListLayoutSearch; 
    SelectionType: ListSelectionType;
    SmartSearch: ListSmartSearch; // if empty array we will hide the smart search
    Sorting: ListSorting;
    View : ListLayoutView;
}

interface ListLayoutViewsMenu {
    Visible: boolean;
    Items: {Key: string, Value: string}[];
}

interface ListLayoutMenu {
    Items: ListLayoutMenuItem[];
}

interface ListLayoutMenuItem {
    Key: string; // The ButtonKey to send in the OnClientListButtonClick event
    Title: string; // The title to draw in the menu
    ButtonStyleType?: ButtonStyleType; // when this exists and if there is place, 
                                       // draw the button in the top bar of the list
}

interface ListLayoutView {
    Type: ListViewType; //"Grid" | "Cards"
    ViewBlocks: ListFieldViewBlock[];
    Key: string;
    SortingFields: string[];
}

type ListFieldViewBlockType = 'Button' | 'Textbox'; // TBD

interface ListFieldViewBlock {
    FieldID: string; // the key of the property value in the RowData
    Type: ListFieldViewBlockType;
}

 // represent one row (i.e. one item)
 // the matching between block and property is done by the "key" 
 interface ListRowData {
     [key: string]: any;
 }
 
 interface ListLayoutSearch {
     Visible: boolean
 }
 
type ListViewType = "Grid" | "Cards";

</code></pre>

### IHeadlessEventsService

```typescript
interface IHeadlessEventsService {
    EmitOnClientListLoad(state: Partial<ListState> | undefined, changes: Partial<ListState>, list?: List) : Promise<ListContainer>
    EmitOnClientListStateChange(state: Partial<ListState>, changes: Partial<ListState>, list?: List): Promise<ListContainer>
    EmitOnClientListButtonClick(state: Partial<ListState>, key: string, list?: List, data?: PepSelectionData): Promise<ListContainer>
}
```

