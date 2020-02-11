# install-packages

## Package list example
```csv
Package,Version,Skip
chocolatey
git
dotnetcore-sdk
nodejs
awscli
```

## Scheduling as a Windows Task
`Actions` -> `Start Program`
- Program: `powershell`
- Arguments: `-NoProfile -ExecutionPolicy ByPass -File "PATH_TO_SCRIPTS\install-packages.ps1" -path "PATH_TO_CONFIGURATION\packages.csv"`
- Replace `PATH_TO_SCRIPTS` and `PATH_TO_CONFIGURATION` in the step above with paths to the files.
