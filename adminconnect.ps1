# Main menu loop
function Show-Menu {
    param (
        [string]$Title = 'Admin Connect'
    )
    Clear-Host
    Write-Host "======================== $Title =========================="

    Write-Host "1: Connect to EXO V2"
    Write-Host "2: Connect to TEAMS Shell"
    Write-Host "Q: EXIT"

    "`n"
}

Show-Menu -Title 'Admin Connect'
$selection = Read-Host "Make a selection"

do {
    switch ($selection) {
        # Send user to EXOV2
        '1' {
            Clear-Host
            Write-Host "Connecting to EXO V2 ..."
            "`n"
            Write-Host "Please allow us to connect to Microsoft Auth server. This might take a minute ..."

            # EXOV2
            Set-ExecutionPolicy RemoteSigned -Scope Currentuser
            Install-Module -Name ExchangeOnlineManagement
            Connect-ExchangeOnline
            connect-msolservice

            # Confirm Success
            "`n"
            Write-Host "Successfuly connected to EXOV2 |====================" -ForegroundColor Green
            "`n"
            Write-Host "Consult the following link for CMDLET Documentation:"
            Write-Host "https://bit.ly/3m1FXkY"
            "`n"
            Exit
        }

        # Send user to TEAMS Management Shell
        '2' {
            Clear-Host
            '2 is under construction'
            "`n"
            Write-Host "Successfuly connected to TEAMS Module |====================" -ForegroundColor Green
            "`n"
            Write-Host "Consult the following link for CMDLET Documentation:"
            Write-Host "link"
            "`n"
            Exit
        }
    }
    pause
}
until ($selection -eq 'q')