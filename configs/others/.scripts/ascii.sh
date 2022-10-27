#!/bin/sh

# Folder with ascii art
dir=$HOME/Pictures/ASCII/

sh $dir$(ls $dir | shuf -n 1)
