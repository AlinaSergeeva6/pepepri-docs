---
description: Step by step Instruction
---

# QuickBooks Listener Integration

Step by step Instruction

*   Go to IPaaS → Tools → Desktop Application

    * Here expand QuickBooks and download this two setup

    <figure><img src="../../../.gitbook/assets/image (874).png" alt=""><figcaption></figcaption></figure>

    * On server you should see archive and SDK install file

    <figure><img src="../../../.gitbook/assets/image (876).png" alt=""><figcaption></figcaption></figure>
* Unzip `qb_online_listener.zip` archive to Local Disk (try always to use Root folder C:/ or C:/ProgramFilles)
* Install `qbfc13_0installer.exe` . Just click Next and Next (simple installation)
* After install go to folder /online\_listener and setup (SettingsEditor.exe) clientid for our listener. Use `Generate GUID` copy and paste to clientid value.

<figure><img src="../../../.gitbook/assets/image (877).png" alt="" width="375"><figcaption></figcaption></figure>

* Run as admin OnlineListener.exe (this located in the same folder). If all ok you should see following:

<figure><img src="../../../.gitbook/assets/image (878).png" alt="" width="375"><figcaption></figcaption></figure>

*   Open your QuickBooks Intuit as Administrator. Login to your Company File and be sure that you in Single-Mode (thats need for integrate listener with current Company File).

    * For check if that in Single Mode you can open File and see option **Switch to Multi-user Mode**



    <figure><img src="../../../.gitbook/assets/image (879).png" alt="" width="188"><figcaption></figcaption></figure>

    * On this step you should have already created account for our Listener. If no you always can create that in this menu (there all simple, just be sure that you added **FullAccess**)

    <figure><img src="../../../.gitbook/assets/image (880).png" alt="" width="368"><figcaption></figcaption></figure>
* For trigger Listener → create simple Dataflow task (as example on screenshot) **Export Items**. Put there your **clientid** as `signalr_client_id` and path to **Company File** as `companyfile` (be sure that you put correct way)

<figure><img src="../../../.gitbook/assets/image (881).png" alt="" width="375"><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (882).png" alt="" width="375"><figcaption></figcaption></figure>

*   Run the Dataflow and check the server. You should receive a new window from QuickBooks Intuit requesting permission.

    * Window with access

    <figure><img src="../../../.gitbook/assets/image (883).png" alt="" width="375"><figcaption></figcaption></figure>

    * Select the options as shown in the screenshot and choose the user for the listener. To enable the type field, simply click the link. Then confirm all selections.

    <figure><img src="../../../.gitbook/assets/image (884).png" alt="" width="375"><figcaption></figcaption></figure>

    * If everything is set up correctly, you should receive data from the created dataflow

    <figure><img src="../../../.gitbook/assets/image (885).png" alt="" width="375"><figcaption></figcaption></figure>



> 💡  When you've completed all these steps, you can check all integrations in **Edit → Preferences**.\
> We need to follow the same process for Webhooks. Use these last steps as a reference.
>
> ![](<../../../.gitbook/assets/image (889).png>)

* After completing all steps, switch to Multi-User mode, and you're done.

### Some Problems and solutions

1. Run both the listener and QuickBooks Intuit as administrator. This helps fix issues like multiple windows. By doing this, the client can work on the server while the listener operates simultaneously.
2. Some servers have Server Manager. If you can't install .NET Framework or similar components, simply go to Server Manager and install them there.
3. If you've done everything correctly but notice that QBExporter.exe isn't running, check the permissions. Try running this .exe manually and allow permissions (the server will remember this exe and allow it to run in the future). Also, check if you're seeing a window like the one in the screenshot below. If so, make sure to uncheck the checkbox and confirm the window.

<figure><img src="../../../.gitbook/assets/image (890).png" alt="" width="290"><figcaption></figcaption></figure>
