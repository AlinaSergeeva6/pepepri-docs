# Gallery Events

## Events&#x20;

#### OnClientGalleryLoad

#### EventData

```javascript
{
    GalleryConfig: {
        OnLoadFlow: {
            FlowKey: string;
            FlowParams: [
                "Param1":{
                    "Type":  "dynamic",
                    "Value": "myBlockVariable"
                }
            ]
        }
        Gallery: Gallery = {
            MaxColumns: number = 2; // default num of cards
            Gap: PepSizeType = 'md'; // 'none' | 'sm' | 'md' | 'xl'
            FillHeight: boolean = false;
        },
        Text: Text = {
            Use: boolean = true;
            Position: textPositionStyling = 'overlaid'; // 'overlaid' | 'separated'
            VerticalAlign: verticalAlignment  = 'middle'; // 'start' | 'middle' | 'end'
            HorizontalAlign: PepHorizontalAlignment = 'center'; // 'left' | 'center' | 'right'
            GroupTitleAndDescription: groupTitleAndDescription = 'grouped'; // 'grouped' | 'ungrouped'

        },
        Card: Card = {
            Height: number = 16;
            TextColor: textColor = 'system-primary'; // 'system-primary' | 'dimmed' | 'invert' | 'strong'
            Border: PepColorSettings = {
                use: boolean = false;
                value: string;
                opacity: number;
            },
            DropShadow: PepShadowSettings = {
                    use: boolean;
                    size: PepSizeType; //// 'xs' | 'sm' | 'md' | 'xl'
                    intensity: PepShadowIntensityType; // 'soft' | 'regular' | 'hard';
            },
            UseRoundCorners: boolean = true;
            RoundCornersSize: PepSizeType = 'md'; // 'sm' | 'md' | 'lg' | 'xl'
        },
        Title: Title = {
            Use: boolean = true;
            Size: PepSizeType = 'lg'; //' 'sm' | 'md' | 'lg' | 'xl'
            Weight: FontWeight = 'regular'; // 'regular' | 'bold' | 'bolder'
            InnerSpacing: PepSizeType = 'sm'; // 'none' | 'sm' | 'md' | 'lg' | 'xl' 
            MaxNumOfLines: number = 1;
        },
        Description: Title = {
            Use: boolean = true;
            Size: PepSizeType = 'md'; //' 'sm' | 'md' | 'lg' | 'xl'
            Weight: FontWeight = 'regular'; // 'regular' | 'bold' | 'bolder'
            InnerSpacing: PepSizeType = 'sm'; // 'none' | 'sm' | 'md' | 'lg' | 'xl' 
            MaxNumOfLines: number = 1;
        },
        Overlay: PepColorSettings = {
            use: boolean = true;
            value: string = 'hsl(190, 100%, 50%)';
            opacity: number = 75;
        },
        GradientOverlay: PepColorSettings  = {
            use: boolean = true;
            value: string = 'hsl(0, 0%, 90%)';
            opacity: number = 75;
        }
    },
    Cards: [
            {
                Title: string = "Title";
                Description: string = "Description";
                AssetKey: string = '';
                AssetURL: string = '';
                Flow: {
                    FlowKey: string;
                    FlowParams: [
                        "param1":{
                            "Type":  "dynamic",
                            "Value": "myBlockVariable"
                        }
                    ]
            }
    ]

}
```

#### Event Result

```json
   Return the same object with manipulation (or not)
   for example: will return just 2 cards. or change buttons flow ....
```

#### OnClientGalleryCardClick&#x20;

Clicking a button will run a flow action that the user attached to the button

#### EventData

```
{
    // TODO - ADD FLOW PARAMS
}
```

#### EventResult

Same as the OnClientAppHeaderLoad event
