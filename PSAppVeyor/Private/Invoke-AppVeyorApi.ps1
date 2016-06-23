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

    if (-not (Test-Path -Path $env:AppData\PSAppVeyor\Private\ApiToken.xml)) {
        Write-Error -Exception IO.FileNotFoundException -Message "ApiToken not found.  Use the Set-AppVeyorApiToken function to create the ApiToken."
        return
    } else {
        try {
            $token = (Import-Clixml -Path $env:AppData\PSAppVeyor\Private\ApiToken.xml -ErrorAction Stop).GetNetworkCredential().Password
        } catch {
            Write-Error $_
            return
        }
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
        Write-Error $_
        return
    }
}
