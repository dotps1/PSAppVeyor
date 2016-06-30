Function Stop-AppVeyorProjectBuild {

    [CmdletBinding(
        ConfirmImpact = 'Medium',
        SupportsShouldProcess = $true
    )]
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
        if ($PSCmdlet.ShouldProcess($ProjectName)) {
            Invoke-AppVeyorApi -Method 'DELETE' -RestMethod "builds/${AccountName}/${ProjectName}/${BuildId}"
        }
    }
}
