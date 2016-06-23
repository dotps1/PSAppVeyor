Function Set-AppVeyorApiToken {
    
    [CmdletBinding()]
    [OutputType(
        [Void]
    )]

    Param (
        [Parameter(
            HelpMessage = 'The value of a token from https://ci.appveyor.com/api-token.',
            Mandatory = $true
        )]
        [String]
        $Token
    )

    if (-not (Test-Path -Path "$env:AppData\PSAppVeyor\Private")) {
        try {
            New-Item -Path "$env:AppData\PSAppVeyor" -Name 'Private' -ItemType 'Directory' -ErrorAction 'Stop' |
                Out-Null
        } catch {
            $_
            return
        }
    }

    try {
        New-Object -TypeName 'System.Management.Automation.PSCredential' -ArgumentList $env:UserName, (ConvertTo-SecureString -String $Token -AsPlainText -Force) | 
            Export-Clixml -Path "$env:AppData\PSAppVeyor\Private\ApiToken.xml" -Force |
                Out-Null
    } catch {
        $_
        return
    }
}
