#!/bin/bash

usage() {
    echo "Usage: $0 [-d] [-n N] directory" 1>&2
    exit 1
}

list_directories() {
    du -ah "$1" | sort -rh | head -n $num_entries
}

num_entries=8

while getopts ":dn:" opt; do
    case ${opt} in
        d )
            list_directories "$2"
            exit 0
            ;;
        n )
            num_entries=$OPTARG
            ;;
        \? )
            usage
            ;;
        : )
            echo "Invalid option: $OPTARG requries an argument" 1>&2
            usage
            ;;
    esac
done

shift $((OPTIND -1))

if [ -z "$1" ]; then
    usage
fi

list_directories "$1"
