param([string]$path = "packages.csv")

Start-Transcript -Path "$($path).log" -Append -IncludeInvocationHeader

if ([System.IO.File]::Exists($path)) {
    $packages = import-csv $path
}
else {
    write-host "File not found at $path"
    exit 1
}

foreach ($package in $packages) {
    if ($package.Skip) {
        write-host "Skipping $($package.Package)"
        continue;
    }
    
    $args = @("upgrade", "$($package.Package)", "--yes")

    if ($package.Version) {
        $args += "--version=$($package.Version)"
    }

    if ($package.Force) {
        $args += "--force"
    }

    Invoke-Expression "choco $args"
}

Stop-Transcript