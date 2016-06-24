Function Start-AppVeyorProjectBuild {

    [CmdletBinding()]
    [OutputType(
        [AppVeyorBuild]
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
            ValueFromPipelineByPropertyName = $true
        )]
        [Alias(
            'Slug'
        )]
        [String]
        $ProjectName,

        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'LatestBuild',
            ValueFromPipelineByPropertyName = $true
        )]
        [Parameter(
            Mandatory = $true,
            ParameterSetName = 'CommitId',
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Branch,

        [Parameter(
            ParameterSetName = 'LatestBuild'
        )]
        [HashTable]
        $EnvironmentVariable = $null,

        [Parameter(
            ParameterSetName = 'CommitId'
        )]
        [String]
        $CommitId,

        [Parameter(
            ParameterSetName = 'GitHubPullRequest'
        )]
        [Int]
        $GitHubPullRequestId
    )

    Process {
        $body = @{
            'accountName' = $AccountName
            'projectSlug' = $ProjectName 
        }

        switch ($PSCmdlet.ParameterSetName) {
            'LatestBuild' {
                $body.Add('branch', $Branch)

                if (-null -ne $EnvironmentVariable) {
                    $body.Add('environmentVariables', $EnvironmentVariable)
                }
            }

            'CommitId' {
                $body.Add('branch', $Branch)
                $body.Add('commitId', $CommitId)
            }

            'GitHubPullRequest' {
                $body.Add('pullRequestId', $GitHubPullRequestId)
            }
        }

        [AppVeyorBuild]::new(
            (Invoke-AppVeyorApi -Method 'POST' -RestMethod 'builds' -Body (ConvertTo-Json -InputObject $body))
        )
    }
}
