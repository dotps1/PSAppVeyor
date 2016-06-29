Function Get-AppVeyorUser {

    [CmdletBinding()]
    [OutputType(
        [AppVeyorUser]
    )]

    Param (
        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [Int[]]
        $UserId
    )

    Process {
        if ($null -ne $PSCmdlet.UserId) {
            foreach ($item in $UserId) {
                [AppVeyorUser]::new(
                    (Invoke-AppVeyorApi -Method 'Get' -RestMethod "users/${item}")
                )
            }
        } else {
            [AppVeyorUser]::new(
                (Invoke-AppVeyorApi -Method 'Get' -RestMethod 'users')
            )
        }
    }
}
