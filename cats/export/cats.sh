#!/bin/sh
echo -ne '\033c\033]0;cats\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/cats.x86_64" "$@"
