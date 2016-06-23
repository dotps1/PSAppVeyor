# https://www.appveyor.com/docs/api/

Class AppVeyorProject {
    [Int]$ProjectId
    [Int]$AccountId
    [String]$AccountName
    [AppVeyorBuild[]]$Builds
    [String]$Name
    [String]$Slug
    [AppVeyorRepositoryType]$RepositoryType
    [String]$RepositoryScm
    [String]$RepositoryName
    [String]$RepositoryBranch
    [Bool]$IsPrivate
    [Bool]$SkipBranchesWithoutAppVeyorYml
    [Bool]$EnableSecureVariablesInPullRequests
    [Bool]$EnableDeploymentInPullRequests
    [Bool]$AlwaysBuildClosedPullRequests
    [Bool]$RollingBuilds
    [AppVeyorNuGetFeed]$NuGetFeed
    [AppVeyorSecurityDescriptor]$SecurityDescriptor
    [Nullable[DateTime]]$Created
    [Nullable[DateTime]]$Updated

    AppVeyorProject([Object]$object) {
        $this.ProjectId = $object.projectId
        $this.AccountId = $object.accountId
        $this.AccountName = $object.accountName
        $this.Builds = $object.builds
        $this.Name = $object.name
        $this.Slug = $object.slug
        $this.RepositoryType = $object.repositoryType
        $this.RepositoryScm = $object.repositoryScm
        $this.RepositoryName = $object.repositoryName
        $this.RepositoryBranch = $object.repositoryBranch
        $this.IsPrivate = $object.isPrivate
        $this.SkipBranchesWithoutAppVeyorYml = $object.skipBranchesWithoutAppveyorYml
        $this.EnableSecureVariablesInPullRequests = $object.enableSecureVariablesInPullRequests
        $this.EnableDeploymentInPullRequests = $object.enableDeploymentInPullRequests
        $this.AlwaysBuildClosedPullRequests = $object.alwaysBuildClosedPullRequests
        $this.RollingBuilds = $object.rollingBuilds
        $this.NuGetFeed = $object.nuGetFeed
        $this.SecurityDescriptor = $object.securityDescriptor
        $this.Created = $object.created
        $this.Updated = $object.updated
    }
}

Class AppVeyorBuild {
    [Int]$BuildId
    [AppVeyorJob[]]$Jobs
    [Int]$BuildNumber
    [Version]$Version
    [String]$Message
    [String]$MessageExtended
    [String]$Branch
    [String]$CommitId
    [String]$AuthorName
    [String]$AuthorUserName
    [String]$CommitterName
    [String]$CommitterUserName
    [Nullable[DateTime]]$Committed
    [AppVeyorMessage[]]$Messages
    [String]$Status
    [Nullable[DateTime]]$Started
    [Nullable[DateTime]]$Finished
    [Nullable[DateTime]]$Created
    [Nullable[DateTime]]$Updated

    AppVeyorBuild([Object]$object) {
        $this.BuildId = $object.buildId
        $this.Jobs = $object.jobs
        $this.BuildNumber = $object.buildNumber
        $this.Version = $object.version
        $this.Message = $object.message
        $this.MessageExtended = $object.messageExtended
        $this.Branch = $object.branch
        $this.CommitId = $object.commitId
        $this.AuthorName = $object.authorName
        $this.AuthorUserName = $object.authorUsername
        $this.CommitterName = $object.committerName
        $this.CommitterUserName = $object.committerUsername
        $this.Committed = $object.committed
        $this.Messages = $this.messages
        $this.Status = $object.status
        $this.Started = $object.started
        $this.Finished = $object.finished
        $this.Created = $object.created
        $this.Updated = $object.updated
    }
}

Class AppVeyorJob {
    [String]$JobId
    [String]$Name
    [Bool]$AllowFailure
    [Int]$MessagesCount
    [Int]$CompilationMessagesCount
    [Int]$CompilationErrorsCount
    [Int]$CompilationWarningsCount
    [Int]$TestsCount
    [Int]$PassedTestsCount
    [Int]$FailedTestsCount
    [Int]$ArtifactsCount
    [String]$Status
    [Nullable[DateTime]]$Started
    [Nullable[DateTime]]$Finished
    [Nullable[DateTime]]$Created
    [Nullable[DateTime]]$Updated

    AppVeyorJob([Object]$object) {
        $this.JobId = $object.jobId
        $this.Name = $object.name
        $this.AllowFailure = $object.allowFailure
        $this.MessagesCount = $object.messagesCount
        $this.CompilationMessagesCount = $object.compilationMessagesCount
        $this.CompilationErrorsCount = $object.compilationErrorsCount
        $this.CompilationWarningsCount = $object.compilationWarningsCount
        $this.TestsCount = $object.testsCount
        $this.PassedTestsCount = $object.passedTestsCount
        $this.FailedTestsCount = $object.failedTestsCount
        $this.ArtifactsCount = $object.artifactsCount
        $this.Status = $object.status
        $this.Started = $object.started
        $this.Finished = $object.finished
        $this.Created = $object.created
        $this.Updated = $object.updated
    }
}

Class AppVeyorMessage {
    AppVeyorMessage() { }
}

Class AppVeyorNuGetFeed {
    [String]$Id
    [String]$Name
    [Bool]$PublishingEnabled
    [DateTime]$Created

    AppVeyorNuGetFeed([Object]$object) {
        $this.Id = $object.id
        $this.Name = $object.name
        $this.PublishingEnabled = $object.publishingEnabled
        $this.Created = $object.created
    }
}

Class AppVeyorSecurityDescriptor {
    [AppVeyorAccessRightsDefinition[]]$AccessRightDefinitions
    [AppVeyorRoleAce[]]$RoleAces

    AppVeyorSecurityDescriptor([Object]$object) {
        $this.AccessRightDefinitions = $object.accessRightDefinitions
        $this.RoleAces = $object.roleAces
    }
}

Class AppVeyorRoleAce {
    [Int]$RoleId
    [String]$Name
    [Bool]$IsAdmin
    [AppVeyorAccessRight[]]$AccessRights

    AppVeyorRoleAce([Object]$object) {
        $this.RoleId = $object.roleId
        $this.Name = $object.name
        $this.IsAdmin = $object.isAdmin
        $this.AccessRights = $object.accessRights
    }
}

Class AppVeyorAccessRightsDefinition {
    [String]$Name
    [String]$Description

    AppVeyorAccessRightsDefinition([Object]$object) {
        $this.Name = $object.name
        $this.Description = $object.description
    }
}

Class AppVeyorAccessRight {
    [String]$Name
    [Bool]$Allowed

    AppVeyorAccessRight([Object]$object) {
        $this.Name = $object.name
        $this.Allowed = $object.allowed
    }
}

Enum AppVeyorRepositoryType {
    gitHub
    bitBucket
    vso
    gitLab
    kiln
    stash
    gitHubmercurial
    subversion
}
