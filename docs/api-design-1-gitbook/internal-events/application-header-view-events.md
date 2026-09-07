# Application Header View Events

## Events&#x20;

#### OnClientAppHeaderLoad

#### EventData

<pre><code>{} - empty object 

The on load event will take the header slug from the mapping. 
If not exists: return default header. 

<a data-footnote-ref href="#user-content-fn-1">Default header</a> contain the default buttons (Settings, SystemAvatar, 
Support, Announcekit, Notification - only if has notification mapping in slug)
</code></pre>

#### Event Result

```json
{
    "SyncButtonData": {

        // When the button is pressed use this key in the
        // OnClientAppHeaderButtonClick
        "ButtonKey": "",
        
        // Whether to show the button
        "Visible": true|false,

        // the number of changed objects not synced
        // When this is > 0 the client will draw the 
        // indciation on the button
        "ChangeObjects": 0,
        
        // In Progess the client spins the icon
        // Error??
        "SyncStatus": "InProgress"|"Error"|"Success"
    },
    
    "Buttons": [
        {
            // When the button is pressed use this key in the
            // OnClientAppHeaderButtonClick
            "Key": ""
            // to use when the clients want to check witch button was clicked 
            // or any others checks
            // could be:
            //     1. 'Notification': will open the notification addon dialog (in ABI)
            //     2. 'Settings': will navigate to settings home page.
            //     3. 'SystemAvatar': will open a menu with logout & change password
            //     4. 'Support': will open new window/tab with pepperi train center
            //     5. 'Announcekit': will open announcekit plugin.
            //     6. 'Regular': do nothing - Prepares for air conditioner :-)
            
            "Type": "Announcekit" 
            
            // The Button icon
            "Icon": {
                "Type": "System",
                "Name": "bell"
            }
            
            "Badge": {
                "Visible": true/false,
                "Title": ""
            }
            
            // Whether to show the button
            "Visible": true|false,
            
            "Enabled": true|false,
        }
    ],
    
    "MenuButtonData": {
        // Whether to show the button
        "Visible": true|false,

        "Header": {
            // Whether to show the button
            "Visible": true|false,
            
            // usually will be last sync time
            "Title": ""
        },
        // used for the UI drawing 0 is main menu , 1 - his child ...
        "HierarchyLevel":  0|1|2,
        
        "Items": [
            {
                "Key": "",
                "Type": "Button",
                "Title": "Hello",
                "Visible": true|false,
                "Enabled": true|false, 
            },
            {
                "Type": "Seperator",
                "Title": "Hello",
                "Visible": true|false,
                "Enabled": true|false,
            },
            {
                "Type": "Group",
                "Title": "Halo",
                "Visible": true|false,
                "Enabled": true|false,
                "Items" : [
                    {
                        "Type": "Button",
                        "Title": "Hello",
                        "Visible": true|false,
                        "Enabled": true|false,
                    },
                    {
                        "Type": "Group",
                        "Title": "",
                        "Visible": true|false,
                        "Enabled": true|false,
                        "Items" : [
                        ]
                    }
                ]
            }
        ]
    },
    
    // A action for the header component to perform
    // Optional
    "Action": {
        "Type": "OpenNotification" | "OpenAnnouncementKit",
        "Data": {}
    }
    
    "Theme": {
        "BottomBorder": {
            "Opacity": integer // 0 - 1 (0 is transparent). default: 1
            "Use": boolean // use border or not.  default: false
            "Value": string // (user-primary , secondary .... ). default: 'system'
        },
        "Color": {
            "ColorName": string // (user-primary , secondary .... ). default: 'system invert'
            "ColorValue": string // rgb or grba
            "Style": string // 'weak','weak-invert','regular','strong'. default: weak
         },
         "Shadow": {
             "Intensity": string // 'soft','regular'. 'hard' , default: hard
             "Size": string // 'xs','sm','md'. default: md
              "Use": boolean // use shadow or not. default: false
         },
         "BrandingLogoSrc": string, // return pepperi default when null
         "FaviconSrc": string   // return pepperi default when null
    }
}

```

#### OnClientAppHeaderButtonClick&#x20;

#### EventData

```
{
    // The key of the button pressed
    "ButtonKey": ""
}
```

#### EventResult

Same as the OnClientAppHeaderLoad event

[^1]: 
