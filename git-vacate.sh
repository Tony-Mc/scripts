set -e
source "${BASH_SOURCE%/*}/utils/exists.sh"

found=$(commandExists "git")

if [ "$found" -eq 0 ]; then
    echo "git is not available"
    exit
else
    master="master"
    remote="origin"

    git fetch $remote $master
    git checkout -B $master $remote/$master
    source git-clean.sh
fi