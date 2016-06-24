Function Remove-AppVeyorProject {
    
    [CmdletBinding()]
    [OutputType(
        [Void]
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
        $ProjectName
    )

    Process {
        Invoke-AppVeyorApi -Method 'DELETE' -RestMethod "projects/${AccountName}/${ProjectName}"
    }
}
