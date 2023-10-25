<#   
Title: CheckorUpdateSQLAlias.ps1
Description: Checks and Updates the SQL Alias Keys on a list of Servers
Date: 10/25/2023
Author: Mike Lee
Disclaimer: The sample scripts are provided AS IS without warranty  
        of any kind. Microsoft further disclaims all implied warranties including,  
        without limitation, any implied warranties of merchantability or of fitness for 
        a particular purpose. The entire risk arising out of the use or performance of  
        the sample scripts and documentation remains with you. In no event shall 
        Microsoft, its authors, or anyone else involved in the creation, production, or 
        delivery of the scripts be liable for any damages whatsoever (including, 
        without limitation, damages for loss of business profits, business interruption, 
        loss of business information, or other pecuniary loss) arising out of the use 
        of or inability to use the sample scripts or documentation, even if Microsoft 
        has been advised of the possibility of such damages.
#>

# Define the list of servers
$servers = Get-Content 'C:\install\servers.txt'

#Current SQL Alias here:
$sqlalias = "sqlalias"

#Updated SQL Server Instance Name Here:
$sqlServerAfter = "DBMSSOCN,sqlserverafter3"

#Log Settings
$date = Get-Date -Format yyyy-MM-dd_HH-mm-ss-ms
$Log = "$env:TEMP\" + $date + '_' + "SQLkeys.csv"

#This is the main function to execute the Set or Check Code
function checkkey {
    foreach ($server in $servers) {
        try {   
       
            #Open and read key in 32 bit hive
            Write-Host "Opening 32 BIT Registry on: $server "  -ForegroundColor Green
            Write-LogEntry -LogName:$Log -LogEntryText "Opening 32 BIT Registry on: $server "

            $Reg32 = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $server)
            $key = $Reg32.OpenSubKey("SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo")
            $val = $key.GetValue($sqlalias)
            $alias = $key.GetValueNames()
      
            Write-Host "Reading Alias from $key on '$server' "  -ForegroundColor Yellow
            Write-LogEntry -LogName:$Log -LogEntryText "Reading Alias from $key on '$server' "

            Write-Host "Current Alias key is '$alias' on Server '$server'" -ForegroundColor Green
            Write-LogEntry -LogName:$Log -LogEntryText "Current Alias key is '$alias' on Server '$server'"

            Write-Host "Current Alias value is '$val' on Server '$server'" -ForegroundColor Red
            Write-LogEntry -LogName:$Log -LogEntryText "Current Alias value is '$val' on Server '$server'"
       
            Write-LogEntry -LogName:$Log -LogEntryText "================================"
            Write-Host ""

            $key.Close()


            #Open and read key in 64 bit hive
            Write-Host "Opening 64 BIT Registry on: $server "  -ForegroundColor Green 
            Write-LogEntry -LogName:$Log -LogEntryText "Opening 64 BIT Registry on: $server "
             
            $Reg64 = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $server)
            $key = $Reg64.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\MSSQLServer\Client\ConnectTo")
            $val = $key.GetValue($sqlalias)
            $alias = $key.GetValueNames()
       
            Write-Host "Reading Alias from $key on '$server' "  -ForegroundColor Yellow
            Write-LogEntry -LogName:$Log -LogEntryText "Reading Alias from $key on '$server' "

            Write-Host "Current Alias key is '$alias' on Server '$server'" -ForegroundColor Green
            Write-LogEntry -LogName:$Log -LogEntryText "Current Alias key is '$alias' on Server '$server'"

            Write-Host "Current Alias value is '$val' on Server '$server'" -ForegroundColor Red
            Write-LogEntry -LogName:$Log -LogEntryText "Current Alias value is '$val' on Server '$server'"
       
            Write-Host ""
            Write-LogEntry -LogName:$Log -LogEntryText "================================"

            $key.Close()

        } 

        catch {
            $e = $_.Exception
            $line = $_.InvocationInfo.ScriptLineNumber
            $msg = $e.Message
            Write-Host  "Caught Exception: $e at $line" -ForegroundColor Red
            Write-Host $msg
            Write-Host "Something went wrong"
        }
    }

    #Finish and Report
    Write-Host "Export file was saved to: " $Log   -ForegroundColor Green
}
 
# Main Set Function
function setkey {
    foreach ($Server in $Servers) {
        try {
 
            #Open and update  key in 32 bit hive
            Write-Host "Opening 32 BIT Registry on: $server "  -ForegroundColor Green
            Write-LogEntry -LogName:$Log -LogEntryText "Opening 32 BIT Registry on: $server "
            $Reg32 = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $server)
            $key = $Reg32.OpenSubKey("SOFTWARE\Microsoft\MSSQLServer\Client\ConnectTo", $true)
            $alias = $key.GetValueNames()
 
            #Update Reg key
            Write-Host "Updating Registry $key on $server "  -ForegroundColor Yellow
            Write-LogEntry -LogName:$Log -LogEntryText "Updating Registry $key  on: $server "
            $key.SetValue($alias, $sqlServerAfter)
            Write-Host "Updated SQL Alias Reg key on '$server' with '$alias' ($($sqlServerAfter))"  -ForegroundColor Red
            Write-LogEntry -LogName:$Log -LogEntryText "Updated SQL Alias Reg key on '$server' with '$alias' ($($sqlServerAfter))" 
 
            Write-Host ""
            Write-LogEntry -LogName:$Log -LogEntryText "================================"

            $key.Close()
 
            #Open and update  key in 64 bit hive
            Write-Host "Opening 64 BIT Registry on: $server "  -ForegroundColor Green
            Write-LogEntry -LogName:$Log -LogEntryText "Opening 64 BIT Registry on: $server "
            $Reg64 = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $server)
            $key = $Reg64.OpenSubKey("SOFTWARE\WOW6432Node\Microsoft\MSSQLServer\Client\ConnectTo", $true)
            $alias = $key.GetValueNames()
 
            #update Reg key
            Write-Host "Updating $key on $server "  -ForegroundColor Yellow
            Write-LogEntry -LogName:$Log -LogEntryText "Updating Registry $key  on: $server "
            $key.SetValue($alias, $sqlServerAfter)
            Write-Host "Updated SQL Alias Reg key on '$server' with '$alias' ($($sqlServerAfter))"  -ForegroundColor Red
            Write-LogEntry -LogName:$Log -LogEntryText "Updated SQL Alias Reg key on '$server' with '$alias' ($($sqlServerAfter))" 
 
            Write-Host ""
            Write-LogEntry -LogName:$Log -LogEntryText "================================"
 
            $key.Close()

        }
        catch {
            $e = $_.Exception
            $line = $_.InvocationInfo.ScriptLineNumber
            $msg = $e.Message
            Write-Host  "Caught Exception: $e at $line" -ForegroundColor Red
            Write-Host $msg
            Write-Host "Something went wrong"
        }      
    }
    #Finish and Report
    Write-Host "Export file was saved to: " $Log   -ForegroundColor Green
}

#This is the logging function
Function Write-LogEntry {
    param(
        [string] $LogName ,
        [string] $LogEntryText
    )
    if ($LogName -NotLike $Null) {
        # log the date and time in the text file along with the data passed
        "$([DateTime]::Now.ToShortDateString()) $([DateTime]::Now.ToShortTimeString()) : $LogEntryText" | Out-File -FilePath $LogName -append;

    }
}


#Start Function
#Read Prompt to Check or Set
function CheckorUpdateSQLAlias {
    $run = Read-Host "Do you want to Check to Set? Type: (Check/Set)"
    if ($run -eq 'Set') {
        setkey
    }

    if ($run -eq 'Check') {
        checkkey
    }
}

CheckorUpdateSQLAlias
