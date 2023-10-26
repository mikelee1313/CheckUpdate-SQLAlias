# CheckorUpdateSQLAlias.ps1
This script will read a list of servers and check, update or create new SQL Alias registry keys from within the 32bit and 64bit hives. 

Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSSQLServer\Client\ConnectTo

This is useful when migrating SharePoint servers to a new SQL servers, where the SQL instance will change but the alias will remain the same. 

How to run:

1. Create a list of servers in the "Servers.txt" file.

   Note: Make sure your path is correct

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/acf7e749-923e-45f7-83ab-6ae6c25175ba)

3. Modify the "$sqlalias" and the "$sqlServer" parameters to match your environment.

   Note: These settings can a new entry or a current setting you want to update.

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/1d1d0fec-2730-4619-9ff9-8401ed201976)

   Please note: When using TCP/IP, "DBMSSOCN, will be added to the string in the registry and a Port number maybe required.

3. Run the script from a server with an elevated PowerShell ISE or PowerShell.

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/814154d8-5d11-4f29-a6cf-ae857e20d5de)

5. The "Check" option will read the current key(s) across your list of servers and output all alias's and the configurations to a file in the Temp location.

   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/d9ecd0fc-682d-41b8-aeb5-b94c6549d413)

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/86a00bf3-2808-4d3a-b749-b761d9a18e48)

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/5fb43c53-5742-4fb0-8fb0-3ab5d28c9b1e)

6. The "Update" option will change the keys according to the names you specified in the inputs:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/70f1ba79-426e-4c23-9baa-1b3ae32ace42)

   Example:

![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/72811c3c-124f-425c-9e78-3728dfcae884)

7. The "New" option will add a new entry in both the 32bit and 64bit hives if one does not exsist.

   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/f4921c99-160f-46d2-a167-bf1bf28a64ce)

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/ad3698c2-ceb3-4761-90cb-e12c0e145f0c)



   
