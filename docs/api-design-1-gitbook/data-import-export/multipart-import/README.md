# 🧩 Multipart Import

The multipart file import is a core component of the DIMX's `overwriteTable` capability, designed to facilitate the efficient handling of large datasets that need to replace existing table contents entirely. Here's how it works within the context of enabling the `overwriteTable` feature:

1. **Initialization**: Begin by initializing a multipart import session to receive a `MultipartKey`. This session ID is crucial for tracking the upload progress of the files and associating them with the intended `overwriteTable` operation. Optionally, send your own key to initialize a session with it.
2. **Upload Files**: Adding the `MultipartKey` property,  upload each of your files through the file import endpoint. The inclusion of the `MultipartKey` in your requests ensures that each file is correctly attributed to your ongoing import session, maintaining the integrity of the dataset being imported. This step is repeated for each segment of your dataset until the entire file has been uploaded.
3. **Finalization and Overwrite**: Upon completing the upload of all files, finalizing the import with the `MultipartKey` triggers the system to reassemble the dataset and activate the `overwriteTable` process. This final step effectively replaces the entire content of the destination table with the newly imported data, ensuring that the table exclusively contains the latest and most relevant dataset.

<br>
