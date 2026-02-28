#using powerview
Import-Module .\PowerView.ps1
Get-NetDomain
Get-NetCurrentUser
Get-DomainUser -Properties samaccountname, spn | ?{$_.spn} #key
