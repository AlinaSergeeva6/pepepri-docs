# Android - Private Label Setup Guide

### Detailed Steps:

1. Ask customer to create a Google Play Developer account, including ID verification and paying the fee, and send an invitation as Account Owner permission (use a Google login; if you don’t want to use your personal gmail, create one just for this purpose.);
2. Ask customer to send you all logos (look at the configuration page for specs) and app name;
3. Set the Application ID to be com.pepperi.{appname} in Pepperi;
4. Log in to the GMAIL that you used in Step 1, in the Chrome browser. Log in to Play Console;

&#x20;       Create the APP in Play console:

<figure><img src="../.gitbook/assets/image (1041).png" alt=""><figcaption><p>Pic1</p></figcaption></figure>

5. In Pepperi, select First APK and create App.;
6. After First APK is successful, click Download and choose Bundle:

<figure><img src="../.gitbook/assets/image (1042).png" alt=""><figcaption><p>Pic2</p></figcaption></figure>

7. It downloads a file, find it:

<figure><img src="../.gitbook/assets/image (1043).png" alt=""><figcaption><p>Pic3</p></figcaption></figure>

8. Back to Play Console. Go to Internal Testing:

<figure><img src="../.gitbook/assets/image (1044).png" alt=""><figcaption><p>Pic4</p></figcaption></figure>

9. Create New Release:

<figure><img src="../.gitbook/assets/image (1045).png" alt=""><figcaption><p>Pic5</p></figcaption></figure>

10. Click Choose Signing Key – Use Google Generated Key:

<figure><img src="../.gitbook/assets/image (1046).png" alt=""><figcaption><p>Pic6</p></figcaption></figure>

11. Upload the First APK Bundle that you downloaded:

<figure><img src="../.gitbook/assets/image (1047).png" alt=""><figcaption><p>Pic7</p></figcaption></figure>

Uploaded:

<figure><img src="../.gitbook/assets/image (1048).png" alt=""><figcaption><p>Pic8</p></figcaption></figure>

12. RELEASE (fully) to INTERNAL TESTING the release with the First APK bundle. Otherwise API from Pepperi won’t pick up the Build # to increment for version #2 on final release!\
    **Note:** It’s not necessary to actually do any “internal testing”. The app is what it is. Save time and continue to the next steps towards Prod release.

    1.  **Create Service Account Key:**\
        a.       Go to console.cloud.google.com/apis/dashboard and Create a Project, and select it from the dropdown at the top.

        b.       Click +Enable APIs and Services

        c.       Search for Google Play Android Developer API and Enable

        d.       Then, go to Credentials tab and click Create Credentials (Service Account)

        e.       Select an API = Google Play Android Developer API, and data access = Application Data, click Next

        f.        Select Service Account

        Use “pepperi + {type the name of the customer} for service account name and service account id:\
        <br>

        <figure><img src="../.gitbook/assets/image (1049).png" alt=""><figcaption><p>Pic9.</p></figcaption></figure>

        h.       In the Service Account Description write ‘used for private label app access only’

        i.       Click ‘create and continue’         &#x20;

        j.        Select a role (Service Accounts / Service Account User)

    <figure><img src="../.gitbook/assets/image (1050).png" alt=""><figcaption><p>Pic10</p></figcaption></figure>

    k.       Click Done

    l.       Click on Credentials on the left and see the Service Account you created

    m.       Click the pencil to edit the service account

    n.       Click the Keys tab à Add Key à Create New Key

    o.       Select JSON and Create. It will download a file:

<figure><img src="../.gitbook/assets/image (1051).png" alt=""><figcaption><p>Pic11</p></figcaption></figure>

14. Go back to Pepperi and upload the service account key in the Configuration tab.
15. **Critical** – **or else it will always build as Build (version) # 1 -- In the Credentials / Service Account section of** [**https://console.cloud.google.com/apis/dashboard**](https://console.cloud.google.com/apis/dashboard) **you should see a service account with an email address ending in iam.gserviceaccount.com. Copy that, go back to** [**https://play.google.com/console**](https://play.google.com/console) **Users and Permissions / Invite New User / Paste the email; Account Permissions: Make it an Admin. You need to explicitly do that for each (and always exactly one) APP created on the environment!!**

16\. Select the real Pepperi version and create real (version #) build

17\. Add ?support\_mode=true to the URL to see the Support tab (to look up Jenkins failure #, and also, to have more Android app versions available to you when creating the build.):

<figure><img src="../.gitbook/assets/image (1052).png" alt=""><figcaption><p>Pic12</p></figcaption></figure>

**Note:** If you do the steps correctly, the “real” version build should ALWAYS show as #2 here, since First APK was Version #1. It determines the version number by making an API call to Google to determine the current released version # and adding 1 to that.

18. After successful VERSION build, download the BUNDLE.
19. Define the privacy policy in App Content / Start Declaration. All of the questions are easy, be “minimalist” and answer “no” to most of the questions.  &#x20;
20. &#x20;Paste the link for the Pepperi privacy policy and save:

<figure><img src="../.gitbook/assets/image (1053).png" alt=""><figcaption><p>Pic13</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1054).png" alt=""><figcaption><p>Pic14</p></figcaption></figure>

21\. Under “App Access” MAKE SURE to indicate the app is RESTRICTED and INCLUDE VALID LOGIN CREDENTIALS!!!!!! Use credentials that will not be reset by the customer!

\
a. That login, put it on a special **Test Buyer Profile** dedicated for the test user

b. On that buyer profile configure ONLY the Lines view in Order Center and CART, and **remove ALL IMAGES** from that profile !!  (you can get rejected due to ‘broken functionality’ if they see the image download placeholder). Strip out everything you can, anything that can give an excuse to reject the app.

c. Make sure that the transaction has no items that are **unavailable**, or unable to be added to cart.

d. Make sure the **‘exceeds inventory available’ setting on the transaction is “do nothing”,** -- Google will even reject you for the fact that incrementing UnitsQuantity turns red!!  &#x20;

e. Recommend unchecking this box, but this does not prevent them from logging in and finding things to complain about.

<figure><img src="../.gitbook/assets/image (1055).png" alt=""><figcaption><p>Pic15</p></figcaption></figure>

22. For data safety, use the answers here (there is an Import from CSV option). Double click the icon below to open the CSV in Excel:

<figure><img src="../.gitbook/assets/image (1056).png" alt=""><figcaption><p>Pic16</p></figcaption></figure>

23. &#x20;Main store listing, do not include extra info. **You will get rejected if this description is too long.** Try for example (Short Description: Mobile Ordering Application). Full Description: **“This mobile application allows \[CustomerName] customers and reps to track order history, take orders, and view our latest product information and pricing.”**
24. &#x20;If you have not changed the default colors you can use the regular Pepperi app for iPad and iPhone, to upload the screenshots, but if you use any Apple device you must delete this top bar that will cause the screenshots to be auto flagged as having been taken from an iOS device instead of Android:

<figure><img src="../.gitbook/assets/image (1059).png" alt=""><figcaption><p>Pic17</p></figcaption></figure>

&#x20;     If you DO have custom colors you must add your email (Play store email) to the list of internal      testers, download the test version, and use that to take the pictures. You’ll need to do that on a phone  and tablet.

25. Create Production Release and add bundle from library. Click Next:

<figure><img src="../.gitbook/assets/image (1060).png" alt=""><figcaption><p>Pic18</p></figcaption></figure>

26. &#x20;Fix all errors (mostly just answering questions, answer them all with a “minimalist” assumption.):

<figure><img src="../.gitbook/assets/image (1061).png" alt=""><figcaption><p>Pic19</p></figcaption></figure>

27. Set the production release for review after correcting all errors:

<figure><img src="../.gitbook/assets/image (1062).png" alt=""><figcaption><p>Pic20</p></figcaption></figure>

28. Be prepared to be rejected multiple times for mundane and stupid reasons. If you get rejected too many times, the app will be suspended. GPROD o back to Step 4 and create a new app in that case and go through the whole process again.

    Just give it a slightly different app ID in Pepperi for First APK, and make sure the service account user is assigned to the new app in step #15.

## For UPDATING to a new version:

In App Bundle Explorer, in the top right, there is Upload New Version button. Use that. Submit directly to Prod. It’s already approved, just another version, so it should be approved almost immediately. &#x20;

**Note:** For Jenkins Build #: add to the address bar, **/support\_mode=true**
