#Stephen Sparks
Import-Module ActiveDirectory 

$GroupUsersModify = Import-Csv C:\Users\Administrator\Downloads\modifysg.csv #identify the exact path

foreach ($User in $GroupUsersModify){ #assign all csv data to variables 

$username = $User.username
$groupname = $User.groupname
$action = $User.action

	if ($action -eq "add"){ # if action is add in csv add user to group 
		Add-ADGroupMember -Identity $groupname -Members $username
		
	Write-Host "$username has been added to Group $groupname" #confirm text


	} elseif ($action -eq "delete") { #if action is delete remove user from group
		Remove-ADGroupmember -Identity $groupname -Members $username -Confirm:$false
		
	  Write-Host "Removed $username from Group $groupname" #confirm the remove action
	}
	else{ #want to have a text based else in case these two options are not applied to the csv
		write-host "no action taken please check csv and script comments"
}
}

