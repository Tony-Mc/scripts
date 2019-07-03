set -e
source "${BASH_SOURCE%/*}/utils/exists.sh"

found=$(commandExists "docker")

if [ "$found" -eq 0 ]; then
    echo "docker is not available"
    exit
else
    running=$(docker ps -q)

    if [ -z $running ]
    then
        echo "Did not find any running containers."
    else
        echo "Stopping containers: $running"
        docker stop $running
    fi
fi