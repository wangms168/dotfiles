#!/bin/bash

function main() {
    for dotfile in $(dotfiles) ; do
        if [[ -L "$HOME/$dotfile" ]]; then
            check_existing_symlink $dotfile
        else
            create_symlink_if_possible $dotfile
        fi
    done
}

function check_existing_symlink() {
    local dotfile=$1
    local target=$(readlink -f $HOME/$dotfile)

    if [[ "$target" != "`dotdir $dotfile`" ]]; then
        warn "$dotfile \t symlink points elsewhere -> $target"
    else
        ok "$dotfile \t already linked"
    fi
}

function create_symlink_if_possible() {
    local dotfile=$1

    if [[ -e "$HOME/$dotfile" ]]; then
        warn "$dotfile \t can't create symlink, regular file is in the way."
    else
        ok "$dotfile \t creating link"
        ln -s "`dotdir $dotfile`" "$HOME"
    fi
}

function dotdir() {
    cd `dirname "${BASH_SOURCE[0]}"` && echo "`pwd`/$1"
}
# ${BASH_SOURCE[0]} = ./install.sh
# `dirname "${BASH_SOURCE[0]}"` = .

function dotfiles() {
    find `dotdir` -maxdepth 1 -name '.*' -not -name '.git' -printf '%f\n'
    # -printf '%f\n' 是将前面在当前目录find到的文件（含路径和文件名）只截止后面的文件名，并一个一个地转行。
}

function warn() {
    echo -e "WARN\t$1"
}
function ok()   {
    echo -e "OK\t$1"
}


main
