# SAP- Go Live Cutover Process

1\.      In the ORIGINAL IPaaS environment, if the dataflow tasks have explicit connection string with reference to the old values, you should update all of them to **!%sql\_connection%!** \
(assuming they all had the same value anyway, take care that no tasks intentionally had a different value for example tasks intended to permanently be connected to some test or alternative SAP instance on the previous production server.)

2\.      Copy General Settings from DUMMY IPaaS to PRODUCTION anything that changed:\
&#x20;                                                                   **sql\_connection (connection string)**\
&#x20;                                                                  **server (name and IP)**\
&#x20;                                                                  **companyuser**\
&#x20;                                                                  **companypass**\
&#x20;                                                                  **licenseserver (name and IP and port)**\
&#x20;                                                                  **companydb**\
&#x20;                                                                  **dbuser**\
&#x20;                                                                  **dbpass**

3\.      Copy the listener ID from DUMMY IPaaS environment and OBFUSCATE IT

4\.      Paste the listener ID from DUMMY to Production IPaaS environment

5\.      Restart Pepperi listener on NEW server

6\.      Test everything now comes through to production Pepperi environment from new server
