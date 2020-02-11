param([string]$path = "packages.csv")

if ([System.IO.File]::Exists($path)) {
    $packages = import-csv $file
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
    
    if ($package.Version) {
        write-host "Installing $($package.Package) $($package.Version)"
        
        choco upgrade $package.Package --version=$($package.Version) --yes
    }
    else {
        write-host "Installing $($package.Package)"

        choco upgrade $package.Package --yes
    }
}