Function New-AppVeyorUser {

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
        $FullName,

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
        if ($PSCmdlet.ShouldProcess($FullName)) {
            $body = @{
                'fullName' = $FullName
                'email' = $Email
                'roleId' = $RoleId
                'generatePassword' = $true
                'password' = $null
                'confirmPassword' = $null
            }

            Invoke-AppVeyorApi -Method 'POST' -RestMethod 'users' -Body (ConvertTo-Json -InputObject $body)
        }
    }
}
