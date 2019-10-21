set -e
source "${BASH_SOURCE%/*}/utils/exists.sh"

found=$(commandExists "docker")

if [ "$found" -eq 0 ]; then
    echo "docker is not available"
    exit
else
    if [ -z "$1" ]; then
        echo 'Name should be provided in the first argument'
        exit 1
    fi

    if [ -z "$2" ]; then
        port="5432"
    else
        port=$2
    fi

    if [ -z "$3" ]; then
        password="password"
    else
        password=$3
    fi

    error_file="error.txt"
    if $(docker run --name $1 -p $port:5432 -e POSTGRES_PASSWORD=$password -d postgres 2> $error_file); then
        echo "Running postgres '$1' on port $port with 'password' $password: $running"
    else
        errorCode=$?
        errorMsg=$(cat $error_file)

        pat=".*The container name \"\/$1\" is already in use by container \"(.*)\".*"
        if [[ $errorMsg =~ $pat ]]; then
            rm $error_file
            echo "Name ($1) already in use by ${BASH_REMATCH[1]}"
        else
            echo "Docker failed with error code $errorCode; See $error_file for details."
        fi
    fi
fi