Function Remove-AppVeyorProject {
    
    [CmdletBinding(
        ConfirmImpact = 'High',
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

        [Parameter()]
        [Switch]
        $BuildCacheOnly
    )

    Process {
        if ($PSCmdlet.ShouldProcess($ProjectName)) {
            $restMethod = "projects/${AccountName}/${ProjectName}"

            if ($BuildCacheOnly.IsPresent) {
                $restMethod += '/buildcache'
            }

            Invoke-AppVeyorApi -Method 'DELETE' -RestMethod $restMethod
        }
    }
}
