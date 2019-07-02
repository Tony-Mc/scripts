set -e

root_config_folder="$HOME/.aws"

if [ ! -d $root_config_folder ]; then
    echo "Root AWS config folder does not exist"
    exit
fi

config_name=$1

config_folder="$root_config_folder/$config_name"

if [ ! -d $config_folder ]; then
    echo "Provided AWS config name ($config_name) does not exist"
    exit
fi

echo "Applying $config_name"
cp -r "$config_folder/." "$root_config_folder/"
echo "Done."