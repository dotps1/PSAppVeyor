Function Remove-AppVeyorUser {

    [CmdletBinding(
        ConfirmImpact = 'High',
        SupportsShouldProcess = $true
    )]
    [OutputType()]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Int[]]
        $UserId
    )

    Process {
        foreach ($item in $UserId) {
            if ($PSCmdlet.ShouldProcess($item)) {
                Invoke-AppVeyorApi -Method 'DELETE' -RestMethod "users/${item}"
            }
        }
    }
}
