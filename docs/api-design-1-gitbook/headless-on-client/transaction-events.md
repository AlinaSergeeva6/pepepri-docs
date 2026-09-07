---
description: The page contains all of pepperi's headless API's for transactions.
---

# Transaction events

## **OnClientTransactionStateChange**

The event is fired in the following cases:\
\- OrderCenter + Cart (depends the platform). search placeholder content edit, search request.\
\- OrderCenter + Cart. view change.\
\- OrderCenter + Cart. smart search filter addition/removal.\
\- OrderCenter. tab change.

## Input

```typescript
{
    PageType: PageType;
    TransactionKey: string;
    ListState: {
        ListKey: string;
        SearchState: {
            SearchString: string;
            SearchAll: boolean;
            FilterType: FilterType;
        };
        ViewState: {
            ViewType: ViewType;
            OrientationType: OrientationType;
        };
        FilterState?: {
            Title: string | null;
            ApiName: string | null;
            Type: FilterType | null;
            FieldType: UIControlFieldType | null;
            IsSecondary: boolean | null;
            Value: string | null;
            Value2: string | null;
            Values: string[] | null;
            IsFilterAddition: boolean;
        };
        TabState?: {
            TabKey: string;
            Title: string;
        };
    };
    Changes: {
        SearchState?: {
            SearchString: string;
            SearchAll: boolean;
            FilterType: FilterType;
        };
        ViewState?: {
            ViewType: ViewType;
            OrientationType: OrientationType;
        };
        FilterState?: {
            Title: string | null;
            ApiName: string | null;
            Type: UIControlFieldType | null;
            FieldType: FieldType | null;
            IsSecondary: boolean | null;
            Value: string | null;
            Value2: string | null;
            Values: string[] | null;
            IsFilterAddition: boolean;
        };
        TabState?: {
            TabKey: string;
            Title: string;
        };
    };
    WebApiLegacyRequest?: { // will be passed by the web app to support the legacy api
        URL: string, // the old web api URL, for example: OrderCenter/Transaction/ad2f8be9-d10a-4b77-a51a-eb8779374f37/Items/Search
        Body: object // the old body - for example: 
        /*
        {
            "CatalogUID": "ad2f8be9-d10a-4b77-a51a-eb8779374f37",
            "Top": 100,
            "ViewType": "OrderCenterView2",
            "OrderBy": "",
            "Ascending": true,
            "SearchText": "",
            "TabUID": "{\"BrandFilter\":0}",
            "SmartSearch": []
        }
        */
    }
}
```

Enumerations:

```typescript
enum PageType {
  OrderCenter = 8,
  OrderCenterMatrix = 9,
  Cart = 11,
}

enum FilterType {
  None = 0,
  Equals = 1,
  Contains = 2,
  SmallerThen = 3,
  BiggerThen = 4,
  Between = 5,
  DistinctValues = 6,
  Before = 7,
  After = 8,  
}

enum ViewType {
  Invalid = 0,
  UserHomePage = 1,
  UserHomePageQuickAction = 2,
  Catalog_Header = 3,
  Catalog_Menu = 4,
  Catalog_ItemCustCatalog = 5,
  Catalog_ItemCustCatalog_Landscape = 6,
  Catalog_ItemCustCatalogMedium = 7,
  Catalog_ItemCustCatalogSmall = 8,
  Catalog_ItemCustCatalogFilmstrip = 9,
  Catalog_ItemCustCatalogFilmstrip_Landscape = 10,
  Catalog_ItemCustCatalogVariants = 11,
  Catalog_ItemCustCatalogOneItem = 12,
  Catalog_ItemGridCatalog = 13,
  Catalog_ItemCustCatalogCard = 14,
  Catalog_ItemCust = 15,
  Catalog_ItemCust_Landscape = 16,
  Catalog_ItemCustMedium = 17,
  Catalog_ItemCustSmall = 18,
  Catalog_ItemCustFilmstrip = 19,
  Catalog_ItemCustFilmstrip_Landscape = 20,
  Catalog_ItemCustVariants = 21,
  Catalog_ItemGrid = 22,
  Catalog_ItemGridBarcode = 23,
  Catalog_ItemBarcodeCard = 24,
  Catalog_ItemFlatMatrix = 25,
  Catalog_ItemMatrix = 26,
  Catalog_ItemCustOneItem = 27,
  Catalog_ItemCustCard = 28,
  Catalog_ItemFlatMatrixCard = 29,
  Catalog_ItemChainGrid = 30,
  Catalog_SmartSearch = 31,
  Catalog_ItemShareInfo = 32,
  Catalog_AccountItemGrid = 33,
  Catalog_AccountItemCard = 34,
  Catalogs_CatalogCard = 35,
  Store_AccountCust = 36,
  Accounts_AccountCard = 37,
  Accounts_AccountNearMe = 38,
  Accounts_AccountMap = 39,
  Store_AccountsSmartSearch = 40,
  Accounts_AccountHeader = 41,
  Accounts_AccountNotifications = 42,
  ActivitiesButtons = 43,
  ActivityMenu = 44,
  AgentDashboardsMenu = 45,
  TransactionDashboard = 46,
  GA_ActivityCust = 47,
  GA_ActivityPlanningCust = 48,
  AL_ActivityList = 49,
  AL_ActivityList_SmartSearch = 50,
  GeneralActivities_ActivityPlanningCust = 51,
  OA_Cart_Menu = 52,
  OA_Cart_Header = 53,
  OA_Cart_FooterOpen = 54,
  OA_Cart_FooterClose = 55,
  OA_CartCustFlat = 56,
  OA_CartCustMatrix = 57,
  OA_OrderCenter_FooterClose = 58,
  OA_CartCustFlatCard = 59,
  OA_ItemInfoCust = 60,
  OA_ItemShareCust = 61,
  OA_CartCust_SmartSearch = 62,
  OA_OrderCust = 63,
  OA_OrderSummaryViewer = 64,
  OnlineAction_OA = 65,
  OA_OrderCustPdfForm = 66,
  OA_OrderCustFooterPdfForm = 67,
  OA_CartCustPdfForm = 68,
  Contacts_ContactCust = 69,
  Contacts_ContactCard = 70,
  GA_GeneralActivity_Menu = 71,
  Catalog_Views_Menu = 72,
  Catalog_Children_Views_Menu = 73,
  Catalog_Display_Mode_Views_Menu = 74,
  Cart_Views_Menu = 75,
  Account_AccountLocations = 76,
  Generic_Form = 77,
  OA_Cart_GridSetValue = 78,
  Generic_View = 79,
  Users_Smart_Search = 80,
  QATools_Transition_Card = 81,
  QATools_Transition_Form = 82,
  AccountDashboard_Upper_Customization = 83,
  AccountDashboard_Lower_Customization = 84,
  DateFilter = 85,
  Catalog_Top_Level_Filters_Menu = 86,
  Dummy_CurrencyFields = 87,
  OA_OrderBanner = 88,
}

enum OrientationType {
  Portrait = 0,
  Landscape = 1,
}

enum UIControlFieldType {
  None = 0,
  TextBox = 1,
  LimitedLengthTextBox = 2,
  TextArea = 3,
  TextHeader = 4,
  Date = 5,
  DateAndTime = 6,
  NumberInteger = 7,
  NumberReal = 8,
  Currency = 9,
  Boolean = 10,
  ComboBox = 11,
  MultiTickBox = 12,
  Separator = 13,
  Address = 14,
  Percentage = 15,
  EmptyComboBox = 16, //For Category, CPIPriceList, Special Price List (ComboBox Without Values)  
  InternalLink = 17,// for reps, Contacts, Locations & Catalogs
  Email = 18,
  LimitedDate = 19,
  Image = 20,
  MultiTickBoxToComboBox = 21,
  EmptyMultiTickBox = 22,
  Totals = 23,
  Attachment = 24,
  Signature = 25,
  Link = 26,
  ImageURL = 27, // hack for ImageURL in application logic (for portfolioItems, colors, brands)
  NumberIntegerQuantitySelector = 28, // hack for quantity selector in case of integer
  NumberRealQuantitySelector = 29, // hack for quantity selector in case of double
  NumberIntegerForMatrix = 30, // hack for integer in matrix
  NumberRealForMatrix = 31, // hack for double in matrix
  Images = 32, // hack for Images (for filmstrip and variants)
  Indicators = 33, // Indicators is like address (group field that conains boolean fields).
  CalculatedReal = 34,
  CalculatedInt = 35,
  CalculatedString = 36,
  CalculatedDate = 37,
  CalculatedBool = 38,
  MapDataDropDown = 39,
  MapDataReal = 40,
  MapDataString = 41,
  MapDataInt = 42,
  Sum = 43,
  Phone = 44,
  UrlForApi = 45,
  ManyToManyUrlForApi = 46,
  ReferenceType = 47,
  GuidReferenceType = 48,
  Button = 49,
  InternalPage = 50,// for Internal pages (parent -> details etc).
  Duration = 51,
  ListOfObjects = 52,
  Package = 53, // Package Quantity Selector
  RelatedObjectsCards = 54,
  BooleanText = 55,
  RichTextHTML = 56,
  Dictionary = 57
}

// the related view ui control names:
// note: only catalog views are supported in this scope
const uiControlTypeToCostumObjectTypeMap: { [key: string]: ViewType } = {
  "OrderCenterView1": ViewType.Catalog_ItemCustCard,
  "OrderCenterView2": ViewType.Catalog_ItemCustSmall,
  "OrderCenterView3": ViewType.Catalog_ItemCustMedium,
  "OrderCenterItemFullPageLandscape": ViewType.Catalog_ItemCust_Landscape,
  "OrderCenterItemFullPage": ViewType.Catalog_ItemCust,
  "OrderCenterFilmstripLandscape": ViewType.Catalog_ItemCustFilmstrip_Landscape,
  "OrderCenterFilmstrip": ViewType.Catalog_ItemCustFilmstrip,
  "OrderCenterVariant": ViewType.Catalog_ItemCustVariants,
  "OrderCenterFlatMatrixGrid": ViewType.Catalog_ItemFlatMatrix,
  "OrderCenterFlatMatrixLine": ViewType.Catalog_ItemFlatMatrixCard,
  "OrderCenterSplitFlatGrid": ViewType.Catalog_ItemChainGrid,
  "OrderCenterGrid": ViewType.Catalog_ItemGrid,
  "OrderCenterBarcodeGridline": ViewType.Catalog_ItemGridBarcode,
  "OrderCenterBarcodeLinesView": ViewType.Catalog_ItemBarcodeCard,
  "OrderCenterItemGridView": ViewType.Catalog_ItemGridCatalog,
  "OrderCenterItemDetails": ViewType.Catalog_ItemCustOneItem,
  "CatalogItemView1": ViewType.Catalog_ItemCustCatalogCard,
  "CatalogView2": ViewType.Catalog_ItemCustCatalogSmall,
  "CatalogView3": ViewType.Catalog_ItemCustCatalogMedium,
  "CatalogItemFullPageLandscape": ViewType.Catalog_ItemCustCatalog_Landscape,
  "CatalogItemFullPage": ViewType.Catalog_ItemCustCatalog,
  "CatalogFilmstripLandscape": ViewType.Catalog_ItemCustCatalogFilmstrip_Landscape,
  "CatalogFilmstrip": ViewType.Catalog_ItemCustCatalogFilmstrip,
  "CatalogItemDetails": ViewType.Catalog_ItemCustCatalogOneItem,
  "OrderCartGrid": ViewType.OA_CartCustFlat,
  "OrderCartView1": ViewType.OA_CartCustFlatCard,
  "OrderCartGrid": ViewType.OA_CartCustMatrix,
  "OrderMenu": ViewType.OA_Cart_Menu,
  "OrderVariantViewsMenu": ViewType.Catalog_Children_Views_Menu,
  "OrderDynamicViewsMenu": ViewType.Catalog_Display_Mode_Views_Menu,
  "OrderViewsMenu": ViewType.Catalog_Views_Menu,
  "OrderCenterClosedFooter": ViewType.OA_OrderCenter_FooterClose,
  "OrderCartClosedFooter": ViewType.OA_Cart_FooterClose,
  "OrderCartOpenedFooter": ViewType.OA_Cart_FooterOpen,
  "OrderCartHeader": ViewType.OA_Cart_Header,
  "OrderSummary": ViewType.OA_OrderSummaryViewer,
  "ItemShareInformation": ViewType.Catalog_ItemShareInfo,
  "SmartSearch": ViewType.Catalog_SmartSearch,
  "OrderCartItemForm": ViewType.OA_ItemInfoCust,
  "ItemShareInformation": ViewType.OA_ItemShareCust,
  "CatalogSelectionCard": ViewType.Catalogs_CatalogCard,
  "CatalogHeader": ViewType.Catalog_Header,
  "OrderBanner": ViewType.OA_OrderBanner,
  "AccountCard": ViewType.Accounts_AccountCard,
  "AccountHeader": ViewType.Accounts_AccountHeader,
  "AccountNotifications": ViewType.Accounts_AccountNotifications,
  "AccountSmartSearch": ViewType.Store_AccountsSmartSearch,
  "AccountToolbar": ViewType.ActivitiesButtons,
  "AccountMenu": ViewType.ActivityMenu,
  "ActivityForm": ViewType.GA_ActivityCust,
  "ActivityMenu": ViewType.GA_GeneralActivity_Menu,
  "ActivityPlanningCard": ViewType.GeneralActivities_ActivityPlanningCust,
  "UserHomePage": ViewType.UserHomePage,
  "UserHomePageQuickAction": ViewType.UserHomePageQuickAction,
  "AgentDashboardsMenu": ViewType.AgentDashboardsMenu,
};

```

## Output

\*\*\*\*\* need to be defined

### Legacy Web API Output

In web app, the web API will handle this event and will call the relevant URL and the result will be added to the event response.

````json
```json
{
  "Type": "Finish",
  "Data": {
    "WebApiLegacyResponse": {
      "ErrorCode": "S0000",
      "ErrorMessage": "",
      "Success": true,
      "Rows": [],
      "SearchCode": "%7b%22OrderID%22%3a%22ad2f8be9-d10a-4b77-a51a-eb8779374f37%22%2c%22ViewType%22%3a%22OrderCartGrid%22%2c%22Top%22%3a100%2c%22OrderBy%22%3a%22%22%2c%22Ascending%22%3atrue%2c%22SearchText%22%3a%22%22%2c%22SmartSearch%22%3a%5b%5d%7d",
      "SmartSearchList": [
        {
          "ApiName": "Image",
          "FieldType": 20,
          "Title": "Image",
          "Values": null
        },
        {
          "ApiName": "ItemExternalID",
          "FieldType": 1,
          "Title": "Item External ID",
          "Values": null
        },
        {
          "ApiName": "ItemMainCategory",
          "FieldType": 1,
          "Title": "Item Main Category",
          "Values": null
        },
        {
          "ApiName": "UnitsQuantity",
          "FieldType": 8,
          "Title": "Unit Quantity",
          "Values": null
        },
        {
          "ApiName": "TSANPMCalcMessage",
          "FieldType": 1,
          "Title": "NPMCalcMessage",
          "Values": null
        },
        {
          "ApiName": "TSANPMBaseUnitPriceAfter",
          "FieldType": 9,
          "Title": "NPMBaseUnitPriceAfter",
          "Values": null
        },
        {
          "ApiName": "TSANPMDiscountUnitPriceAfter",
          "FieldType": 9,
          "Title": "NPMDiscountUnitPriceAfter",
          "Values": null
        },
        {
          "ApiName": "TSANPMTaxUnitPriceAfter",
          "FieldType": 9,
          "Title": "NPMTaxUnitPriceAfter",
          "Values": null
        }
      ],
      "TotalRows": 0,
      "UIControl": { "Columns": 0, "ControlFields": [] }
    }
  }
}

```
````

### **OnClientTransactionButtonClicked**

Supported buttons:\
\- Cart\
\- ContinueOrdering

## Input

```json
{
    "TransactionKey": string, // e53f7f70-9979-4d4a-92dc-1fc5ae7417ed,
    "ButtonKey": string, // Cart | ContinueOrdering
}
```

## **Output**
none.

### **OnClientTransactionScopeItemButtonClicked**

Supported buttons:\
\- ItemInfo

## Input

```json
{
    TransactionKey: string, // e53f7f70-9979-4d4a-92dc-1fc5ae7417ed,
    ItemKey: string, // portfolioItemUUID
    ButtonKey: string, // ItemInfo,
    ListState: ListState // optional, used in webapp
}
```

## **Output**

none.


## Legacy Events

### **PreLoadTransactionScope**
```json
{
  "DataObject": {
    "UUID": "0225cee0-3705-4368-a49d-4c451c1c801e",
    "InternalID": -709,
    "Hidden": false,
    "Resource": "transactions",
    "TypeDefinition": {
      "UUID": "a7dc320b-a484-4b26-a8ef-0f24cd03b822",
      "InternalID": 320977,
      "Hidden": false,
      "Resource": "types",
      "Name": "Sales Order"
    },
    "ExternalID": "",
    "Status": 1000,
    "ActionDateTime": "2023-10-23T12:15:47.000Z",
    "Account": {
      "UUID": "e53f7f70-9979-4d4a-92dc-1fc5ae7417ed",
      "InternalID": 24106541,
      "Hidden": false,
      "Resource": "accounts",
      "TypeDefinition": {
        "UUID": "8e3d828f-04f4-4343-9cdd-4096bb7194eb",
        "InternalID": 320980,
        "Hidden": false,
        "Resource": "types",
        "Name": "Customer"
      },
      "Name": "A Paris Food",
      "Contacts": []
    },
    "Assignee": {
      "UUID": "907a3413-4e68-4d82-8849-d029c640d472",
      "InternalID": 13331753,
      "Hidden": false,
      "Resource": "users",
      "ExternalID": "",
      "Email": "guy.k@pepperi.com",
      "FirstName": "Guy",
      "LastName": "Klinger"
    },
    "Creator": {
      "UUID": "907a3413-4e68-4d82-8849-d029c640d472",
      "InternalID": 13331753,
      "Hidden": false,
      "Resource": "users",
      "ExternalID": "",
      "Email": "guy.k@pepperi.com",
      "FirstName": "Guy",
      "LastName": "Klinger"
    },
    "Lines": []
  }
}

```
### **OnLoadTransactionScope**
The same as PreLoadTransactionScope

### **SetFieldValue**
### **IncrementFieldValue**
### **DecrementFieldValue**
```json
{
  "FieldID": "UnitsQuantity",
  "Value": "6",
  "Save": true, // available only for SetFieldValue
  "UIObject": {
    "Key": "0_22_31",
    "DataObject": {
      "UUID": "00000000-0000-0000-0000-000000000000",
      "InternalID": 0,
      "Hidden": false,
      "Resource": "transaction_lines",
      "TypeDefinition": {
        "UUID": "a7dc320b-a484-4b26-a8ef-0f24cd03b822",
        "InternalID": 320977,
        "Hidden": false,
        "Resource": "types",
        "Name": "Sales Order"
      },
      "Children": []
    },
    "DataView": {
      "Type": "Grid",
      "Title": "",
      "Context": {
        "Object": { "InternalID": 320977, "Resource": "transactions" },
        "Name": "OrderCenterGrid",
        "ScreenSize": "Tablet",
        "Profile": {}
      },
      "ListData": {},
      "Fields": [
        {
          "FieldID": "ObjectMenu",
          "Type": "InternalLink",
          "Title": "Item Info",
          "Mandatory": false,
          "ReadOnly": false,
          "Layout": { "Origin": { "X": 0, "Y": 0 } },
          "Style": {
            "Alignment": { "Vertical": "Center", "Horizontal": "Stretch" }
          }
        },
        {
          "FieldID": "Image",
          "Type": "Image",
          "Title": "Image",
          "Mandatory": false,
          "ReadOnly": true,
          "Layout": { "Origin": { "X": 1, "Y": 0 } },
          "Style": {
            "Alignment": { "Vertical": "Center", "Horizontal": "Stretch" }
          }
        },
        {
          "FieldID": "ItemExternalID",
          "Type": "TextBox",
          "Title": "Item code",
          "Mandatory": false,
          "ReadOnly": true,
          "Layout": { "Origin": { "X": 2, "Y": 0 } },
          "Style": {
            "Alignment": { "Vertical": "Center", "Horizontal": "Stretch" }
          }
        },
        {
          "FieldID": "ItemName",
          "Type": "TextBox",
          "Title": "Name",
          "Mandatory": false,
          "ReadOnly": true,
          "Layout": { "Origin": { "X": 3, "Y": 0 } },
          "Style": {
            "Alignment": { "Vertical": "Center", "Horizontal": "Stretch" }
          }
        },
        {
          "FieldID": "ItemPrice",
          "Type": "Currency",
          "Title": "Retail Price",
          "Mandatory": false,
          "ReadOnly": true,
          "Layout": { "Origin": { "X": 4, "Y": 0 } },
          "Style": {
            "Alignment": { "Vertical": "Center", "Horizontal": "Stretch" }
          }
        },
        {
          "FieldID": "UnitsQuantity",
          "Type": "NumberReal",
          "Title": "Unit Quantity",
          "Mandatory": false,
          "ReadOnly": true,
          "Layout": { "Origin": { "X": 5, "Y": 0 } },
          "Style": {
            "Alignment": { "Vertical": "Center", "Horizontal": "Stretch" }
          }
        }
      ],
      "Columns": [
        { "Width": 10 },
        { "Width": 10 },
        { "Width": 10 },
        { "Width": 20 },
        { "Width": 10 },
        { "Width": 10 }
      ],
      "FrozenColumnsCount": 0,
      "MinimumColumnWidth": 0
    },
    "Fields": [
      {
        "Title": "Item Info",
        "FieldID": "ObjectMenu",
        "Value": "",
        "FormattedValue": "",
        "Readonly": false,
        "Mandatory": false,
        "Visible": true,
        "Accessory": "",
        "DecimalDigits": 2,
        "OptionalValues": [],
        "Highlighted": false,
        "TextColor": "",
        "BackgroundColor": "",
        "Events": {}
      },
      {
        "Title": "Image",
        "FieldID": "Image",
        "Value": "/var/root/Documents/Pepperi/30015076/Images/1Thumbnail/72419642.jpg",
        "FormattedValue": "/var/root/Documents/Pepperi/30015076/Images/1Thumbnail/72419642.jpg",
        "Readonly": true,
        "Mandatory": false,
        "Visible": true,
        "Accessory": "",
        "DecimalDigits": 2,
        "OptionalValues": [],
        "Highlighted": false,
        "TextColor": "",
        "BackgroundColor": "",
        "Events": {}
      },
      {
        "Title": "Item code",
        "FieldID": "ItemExternalID",
        "Value": "HT3001",
        "FormattedValue": "HT3001",
        "Readonly": true,
        "Mandatory": false,
        "Visible": true,
        "Accessory": "",
        "DecimalDigits": 2,
        "OptionalValues": [],
        "Highlighted": false,
        "TextColor": "",
        "BackgroundColor": "",
        "Events": {}
      },
      {
        "Title": "Name",
        "FieldID": "ItemName",
        "Value": "Wool Hat",
        "FormattedValue": "Wool Hat",
        "Readonly": true,
        "Mandatory": false,
        "Visible": true,
        "Accessory": "",
        "DecimalDigits": 2,
        "OptionalValues": [],
        "Highlighted": false,
        "TextColor": "",
        "BackgroundColor": "",
        "Events": {}
      },
      {
        "Title": "Retail Price",
        "FieldID": "ItemPrice",
        "Value": "23.0000",
        "FormattedValue": "$23.00",
        "Readonly": true,
        "Mandatory": false,
        "Visible": true,
        "Accessory": "$",
        "DecimalDigits": 2,
        "OptionalValues": [],
        "Highlighted": false,
        "TextColor": "",
        "BackgroundColor": "",
        "Events": {}
      },
      {
        "Title": "Unit Quantity",
        "FieldID": "UnitsQuantity",
        "Value": "0.0000",
        "FormattedValue": "0",
        "Readonly": false,
        "Mandatory": false,
        "Visible": true,
        "Accessory": "",
        "DecimalDigits": 0,
        "OptionalValues": [],
        "Highlighted": false,
        "TextColor": "",
        "BackgroundColor": "",
        "Events": {}
      }
    ],
    "Readonly": false
  },
  "DataObject": {
    "UUID": "00000000-0000-0000-0000-000000000000",
    "InternalID": 0,
    "Hidden": false,
    "Resource": "transaction_lines",
    "TypeDefinition": {
      "UUID": "a7dc320b-a484-4b26-a8ef-0f24cd03b822",
      "InternalID": 320977,
      "Hidden": false,
      "Resource": "types",
      "Name": "Sales Order"
    },
    "Children": []
  }
}

```
