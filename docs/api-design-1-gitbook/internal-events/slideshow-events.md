# Slideshow Events

## Events&#x20;

### OnClientSlideshowLoad

#### EventData

```javascript
{
    SlideshowConfig: {
        OnLoadFlow: {
            FlowKey: string;
            FlowParams: [
                "myScriptParameter":{
                    "Type":  "dynamic",
                    "Value": "myBlockVariable"
                }
            ]
        }
        Structure: {
            Unit: HeightUnit = 'REM'; // 'REM' | 'VH'
            FillHeight: boolean = false;
            Height: string = '16';
            InnerPadding: PepSizeType = "md"; // 'xs' | 'sm' | 'md' | 'lg' | 'xl'
        };
        Transition: {
            Use: boolean = true;
            Duration: number = 5;
            Type: TransitionType = 'fade'; // 'none' | 'fade' | 'blur' | 'slide'
            Time: string = '0.75';
        };
        Arrows: {
            Use: boolean = true;
            Type: ArrowType = 'arrow_right'; // 'arrow_back_right' | 'arrow_right' | 'arrow_right_alt'
            Shape: ArrowShape = 'round'; // 'regular' | 'round'
            Style: PepStyleType= 'weak'; // 'weak' | 'weak-invert' | 'regular' | 'strong'
            Display: DisplayStates = 'show'; // 'show' | 'hide'
            Color: buttonColor= 'system'; // 'system-primary' | 'invert' | 'user-primary' | 'success' | 'caution' | 'system'
        };
        Controllers: {
            ShowInSlider: boolean = true;
            Display: DisplayStates = 'show'; // 'show' | 'hide'
            Size: PepSizeType = 'md'; // 'xs' | 'sm' | 'md' | 'lg' | 'xl'
            Style: PepStyleType= 'weak'; // 'weak' | 'weak-invert' | 'regular' | 'strong'
            ShowPause: boolean = true;
        };
        DropShadow: {
            use: boolean;
            size: PepSizeType; // 'xs' | 'sm' | 'md' | 'lg' | 'xl'
            intensity: PepShadowIntensityType; // 'soft' | 'regular' | 'hard';
        };
        Corners: {
            Use: boolean = false;
            Size: PepSizeType = 'md'; // 'xs' | 'sm' | 'md' | 'lg' | 'xl'
        }
    },
    Slides: [
        {
            Title: {
                Use: boolean = true;
                Content: string = 'Title';
                Size: PepSizeType = 'md';
                Weight: FontWeight = 'normal'; // 'normal' | 'bold' | 'bolder'
            };
            SubTitle: {
                Use: boolean = true;
                Content: string = 'Sub title';
                Size: PepSizeType = 'md';
                Weight: FontWeight = 'normal'; // 'normal' | 'bold' | 'bolder'
            };
            FirstButton: {
                Use: boolean = true;
                Label: string = 'Yess';
                Flow: {
                    FlowKey: string;
                    FlowParams: [
                        "param1":{
                            "Type":  "dynamic",
                            "Value": "myBlockVariable"
                        }
                    ]
                };
                Style: PepStyleType = 'weak-invert';
            };
            Filter: {
                Use: boolean = false;
                FilterObj: string; // JSON string from the query builder component.
            };
            SlideInteractivity: string = "false"; // if slide is clickable
            SecondButton: {
                Use: boolean = true;
                Label: string = 'Noo';
                Flow: {
                    FlowKey: string;
                    FlowParams: [
                        "param1":{
                            "Type":  "dynamic",
                            "Value": "myBlockVariable"
                        }
                    ]
                };
                Style: PepStyleType = 'strong';
            };
            TextColor: textColor = 'inverted'; // 'system' | 'dimmed' | 'inverted' | 'strong'
            Button: {
                Size: PepSizeType  = 'md';
                Color: buttonColor= 'system-primary';
            }
            Alignment: {
                Horizontal: PepHorizontalAlignment = 'left'; // 'left' | 'center' | 'right'
                Vertical: 'start' | 'middle' | 'end' = 'start';
            }
            ContentWidth: WidthUnits = 'Regular'; // 'Narrow' | 'Regular' | 'Wide'
            InnerSpacing: PepSizeType = "md";
            GradientOverlay: PepColorSettings = {
                use: boolean = true;
                value: string = 'hsl(0, 0%, 0%)';
                opacity: number = 75; // between 0 - 100.
            };
            Overlay: PepColorSettings = {
                use: boolean = true;
                value: string = 'hsl(0, 0%, 0%)';
                opacity: number = 75; // between 0 - 100.
            }
            Image: SlideImage = {
                Use: boolean = false;
                AssetKey: string = ''; 
                AssetUrl: string = '';
                HorizontalPosition: string = '50';
                VerticalPosition: string = '50';
            }
        }
    ]
}
```



#### Event Result

```
Return the same object with manipulation (or not)
for example: will return just 2 slides. or change buttons flow ....
```

#### OnClientSlideshowButtonClick&#x20;

Clicking a button will run a flow action that the user attached to the button

#### EventData

```
{
    // TODO - ADD FLOW PARAMS
}
```

#### EventResult

