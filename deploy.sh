#!/bin/bash

ANSIBLE_PLAYBOOK="ansible-playbook"

usage() {
    echo "Usage: $0 -h <host> [-t <tags>] [-v]"
    echo "Hosts available: wsl, macos, windows"
    echo "  -t: Optional tags (e.g., \"terminal,zsh\")"
    echo "  -v: Increase verbosity (can be used multiple times, e.g., -vv or -vvv)"
    echo "Example: $0 -h macos -t \"terminal,zsh\" -vv"
    echo "       : $0 -h macos -vv"
    exit 1
}

if [ $# -eq 0 ]; then
    usage
fi

VERBOSITY=""
HOST=""
TAGS=""

while getopts "h:t:v" opt; do
    case $opt in
        h) HOST="$OPTARG";;
        t) TAGS="$OPTARG";;
        v) VERBOSITY="${VERBOSITY}v";;
        ?) usage;;
    esac
done

# Check if HOST is provided
if [ -z "$HOST" ]; then
    echo "Error: -h is required."
    usage
fi

# Construct the verbosity flag if it exists
VERBOSE_FLAG=""
if [ -n "$VERBOSITY" ]; then
    VERBOSE_FLAG="-${VERBOSITY}"
fi

# Construct the tags argument if tags are provided
TAGS_ARG=""
if [ -n "$TAGS" ]; then
    TAGS_ARG="--tags \"$TAGS\""
fi

case "$HOST" in
    "wsl")
        $ANSIBLE_PLAYBOOK ./roles/wsl/main.yml $TAGS_ARG $VERBOSE_FLAG
        ;;
    "macos")
        $ANSIBLE_PLAYBOOK ./roles/macos/main.yml $TAGS_ARG $VERBOSE_FLAG
        ;;
    "windows")
        $ANSIBLE_PLAYBOOK ./roles/windows/main.yml $TAGS_ARG $VERBOSE_FLAG
        ;;
    *)
        echo "Error: Invalid host specified. Available hosts: wsl, macos, windows"
        usage
        ;;
esac