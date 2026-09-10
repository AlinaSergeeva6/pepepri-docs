---
title: "Upgrade Online Listener"
order: 205
---
# Upgrade Online Listener

Before the updating please be sure that you have Remote Access to the customer server. Instructions how to get it you can read [here](https://pepperi.gitbook.io/internal-knowledge-base/logmein-rescue-instructions/remote-control).

## Step #1 - Download the latest version of the Listener

In the [Integration](https://integration.pepperi.com/mgr/), Tools-> Desktop Application select "QuickBooks" and " Exporter Only" inside of it.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/qq1.png)

## Step #2 – End online listener process

1\. Go to Remote Access server 2. Start Task Manager (Click Ctrl+Alt+Del, if you cannot click, there is button on tollbar)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/qq2.png)

3\. In Task Manager select “Process”, find “Online Listener” and End this process

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/qq3.png)

## Step #3 – Upload and replace Online Listener (This part required Remote Access)

1\. Open LogMeIn Rescue – Connect to your customer – File Manager – Launch File Manager Session – Replace files in path: C:\\Program Files (x86)\\Pepperi for QuickBooks\\qb\_exporter

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/qq4.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/qq5.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/qq6.png)

4\. After updating, go to online\_listener folder and start “OnlineListener.exe” **Just to make sure that everything is working try to export some data from QB, using any QB export Example task**
