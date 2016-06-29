Function Get-AppVeyorProjectDeployment {
    
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
        [String]
        $ProjectName
    )

    Process {
        Invoke-AppVeyorApi -Method 'GET' -RestMethod "projects/${AccountName}/${ProjectName}/deployments" |
            Select-Object -ExpandProperty project
    }
}
