# Adding a 360 Video to Item Description in Pepperi Order Center

This guide explains how to embed a 360-degree video in an item description within the Pepperi Order Center using a custom Transaction Line Item field. The video is embedded via an \<iframe>, and the field dynamically adjusts to the video URL provided by the client.

***

### Step 1: Prepare the Iframe Code

To embed a 360-degree video, you’ll use an \<iframe> tag. Platforms like YouTube simplify this process by generating the \<iframe> code for you.

#### Getting the Iframe Code from YouTube

1. Go to the desired YouTube video.
2. Click **Share** → **Embed**.
3.  Copy the provided \<iframe> code. For example:

    ```html
    <iframe width="560" height="315" src="https://www.youtube.com/embed/-xNN-bJQ4vI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    ```

#### Add Boilerplate HTML and Styling

To ensure the video displays correctly and adjusts to the field size, wrap the \<iframe> in a responsive container with CSS. Use the following HTML structure:

```html
<html>
<head>
    <style type="text/css">
        .videoWrapper {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 */
            height: 0;
        }
        .videoWrapper iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <div class="videoWrapper">
        <iframe width="560" height="315" src="https://www.youtube.com/embed/-xNN-bJQ4vI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </div>
</body>
</html>
```

**Note:** The CSS ensures the video maintains a 16:9 aspect ratio and scales responsively within the field.

***

### Step 2: Create a Custom Transaction Line Item Field

You’ll need to create a custom field to hold the video iframe and another field to store the video URL, which will dynamically update the iframe’s src attribute.

#### Create the HTML Formatted Field

1. **Go to Transaction Settings:**
   * Navigate to **Settings → Sales Activities → Transaction Types**.
   * Select the relevant transaction type (e.g., Sales Order).
2. **Add a Custom Field:**
   * Go to the **Fields** tab and create a new field.
   * **Field Type:** Select **HTML Formatted Text**.
   * **Field Name:** Choose a descriptive name (e.g., ItemVideoIframe).
3.  **Convert HTML to a Single-Line String:**\
    The Pepperi Rule Engine does not support multiline strings, so you must convert the HTML into a single line. For the example above, the one-line version is:

    ```javascript
    "<html><head><style type=\"text/css\">.videoWrapper{position:relative;padding-bottom:56.25%;height:0}.videoWrapper iframe{position:absolute;top:0;left:0;width:100%;height:100%}</style></head><body><div class=\"videoWrapper\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/-xNN-bJQ4vI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe></div></body></html>"
    ```

    **Note:** Escape double quotes (") with a backslash (\\") to ensure proper formatting.

#### Create a Field for the Video URL

1. **Add Another Custom Field:**
   * Create a second field to store the YouTube video URL (e.g., the src value for the iframe).
   * **Field Type:** Select **Single Line Text**.
   * **Field Name:** Choose a descriptive name (e.g., ItemVideoURL).
2. **Client Input:**\
   The client will populate this field with the video URL (e.g., https://www.youtube.com/embed/-xNN-bJQ4vI).

#### Dynamically Update the Iframe src

1. **Modify the HTML Field Logic:**\
   Use the Pepperi Rule Engine to dynamically insert the URL from the ItemVideoURL field into the iframe’s src attribute.
   *   In the ItemVideoIframe field, update the HTML string to reference the ItemVideoURL field. Example:

       ```javascript
       let videoUrl = GetValueByApiName("ItemVideoURL") || "https://www.youtube.com/embed/-xNN-bJQ4vI"; // Fallback URL if none provided
       return "<html><head><style type=\"text/css\">.videoWrapper{position:relative;padding-bottom:56.25%;height:0}.videoWrapper iframe{position:absolute;top:0;left:0;width:100%;height:100%}</style></head><body><div class=\"videoWrapper\"><iframe width=\"560\" height=\"315\" src=\"" + videoUrl + "\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe></div></body></html>";
       ```
   * **Explanation:** The GetValueByApiName("ItemVideoURL") function retrieves the URL from the ItemVideoURL field, which is then inserted into the src attribute of the iframe.

***

### Step 3: Configure the Field in Back Office

1. **Add the Field to the Order Center View:**
   * Go to **Back Office → Order Center Views → Item Information Page Portrait**.
   * Add the ItemVideoIframe field to the desired view (e.g., Item Details).
   * Adjust the field’s size if needed to ensure the video displays properly.
2. **Client Action:**\
   The client only needs to fill the ItemVideoURL field with the appropriate YouTube video URL (e.g., https://www.youtube.com/embed/-xNN-bJQ4vI). The iframe will automatically update to display the video.

***

### Step 4: Test the Implementation

1. **Test in the Web App:**
   * Open the Pepperi Web App and navigate to the Order Center.
   * Select an item and verify that the video displays correctly in the Item Information Page.
   * Use Chrome Developer Tools (F12 or right-click → **Inspect**) to troubleshoot any issues (e.g., check the Console for errors).
2. **Test on iPad (if applicable):**
   * Confirm with the PM whether the client uses an iPad.
   * Test the display on the iPad to ensure compatibility, as rendering may differ between platforms.
3. **Verify Responsiveness:**
   * Ensure the video adjusts properly to different screen sizes, thanks to the responsive CSS in the videoWrapper class.

***

### Best Practices

* **Document the Field:**\
  Add a comment to the ItemVideoIframe field explaining its purpose, dependencies, and updates (e.g., "Embeds a 360 video in the item description using ItemVideoURL - \[Your Name] - \[Date]").
* **Use a Fallback URL:**\
  Include a default video URL in case the ItemVideoURL field is empty to avoid broken iframes.
* **Test Across Platforms:**\
  Test on both Web App and iPad to ensure compatibility, as rendering issues may occur.
