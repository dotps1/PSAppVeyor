Function Get-AppVeyorProjectSetting {
    
    [CmdletBinding()]
    [OutputType(
        [AppVeyorProjectSetting]
    )]

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
        if ($Yaml.IsPresent) {
            Invoke-AppVeyorApi -Method 'GET' -RestMethod "projects/${AccountName}/${ProjectName}/settings/yaml"
        } else {
            [AppVeyorProjectSetting]::new(
                (Invoke-AppVeyorApi -Method 'GET' -RestMethod "projects/${AccountName}/${ProjectName}/settings" |
                    Select-Object -ExpandProperty settings)
            )
        }
    }
}
