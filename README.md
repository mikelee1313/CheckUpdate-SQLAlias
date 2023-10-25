# CheckorUpdateSQLAlias.ps1
This script will read a list of servers and update the SQL Alias registry keys from within the 32bit and 64bit hives. 

Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\MSSQLServer\Client\ConnectTo

This is useful when migrating SharePoint servers to a new SQL servers, where the SQL instance will change but the alias will remain the same. 

How to run:

1.	Modify the "$sqlalias" and the "$sqlServerAfter" parameters to match your environment.

2.	  "$sqlalias" should be your current SQL Alias as show in CLICONFG.

 ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/418bcaab-efbb-42f8-acdb-e5923b6f703b)

3.	Modify the “$sqlServerAfter" to be to new SQL instance name.

4.	Please note, that when using TCP/IP, "DBMSSOCN, will be added to the string in the registry and a Port number maybe required.

Example:
 
![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/484ff481-cbc1-46fa-a4ef-fda03d582861)


5.	Run the script from a server with an elevated PowerShell ISE or PowerShell.


6.	The check option will read the current key across the server list and output to a file in the local use’s Temp location.

Example:

![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/073be39d-d4a8-42ed-9891-0d2042e8f281)


Example:

 ![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/65409117-0936-419e-a5c2-e092dcc1fa5f)


7.	The Set option will change the keys according to the new server names you specified in the inputs:

![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/8abd2e6c-6c6b-4df4-be0e-c6264afdff50)


Example:


![image](https://github.com/mikelee1313/CheckUpdate-SQLAlias/assets/62190454/1e192d47-3df5-4259-a16b-2813f9d8c34c)


