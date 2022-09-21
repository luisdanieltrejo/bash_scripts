#!/bin/bash

FILE=~/example.txt #Replace with file you want to sort

head -n 1 $FILE; tail -n +2 $FILE | sort
