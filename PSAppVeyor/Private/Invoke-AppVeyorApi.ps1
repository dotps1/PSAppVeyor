Function Invoke-AppVeyorApi {

    [CmdletBinding()]
    [OutputType()]

    Param (
        [Parameter(
            Mandatory = $false
        )]
        [HashTable] 
        $Headers = @{ },
        
        [Parameter(
            Mandatory = $true
        )]
        [String] 
        $Method,

        [Parameter(
            Mandatory = $true
        )]
        [String] 
        $RestMethod,

        [Parameter()]
        [String] 
        $Body = $null
    )

    try {
        [Void][Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
        
        $token = (New-Object -TypeName Windows.Security.Credentials.PasswordVault -ErrorAction Stop).Retrieve(
            'https://appveyor.com', 'PSAppVeyor'
        ).Password
    } catch {
        $_
        return
    }

    $Headers.Add('Authorization', "Bearer $token")
    $Headers.Add('Content-type', 'application/json')

    $request = @{
        Headers = $Headers
        Uri = "https://ci.appveyor.com/api/${RestMethod}"
        Method = $Method
        ErrorAction = 'Stop'
    }

    if (-not ([String]::IsNullOrEmpty($Body))) {
        $request.Add('Body', $Body)
    }

    try {
        Invoke-RestMethod @request
    } catch {
        $message = ConvertFrom-Json -InputObject $_.ErrorDetails.Message |
            Select-Object -ExpandProperty message
    
        if ($null -ne $message) {
            Write-Error -Message $message
            return
        } else {
            Write-Error $_
            return
        }
    }
}
