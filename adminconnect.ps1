# Main menu loop
function Show-Menu {
    param (
        [string]$Title = 'Admin Connect'
    )
    Clear-Host
    Write-Host "======================== $Title =========================="

    "`n"

    Write-Host "1: Connect to EXO V2"
    Write-Host "2: Connect to MSOL"
    Write-Host "3: Connect to Azure Active Directory"
    Write-Host "4: Connect to TEAMS Module"
    Write-Host "5: Connect to SharePoint Module"
    Write-Host "6: Connect to Security & Compliance Center"
    Write-Host "Q: EXIT"

    "`n"
}

function Connect-Exo {

    Clear-Host
    Write-Host "Connecting to EXO V2 ..."
    "`n"
    Write-Host "Fetching EXO. This might take a minute ..."

    # EXOV2
    Set-ExecutionPolicy RemoteSigned -Scope Currentuser
    Install-Module -Name ExchangeOnlineManagement

    Connect-ExchangeOnline -ShowProgress $true -Credential $credential
    Connect-MsolService -ShowProgress $true -Credential $credential

    # Confirm Success
    "`n"
    Write-Host "Successfuly connected to EXOV2 |====================" -ForegroundColor Green
    "`n"
    Write-Host "Consult the following link for CMDLET Documentation:"
    Write-Host "https://bit.ly/3m1FXkY"
    "`n"
    Exit
}

function Connect-Msol {

    Clear-Host
            
    # MSOL
    Set-ExecutionPolicy RemoteSigned -Scope Currentuser
    Connect-MsolService -Credential $credential

    # Confirm Success
    "`n"
    Write-Host "Successfuly connected to MSOL Module |====================" -ForegroundColor Green
    "`n"
    Write-Host "Consult the following link for CMDLET Documentation:"
    Write-Host "link"
    "`n"
    Exit
}

function Connect-ADD {

    Clear-Host
    Write-Host "Connecting to Azure Active Directory ..."
    "`n"
    Write-Host "Fetching ADD. This might take a minute ..."
    
    # ADD
    Connect-AzureAD -Credential $credential
    Connect-MsolService -Credential $credential

    # Confirm Success
    "`n"
    Write-Host "Successfuly connected to Azure Active Directory |====================" -ForegroundColor Green
    "`n"
    Write-Host "Consult the following link for CMDLET Documentation:"
    Write-Host "link"
    "`n"
    Exit
}

function Connect-Teams {

    Clear-Host
    Write-Host "Connecting to Teams ..."
    "`n"
    Write-Host "Fetching Teams. This might take a minute ..."
    
    # TEAMS
    Import-Module MicrosoftTeams
    Connect-MicrosoftTeams -Credential $credential

    # Confirm Success
    "`n"
    Write-Host "Successfuly connected to TEAMS Module |====================" -ForegroundColor Green
    "`n"
    Write-Host "Consult the following link for CMDLET Documentation:"
    Write-Host "link"
    "`n"
    Exit
}

function Connect-SP {

    Clear-Host
    Write-Host "Connecting to SharePoint ..."
    "`n"
    $orgName = Read-Host "Company name"
    "`n"
    Write-Host "Fetching SP. This might take a minute ..."
    
    # SharePoint
    Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
    Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $Credential

    # Confirm Success
    "`n"
    Write-Host "Successfuly connected to Sharepoint Module |====================" -ForegroundColor Green
    "`n"
    Write-Host "Consult the following link for CMDLET Documentation:"
    Write-Host "link"
    "`n"
    Exit
}

function Connect-SCC {

    Clear-Host
    Write-Host "Connecting to Security & Compliance Center ..."
    "`n"
    Write-Host "Fetching SCC. This might take a minute ..."
    
    # SCC
    $acctName= Read-Host "Account UPN (ex: test@contoso.com)"
    Connect-IPPSSession -UserPrincipalName $acctName

    # Confirm Success
    "`n"
    Write-Host "Successfuly connected to Security & Compliance Center |====================" -ForegroundColor Green
    "`n"
    Write-Host "Consult the following link for CMDLET Documentation:"
    Write-Host "link"
    "`n"
    Exit
}

$credential = Get-Credential
Show-Menu -Title 'Admin Connect'
$selection = Read-Host "Make a selection"

do {
    switch ($selection) {

        # Send user to EXOV2
        '1' {
            Connect-Exo
        }

        # Send user to MSOL Shell
        '2' {
            Connect-Msol
        }

        # Send user to ADD Module
        '3' {
            Connect-ADD
        }

        # Send user to TEAMS Module
        '4' {
            Connect-Teams
        }

        # Send user to SharePoint Module
        '5' {
            Connect-SP
        }

        # Send user to Security & Compliance Center
        '6' {
            Connect-SCC
        }
    }
    pause
}
until ($selection -eq 'q')