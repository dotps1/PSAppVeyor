Function Remove-AppVeyorUserRole {
    
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
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Int[]]
        $RoleId
    )

    Process {
        foreach ($item in $RoleId) {
            if ($PSCmdlet.ShouldProcess($item)) {
                Invoke-AppVeyorApi -Method 'DELETE' -RestMethod "roles/${item}"
            }
        }
    }
}
