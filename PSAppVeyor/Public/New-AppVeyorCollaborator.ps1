Function New-AppVeyorCollaborator {

    [CmdletBinding(
        ConfirmImpact = 'Medium',
        SupportsShouldProcess = $true
    )]
    [OutputType()]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Email,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Int]
        $RoleId
    )

    Process {
        if ($PSCmdlet.ShouldProcess($Email)) {
            $body = @{
                'email' = $Email
                'roleId' = $RoleId
            }

            Invoke-AppVeyorApi -Method 'POST' -RestMethod 'collaborators' -Body (ConvertTo-Json -InputObject $body)
        }
    }
}
