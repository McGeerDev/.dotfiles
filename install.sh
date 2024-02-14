#!/usr/bin/env bash

pushd .

# Check if STOW_FOLDERS variable is set
if [ -z $STOW_FOLDERS ]; then
    echo "Error: STOW_FOLDERS variable is not set."
    exit 1
fi

pushd . || { echo "Error: Unable to push directory onto the stack."; exit 1; }
for folder in $(echo "$STOW_FOLDERS" | sed "s/,/ /g")
do
    stow -D $folder || { echo "Error: Unable to unstow $folder."; popd; exit 1; }
    stow $folder || { echo "Error: Unable to stow $folder."; popd; exit 1; }
done
popd || { echo "Error: Unable to pop directory off the stack."; exit 1; }
