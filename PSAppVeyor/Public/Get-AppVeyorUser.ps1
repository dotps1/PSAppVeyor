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
        if ($null -ne $UserId) {
            foreach ($item in $UserId) {
                [AppVeyorUser]::new(
                    (Invoke-AppVeyorApi -Method 'Get' -RestMethod "users/${item}")
                )
            }
        } else {
            foreach ($result in (Invoke-AppVeyorApi -Method 'Get' -RestMethod 'users')) {
                [AppVeyorUser]::new(
                    $result
                )
            }
        }
    }

    End {
        [GC]::Collect()
    }
}
