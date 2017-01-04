Function Start-AppVeyorProjectBuild {

    [CmdletBinding(
        SupportsShouldProcess = $true
    )]
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
            ParameterSetName = 'Branch',
            ValueFromPipelineByPropertyName = $true
        )]
        [String]
        $Branch,

        [Parameter(
            ParameterSetName = 'Branch'
        )]
        [Parameter(
            ParameterSetName = 'GitHubPullRequest'
        )]
        [HashTable]
        $EnvironmentVariable = $null,

        [Parameter(
            ParameterSetName = 'Branch'
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
            'Branch' {
                $body.Add(
                    'branch', $Branch
                )

                if ($null -ne $CommitId) {
                    $body.Add('commitId', $CommitId)
                }
            }

            'GitHubPullRequest' {
                $body.Add(
                    'pullRequestId', $GitHubPullRequestId
                )
            }
        }

        if ($null -ne $EnvironmentVariable) {
            $body.Add('environmentVariables', $EnvironmentVariable)
        }

        if ($PSCmdlet.ShouldProcess($body)) {
            [AppVeyorBuild]::new(
                (Invoke-AppVeyorApi -Method 'POST' -RestMethod 'builds' -Body (ConvertTo-Json -InputObject $body))
            )
        }
    }
}
