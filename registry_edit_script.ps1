#Stephen Sparks

$Envir = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\'
$Lincense = "LM_LINCENSE_FILE"
$Server = "27000@test.university.com"
                                                                                            #setting variables

if (Get-ItemProperty -Path $Envir -Name $Lincense -ErrorAction Ignore){                     #check to see if the environment variable exist
	write-host "$Lincense Variable Already Exist"                                       #if it does print that it does
	$param = Get-ItemProperty $Envir                                                    #search the existing variable's values
	$GrabParam = $param.$Lincense                                                       #assign them to variable so just variable values are saved nothing else
	if($GrabParam -like "*$Server*"){                                                   #second if statment to check if the exisiting variable has the correct value
		write-host "$Server already exist"                                          #if it does have the test.uni.com value then break
		break
	}else{                                                                              #otherwise if it does not have the test.uni.com value 
		Set-ItemProperty -Path $Envir -Name $Lincense -Value "$Server, $GrabParam"  #set test.uni.com value plus any other values that were already there
		write-host "$Lincense Variable updated adding value $Server"                #print that the test.uni.com value was added
}}else{                                                                                     #Only runs if the variable does not already exist 
	New-ItemProperty -Path $Envir -Name $Lincense -Value $Server                        #create the variable and value
	Write-Host "Variable $Lincense created with value $Server Located in $Envir"        #print that is was added
}

#HUGE credit to http://woshub.com/how-to-access-and-manage-windows-registry-with-powershell/

