#!/bin/bash

function dotdir() {
    cd `dirname "${BASH_SOURCE[0]}"` && echo "`pwd`/$1"
}

function dotfiles() {
    find `dotdir` -maxdepth 1 -name '.*' -not -name '.git' -printf '%f\n'
}

dotfiles
