Function Get-AppVeyorProjectSetting {
    
    [CmdletBinding()]
    [OutputType()]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $AccountName,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias(
            'Slug'
        )]
        [String]
        $ProjectName,

        [Parameter()]
        [Switch]
        $Yaml
    )

    Process {
        $apiParameters = @{
            Method = 'GET'
            RestMethod = "projects/${AccountName}/${ProjectName}/settings"
        }

        if ($Yaml.IsPresent) {
            $apiParameters.RestMethod += '/yaml'
        }

        Invoke-AppVeyorApi @apiParameters
    }
}
