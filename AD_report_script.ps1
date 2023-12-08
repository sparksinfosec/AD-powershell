#Stephen Sparks

Get-ADComputer -Filter * -Properties * |` #get all computers all properties credit microsoft docs https://docs.microsoft.com/en-us/powershell/module/activedirectory/get-adcomputer
Select-Object Name, Enabled, DistinguishedName, Created, Modified, CanonicalName | ` #select objects to pull specific data https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-object
Export-Csv -Path .\computerReport.csv #export to csv current dir give the file a name credit https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/export-csv