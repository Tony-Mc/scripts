# install-packages

## Package list
```csv
Package,Version,Skip
chocolatey
git,,true
dotnetcore-sdk
nodejs
awscli,1.17.13
```

### Configuration
#### Package
Choco package id, **required**.
#### Version
Package version, _optional_.

When provided the script will install the specified version, otherwise latest.
#### Skip
Set to `true` to skip installing a package, _optional_.

## Scheduling as a Windows Task
`Actions` -> `Start Program`
- Program: `powershell`
- Arguments: `-NoProfile -ExecutionPolicy ByPass -File "PATH_TO_SCRIPTS\install-packages.ps1" -path "PATH_TO_CONFIGURATION\packages.csv"`
- Replace `PATH_TO_SCRIPTS` and `PATH_TO_CONFIGURATION` in the step above with paths to the files.
