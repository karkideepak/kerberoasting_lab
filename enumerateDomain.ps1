#using powerview
Import-Module .\PowerView.ps1
Get-NetDomain
Get-NetCurrentUser
Get-DomainUser -Properties samaccountname, spn | ?{$_.spn} #key

svc_sql (SPN: MSSQLSvc/sqlserver.corp.local)
svc_iis (SPN: HTTP/web.corp.local)
svc_backup (SPN: backup/something)
