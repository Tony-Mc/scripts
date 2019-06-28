root_config_folder="$HOME/.aws"

if [ ! -d $root_config_folder ]; then
    echo "Root AWS config folder does not exist"
    exit
fi

ls -d $root_config_folder/*/