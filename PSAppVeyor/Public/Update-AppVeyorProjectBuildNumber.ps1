Function Update-AppVeyorProjectBuildNumber {

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
        [Alias(
            'Slug'
        )]
        [String]
        $ProjectName,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Int]
        $BuildNumber
    )

    Process {
        if ($PSCmdlet.ShouldProcess($ProjectName)) {
            $body = @{
                nextBuildNumber = $BuildNumber
            }

            Invoke-AppVeyorApi -Method 'PUT' -RestMethod "projects/${AccountName}/${ProjectName}/settings/build-number" -Body (ConvertTo-Json -InputObject $body)
        }
    }
}
