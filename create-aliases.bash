#!/bin/bash


#Readme
# chmod +x create-aliases.bash
# bash create-aliases.bash
# OR
# insert  to create-aliases(){..} to ~/.bashrc
# source ~/.bashrc
# create-aliases


create-aliases() {
    local SOURCE_DIR="$HOME/dotfiles/bash"
    local TARGET_FILE="$(pwd)/.bash_aliases"

    if [ -f "$TARGET_FILE" ]; then
    echo "" > $TARGET_FILE;
    fi

    for item in $(ls $SOURCE_DIR); do
        {
            echo -e "\n# =====$item=====" >> "$TARGET_FILE"
            cat "$SOURCE_DIR/$item"  >> "$TARGET_FILE"
        }
    done

    if [ -f "$TARGET_FILE" ]; then
    echo "Created $TARGET_FILE"
    fi
}

create-aliases
