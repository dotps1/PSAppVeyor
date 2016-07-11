Function Get-AppVeyorUserRole {

    [CmdletBinding(
        DefaultParameterSetName = '__AllParameterSets'
    )]
    [OutputType(
        [AppVeyorUserRole]
    )]

    Param (
        [Parameter(
            HelpMessage = 'Also retreives the groups associated to each role.',
            ParameterSetName = 'IncludeGroups'
        )]
        [Switch]
        $IncludeGroups,

        [Parameter(
            HelpMessage = 'The Id of a specific role.',
            ParameterSetName = 'RoleId',
            ValueFromPipelineByPropertyName = $true
        )]
        [Int[]]
        $RoleId = $null
    )

    Process {
        if ($null -ne $RoleId) {
            foreach ($item in $RoleId) {
                [AppVeyorUserRole]::new(
                    (Invoke-AppVeyorApi -Method 'GET' -RestMethod "roles/${item}")
                )
            }
        } else {
            foreach ($result in (Invoke-AppVeyorApi -Method 'GET' -RestMethod 'roles')) {
                [AppVeyorUserRole]::new(
                    $result, $IncludeGroups.IsPresent
                )
            }
        }
    }
}
