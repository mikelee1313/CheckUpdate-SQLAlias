# CheckorUpdateSQLAlias.ps1
This script will read a list of servers and check, update or create new SQL Alias registry keys from within the 32bit and 64bit hives. 

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

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/d4777736-cdc1-4bcf-9894-1e263bb964f4)

4. The "**Check**" option will read the current key(s) across your list of servers and output all alias's and the configurations to a file in the Temp location.

   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/b435852c-41a6-4af5-9e07-3375700788d0)

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/8642d5bb-f592-40bd-b871-0e50915fac57)

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/964318b0-188d-4e92-96aa-1b931a15d0e3)

5. The "**Update**" option will change the keys according to the names you specified in the inputs:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/f40d95cd-6415-4b95-aa0f-8cd5e0b66a28)


   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/f1116b18-54b9-4325-aef3-e69a70cd0e19)



7. The "**Create**" option will add a new entry in both the 32bit and 64bit hives if one does not exists.

   Example:

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/de5ebc0e-221b-4dc2-a030-713910c1839a)


   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/6f597aef-d76b-40b5-9efc-bdcf18f5e69d)

8. The "**DeleteAll**" option will delete all values in both the 32bit and 64bit "Connect to" keys.


   Note: Use this option with caution as it will delete all current SQL Alias's and could impact your service if this action is not totally understood.
   

   Example:
   
   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/e2058aea-7078-4502-a6fb-075673e8ecd1)
   

   ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/0b078d4d-928c-466b-a404-0612cb6bb20a)


   


   


   
