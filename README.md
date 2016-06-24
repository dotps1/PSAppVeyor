# PSAppVeyor
### A PowerShell Module providing functions to interact with the [AppVeyor](www.appveyor.com) REST API.

This module is still very beta, infact, we will just call it alpha.

To get started after you install/import it, you need to use the `Set-AppVeyorApiToken` cmdlet.  You can get the reqired value from your [AppVeyor Account](https://ci.appveyor.com/api-token).

After that, there is currently only a few commands available.  Use the Get-Command cmdlet to check them out.

```
PS GitHub:\> Get-Command -Module PSAppVeyor

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Get-AppVeyorBuild                                  0.1.1      PSAppVeyor
Function        Get-AppVeyorProject                                0.1.1      PSAppVeyor
Function        Get-AppVeyorProjectSetting                         0.1.1      PSAppVeyor
Function        Set-AppVeyorApiToken                               0.1.1      PSAppVeyor
Function        Update-AppVeyorProjectBuildNumber                  0.1.1      PSAppVeyor
```

I havent had a whole lot of time to put into this, but I will keep adding functionallity.

have fun.
