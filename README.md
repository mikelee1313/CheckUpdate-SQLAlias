# CheckorUpdateSQLAlias.ps1
This script will read a list of servers and check, update, create, delete or "delete all" new SQL Alias(s) registry keys from within the 32bit and 64bit hives. 

Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSSQLServer\Client\ConnectTo

This is useful when migrating SharePoint servers to a new SQL server, where the SQL instance will change but the alias will remain the same. 

How to run:

1. Create a list of servers in the "Servers.txt" file.

   Note: Make sure your path is correct

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/acf7e749-923e-45f7-83ab-6ae6c25175ba)

2. Modify the "$sqlalias" and the "$sqlServer" parameters to match your environment.

   Note: These settings can a new entry or a current setting you want to update.

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/775112db-48ea-4295-be53-cbc5bbeb8026)

   Please note: When using TCP/IP, "DBMSSOCN, will be added to the string in the registry and a Port number maybe required.

3. Run the script from a server with an elevated PowerShell ISE or PowerShell.

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/97e3a10f-4dbf-4794-a2d9-f4f0e7c1a276)


4. The "**Check**" option will read the current key(s) across your list of servers and output all alias's and the configurations to a file in the Temp location.

   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/b435852c-41a6-4af5-9e07-3375700788d0)

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/8642d5bb-f592-40bd-b871-0e50915fac57)

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/964318b0-188d-4e92-96aa-1b931a15d0e3)

5. The "**Update**" option will change the keys according to the names you specified in the inputs:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/f40d95cd-6415-4b95-aa0f-8cd5e0b66a28)


   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/f1116b18-54b9-4325-aef3-e69a70cd0e19)



6. The "**Create**" option will add a new entry in both the 32bit and 64bit hives if one does not exists.

   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/de5ebc0e-221b-4dc2-a030-713910c1839a)


   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/6f597aef-d76b-40b5-9efc-bdcf18f5e69d)


7. The "**Delete**" option will delete the specified value in both the 32bit and 64bit "Connect to" keys.

   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/b249823a-94b1-4e00-aaf5-8982f91284ed)


   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/94c5bf69-dd3c-4525-b418-4f14ed6e5cc1)

   

9. The "**DeleteAll**" option will delete all values in both the 32bit and 64bit "Connect to" keys.


   Note: Use this option with caution as it will delete all current SQL Alias's and could impact your service if this action is not totally understood.
   

   Example:
   
   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/0d5f15fc-d41c-4be7-b242-33850584e0b9)


   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/0dc44a4d-f714-4e12-ad29-658d04c5829c)



   


   


   
