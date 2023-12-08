#Stephen Sparks
Import-Module ActiveDirectory

$GroupCreation = Import-Csv C:\Users\Administrator\Downloads\Securitygroups.csv #set csv path

foreach ($Group in $GroupCreation){ #loop thru csv data save to variables 

$name = $Group.name
$description = $Group.description
$oupath = $Group.oupath
$scope = $Group.scope
$category = $Group.category

if (Get-ADGroup -F {cn -eq $name}){ #check to make sure group does not already exist 
		Write-Host "Group $name already exist" #message and skip if group already exist
}
	else{ #else add a new group No action check is this the best way to do this? 
		New-ADGroup `
			-Name $name `
			-Description $description `
			-Path $oupath `
			-GroupCategory $category `
			-GroupScope $scope `
			

		Write-Host "Group $name created Cat: $category - Scope: $scope" #write to confirm the group is made
}
}