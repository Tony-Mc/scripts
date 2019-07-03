set -e
source "${BASH_SOURCE%/*}/utils/exists.sh"

found=$(commandExists "git")

if [ "$found" -eq 0 ]; then
    echo "git is not available"
    exit
else
    current="\*"
    master="master"

    echo "Looking for local merged branches..."
    filtered=$(git branch --merged | egrep -v "(^$current|$master)")

    if [ -z "$filtered" ]
    then
        echo "Did not find any local merged branches."
    else
        echo "Cleaning local merged branches: $filtered"
        git branch -d $filtered
    fi

    echo "Done"

    echo "Pruning remote branches"
    git fetch --prune
    echo "Done"
fi