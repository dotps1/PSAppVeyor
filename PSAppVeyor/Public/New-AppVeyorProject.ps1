Function New-AppVeyorProject {

    [CmdletBinding(
        ConfirmImpact = 'Medium',
        SupportsShouldProcess = $true
    )]
    [OutputType(
        [AppVeyorProject]
    )]

    Param (
        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $AccountName,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true`
        )]
        [String]
        $ProjectName,

        [Parameter(
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [AppVeyorProjectRepositoryType]
        $RepositoryProvider
    )

    Process {
        if ($PSCmdlet.ShouldProcess($ProjectName)) {
            $body = @{
                repositoryProvider = $RepositoryProvider.ToString()
                repositoryName = "${AccountName}/${ProjectName}"
            }
        
            [AppVeyorProject]::new(
                (Invoke-AppVeyorApi -Method 'POST' -RestMethod projects -Body (ConvertTo-Json -InputObject $body))
            )
        }
    }
}
