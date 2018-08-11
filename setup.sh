#!/bin/bash

commons=$(ls | grep common)
for item in $commons 
do
    ln -s $(pwd)/$item ${HOME}/${item##common}
done
