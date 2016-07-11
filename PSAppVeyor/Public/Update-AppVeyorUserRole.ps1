Function Update-AppVeyorUserRole {

    [CmdletBinding(
        ConfirmImpact = 'Medium',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [AppVeyorUserRole]
    )]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [AppVeyorUserRole[]]
        $AppVeyorUserRole
    )

    Process {
        foreach ($item in $AppVeyorUserRole) {
            if ($PSCmdlet.ShouldProcess($item)) {
                [AppVeyorUserRole]::new(
                    (Invoke-AppVeyorApi -Method 'PUT' -RestMethod 'roles' -Body (ConvertTo-Json -InputObject $item -Depth 4))
                )
            }
        }
    }
}
