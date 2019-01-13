#!/bin/bash

commons=$(ls | grep common)
for item in $commons 
do
    ln -sf $(pwd)/$item ${HOME}/${item##common}
done
