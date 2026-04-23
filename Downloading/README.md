Workflow for downloading ALOS-2 (maybe also ALOS, haven't tested this) data ordered through gportal.jaxa.jp

1. Make an account at gportal.jaxa.jp. This allows you to download data from the "ALOS series Open and Free data". For ALOS-2, this consists af ScanSAR data in either L1.1 (the equivalent of SLC, huge files on the order of 10s of Gigabytes) or L2.2 format. L2.2 is GRD data that is calibrated and map projected.

2. Locate and order the data you want. For regular users, this is limited to 5 images per day. Once an image is ordered, you'll get a confirmation email with the production order number and scene ID attached. Once the ordered scenes are processed, you'll get another email with the SFTP download information. This can take upwards of several days. The last email includes the "Product path", which is where your processed data is located. From here, you can manually download the images by navigating using software like FileZilla, or use the bash script "sftp_download.sh". For the latter, the following steps are required:

3. Generate or edit the file "orders_list.txt". Insert the full product path of each scene you want to download, with one product path per line.

4. Add the path to the file "IDs.txt", as well as the path to the folder where you want to store the downloaded data in "sftp_download.sh". You also need to add your gportal credentials to the script. As of now, all of this has to be hardcoded in "sftp_download.sh", which should be improved. TBA. The file "IDs.txt" is just a temporary file used for generating the right filename, and can in practice be put anywhere. For simplicity, just store it in the same folder as "orders_list.txt". As this can be quite a lengthy process, I recommend setting it up in tmux (or similar).

5. Congratulations! After a painstakingly slow download, you have now acquired ALOS-2 data!! If the data is in L2.2 format, scripts for processing the data can be found in the "processing" folder (to be added). If the data is in L1.1 format, you're on your own from here on.

NB! The data consists of several files: HH and HV backscatter, incidence angle (the ...LIN.tif file), a quality mask file, a .kml file of the scene outline and a .xml summary file. The way the script is set up, these are all dumped in a "common" ALOS-2 folder (kind of like a data lake). If you want one folder per image, the download script would have to be modified, which should be straight forward.

NB!! Occasionally, the script fails to download some of the image files. In this case, I would recommend to just use a software like FileZilla to manually locate the missing files.

NB!!! This script also works for data outside of the "ALOS series Open and Free data", like L1.5 ScanSAR data or data from other acquisition modes (like quad-polarimetric data). However, I haven't used it much for this purpose, so it's not well tested. You might therefore run into unexpected problems, but I'm sure you'll figure it out :)


Created by Truls Karlsen
