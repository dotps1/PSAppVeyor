Function Remove-AppVeyorEnvironment {

    [CmdletBinding(
        ConfirmImpact = 'High',
        SupportsShouldProcess = $true
    )]
    [OutputType()]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Int]
        $DeploymentEnvironmentID
    )

    Process {
        if ($PSCmdlet.ShouldProcess($DeploymentEnvironmentID)) {
            Invoke-AppVeyorApi -Method 'DELETE' -RestMethod "environments/${DeploymentEnvironmentID}"
        }
    }
}
