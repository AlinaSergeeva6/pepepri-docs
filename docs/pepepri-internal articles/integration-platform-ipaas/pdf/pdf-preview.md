---
title: "PDF preview"
description: "All the examples you can find in 'Integration Examples' (6685); 'Get PDF file from FTP'(64025) - dataflow task and 'Redirect to PDF' (64026) - UI task"
order: 227
---
# PDF preview

*All the examples you can find in 'Integration Examples' (6685);  'Get PDF file from FTP'(64025) - dataflow task and 'Redirect to PDF' (64026) - UI task*

The main idea of ​​this article is to show how you can display a PDF file that is on FTP

In order to display a PDF file that is on FTP follow the next steps:

**Step#1: prepare a dataflow task** which will take the file from FTP

![](https://alinasergeeva6.github.io/pepepri-docs/static/22Capture.PNG)

**Required settings:**

-   ftp\_source\_server = FTP IP address ;
-   is\_new\_api = enabled checkbox;
-   ftp\_source\_user = username;
-   ftp\_source\_pass = user password;
-   storage\_file\_name = the name of the file we want to download;
-   ftp\_storage\_folder = FTP folder path; requires\_session = disabled checkbox

![](https://alinasergeeva6.github.io/pepepri-docs/static/2Capture-1.PNG)

Run the dataflow task and we see the uploaded file

![](https://alinasergeeva6.github.io/pepepri-docs/static/lCapture.PNG)

**Step#2: prepare a UI task** which will do redirect to PDF

![](https://alinasergeeva6.github.io/pepepri-docs/static/lllCapture.PNG)

The UI task then runs a dataflow task that takes the PDF file from FTP and returns the session name in encrypted format.

**IMPORTANT:** Use the get\_data function to get the required file

```
<script>

  const fileDownloadBaseUrl = '!%file_download_url%!';

  function on_load() {
      const pdfFileName = get_url_parameter({
      parameter_name: 'pdfFileName'
    });
    const sessionKey = get_url_parameter({
      parameter_name: 'session'
    });
    get_data({
      data_format: 'url',
      task_name: 'Get PDF file from FTP',
      success_callback: 'getDataCallback',
    });
  }
  function getDataCallback(response) {
    console.log('getDataCallback response', response);
    fullUrl = fileDownloadBaseUrl + '?attach=false&media=pdf&file=' + response;
    window.location.href = fullUrl;
    return;
  }

</script>
```

Run the UI task and ready. We rendered a PDF file using a UI task

![](https://alinasergeeva6.github.io/pepepri-docs/static/;Capture.PNG)
