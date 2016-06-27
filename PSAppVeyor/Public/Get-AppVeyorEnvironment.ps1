Function Get-AppVeyorEnvironment {

    [CmdletBinding()]
    [OutputType(
        [AppVeyorEnvironment]
    )]

    Param (
        [Parameter(
            ValueFromPipelineByPropertyName = $true
        )]
        [Int]
        $DeploymentEnvironemntID,

        [Parameter()]
        [Switch]
        $Settings
    )

    Process {
        [AppVeyorEnvironment]::new(
            (Invoke-AppVeyorApi -Method 'GET' -RestMethod 'environments')
        )
    }
}
