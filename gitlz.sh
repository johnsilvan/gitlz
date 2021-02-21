#!/usr/bin/env bash

VERSION="0.0.1"

version() {
    printf "gitlz $VERSION - the lazy way to use git\n"
}

display_help() {
   cat <<-EOF
  usage:
    gitlz  [options] [COMMAND] [args]
  commands:
    gitlz Add, commit, and push to remote in case extreme laziness!
    gitlz <message>              Execute gitlz with <message> for commit message
  options:
    -V, --version                   Output current version of gitlz
    -h, --help                      Display this help information
EOF
	exit 0 
}

current_epoch() {
	date +%s
}

case $1 in
	-V|--version) version; exit 0 ;;
	-h|--help) display_help; exit 0 ;;
esac

gitlz() {
    #echo "All the arguments are: $@"
    echo "first arg $1"
    echo "second arg $2"
    getopts "m:" opt
    message="$OPTARG"
    if [ -z "$message" ] 
    then
      message="Lazy! commiting - $(current_epoch)."
      echo "no message specified using: $message"
    fi
}

gitlz "$@"