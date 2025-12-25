#!/bin/bash

file=$(readlink -f $1)
echo "Se cambiará al siguiente fichero:"
echo $file
ln -sfn $file ~/.config/nvim
