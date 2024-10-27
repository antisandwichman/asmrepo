## Installing scoop

    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
## Adding the bucket to scoop
    scoop bucket add asmrepo https://github.com/antisandwichman/asmrepo
## Available Apps
**ASM-ERSM** - Elden Ring save manager

**EldenRingSeamlessCoop** - Elden Ring Seamless Coop mode 

**PSModule-PSSettings** - A PowerShell module I wrote to create and modify settings for a script using JSON

**keiths-admin-script** - A script for systems administrators that contains some common functions
## Installing an app

    scoop install asmrepo/appname
## Updating an app

    scoop update appname

