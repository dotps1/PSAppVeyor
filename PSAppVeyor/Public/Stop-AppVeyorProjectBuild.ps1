Function Stop-AppVeyorProjectBuild {

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
        [String]
        $ProjectName,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Int]
        $BuildId
    )

    Process {
        Invoke-AppVeyorApi -Method 'DELETE' -RestMethod "builds/${AccountName}/${ProjectName}/${BuildId}"
    }
}
