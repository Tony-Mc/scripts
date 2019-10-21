source "${BASH_SOURCE%/*}/utils/exists.sh"

found=$(commandExists "git")

if [ "$found" -eq 0 ]; then
    echo "git is not available"
    exit
else
    if [ -z "$1" ]; then
        echo 'Directory should be provided in the first argument'
        exit 1
    fi
    
    for D in `find $1 -maxdepth 1 -type d`
    do
        pushd $D > /dev/null

        if [ -d ".git" ]; then         
            inMaster=$(git branch | grep "\* master" || true)

            if [ -z "$inMaster" ]; then
                echo "---> $D is not in master, skipping"
            else
                echo "---> $D is in master, pulling"
                git pull
            fi
        fi

        popd > /dev/null
    done
fi