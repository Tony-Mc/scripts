param([string]$path = "packages.csv")

Start-Transcript -Path "$($path).log" -Append -IncludeInvocationHeader

function CommandExists([string] $command) {
    try {
        $cmd = Get-Command $command
        if ($cmd) {
            return 1;
        }
        else {
            return 0;
        }
    }
    catch {
        return 0;
    }
}

if ((CommandExists("chocolatey")) -eq 0) {
    Write-Host "Chocolatey is not installed. Installing...";
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

if ([System.IO.File]::Exists($path)) {
    $packages = import-csv $path
}
else {
    write-host "File not found at $path"
    exit 1
}

write-host "Updating chocolatey..."
choco upgrade "chocolatey" --yes

foreach ($package in $packages) {
    if ($package.Skip) {
        write-host "Skipping $($package.Package)"
        continue;
    }
    
    $choco_args = @("upgrade", "$($package.Package)", "--yes")

    if ($package.Version) {
        $choco_args += "--version=$($package.Version)"
    }

    if ($package.Force) {
        $choco_args += "--force"
    }

    Invoke-Expression "choco $choco_args"
}

Stop-Transcript