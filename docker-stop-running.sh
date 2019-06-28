running=$(docker ps -q)

if [ -z $running ]
then
    echo "Did not find any running containers."
else
    echo "Stopping containers: $running"
    docker stop $running
fi