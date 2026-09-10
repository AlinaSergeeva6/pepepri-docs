---
title: "Upload Images From SFTP"
order: 231
---
# Upload Images From SFTP

Steps of upload images to the Pepperi from SFTP:

1) Install FileZilla
2) You need to input SFTP credentials (Host,User name, password and port)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/1-21.jpg)

3) When you input correct data you will get data navigation through file manager section

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/2-16.jpg)

4) After that go to the integration platform and create dataflow task with this settings:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/3-11.jpg)

5) Configuration of settings in dataflow task.

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal-articles/static/4-7.jpg)

5.1- **is\_sftp** – set true

5.2- **sftp\_(user/password/host)** - copy from SFTP credentials

5.3- **ftp\_image\_upload\_level\_seperator** - is needed when you need to import child images

5.4- **sftp\_images\_folder** - way to the file (copy from FileZilla)
