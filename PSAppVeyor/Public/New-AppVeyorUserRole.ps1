Function New-AppVeyorUserRole {

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
        [String[]]
        $Name
    )

    Process {
        foreach ($item in $Name) {
            if ($PSCmdlet.ShouldProcess($item)) {
                $body = @{
                    name = $item
                }

                [AppVeyorUserRole]::new(
                    (Invoke-AppVeyorApi -Method 'POST' -RestMethod 'roles' -Body (ConvertTo-Json -InputObject $body))
                )
            }
        }
    }
}
