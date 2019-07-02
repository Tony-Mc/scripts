commandExists() {
    if ! [ -x "$(command -v $1)" ]; then
        echo 0
        return
    fi

    echo 1
}