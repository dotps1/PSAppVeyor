Function Update-AppVeyorUser {

    [CmdletBinding()]
    [OutputType(
        [Void]
    )]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Int]
        $UserId,

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNull()]
        [String]
        $FullName = $null,

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNull()]
        [String]
        $Email = $null,

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNull()]
        [Int]
        $RoleId = $null,

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNull()]
        [String]
        $SuccessfulBuildNotification = $null,

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [ValidateNotNull()]
        [String]
        $FailedBuildNotification = $null,

        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [Bool]
        $NotifyWhenBuildStatusChangedOnly
    )

    Process {
        try {
            $currentUser = Get-AppVeyorUser -UserId $UserId
        } catch {
            $_
            return
        }

        $body = @{
            userId = $UserId
            fullName = $currentUser.FullName
            email = $currentUser.Email
            password = $null
            roleId = $currentUser.RoleId
            successfulBuildNotification = $currentUser.SuccessfulBuildNotification
            failedBuildNotification = $currentUser.FailedBuildNotification
            notifyWhenBuildStatusChangedOnly = $currentUser.NotifyWhenBuildStatusChangedOnly
        }

        foreach ($parameter in $PSBoundParameters) {
            if ($null -ne $parameter) {
                $body.$($parameter.Keys) = $parameter.Values
            }
        }

        Invoke-AppVeyorApi -Method 'POST' -RestMethod 'users' -Body (ConvertTo-Json -InputObject $body)
    }
}
