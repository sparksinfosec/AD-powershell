#Stephen Sparks
Import-Module ActiveDirectory

$UserAction = Import-Csv C:\Users\Administrator\Downloads\users.csv #add exact file path

foreach ($User in $UserAction){ #loop thru CSV info add to variable

$action = $User.action
$username = $User.username
$firstname = $User.firstname
$lastname = $User.lastname
$description = $User.description
$oupath = $User.oupath
				

	if ($action -eq "add"){  #if the action is add add new user
		$password = $User.password | ConvertTo-SecureString -asPlainText -Force #added here because for deleted user its throwing an error
		New-ADUser `
			-SamAccountName $username `
			-GivenName $firstname `
			-Surname $lastname `
			-Enable $True `
			-Path $oupath `
			-Description $description `
			-AccountPassword $password `
			-ChangePasswordAtLogon $True `
			-Name "$lastname" `
		

		Write-Host "User $lastname created"
			
	} elseif ($action -eq "delete") { #remove user if action is delete
		Remove-ADUser -Identity $username 
	}
	  else{ #wanted to make sure its not add or delete have a message for a mistake in CSV
		write-host "Something Went Wrong"
}
}
#credit https://www.alitajran.com/create-active-directory-users-from-csv-with-powershell/ helped me alot to get started