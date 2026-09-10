---
title: "SAP migration. Summary"
order: 154
---
# SAP migration. Summary

## Setup and Testing:

1\. Create Dummy Pepperi instances (Create new account with plugin), copying from source Distributor and Integration Template Client 2. On new IPaaS for Dummy, obfuscate Listener ID so it does not connect to production server 3. Create any UDTs on the new Dummy Pepperi environment that did not come over on the copy. 4. Send to customer the General Settings credentials that we had on production and ask them to update any that changed: **sql\_connection (connection string) server (name and IP) companyuser companypass licenseserver (name and IP and port) companydb dbuser dbpass**

5\. Get remote access to both the old and new servers so that you can connect to both and copy files between them 6. Run the installation wizard on the new server, which you get from Desktop Applications in IPaaS. 7. Copy all of the core Pepperi for SAP Program Files folder files, from old server to new (to ensure you have the same 32 vs 64 importer version, etc.)

8\. Reset the GUID of the listener ID on the new server and paste that into the general settings of the dummy IPAAS.

9\. If the dataflow tasks have explicit connection string with reference to the old values, you should update all of them to **!%sql\_connection%!** (assuming they all had the same value anyway, take care that no tasks intentionally had a different value for example tasks intended to permanently be connected to some test or alternative SAP instance on the previous production server.)

10\. (Re)start listener service on new server and run an export task from dummy IPaaS. If you get data, check the Pepperi for SAP Online Listener folder on new server and review the logs to confirm that your query went from the new server.

11\. Run all scheduled jobs and review the data in the system

12\. Send a test sales order to a SAP customer that the customer says is OK to send to.

13\. Tell them they won’t be able to use the system for several hours and schedule the time for cutover.
