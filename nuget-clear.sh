set -e
source "utils/exists.sh"

found=$(commandExists "dotnet")

if [ "$found" -eq 0 ]; then
    echo "dotnet is not available"
    exit
else
    dotnet nuget locals all --clear
fi