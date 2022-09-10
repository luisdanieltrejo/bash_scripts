#!/bin/bash

## First make a copy of the original file ##
cp ~/.bashrc ~/.bashrc.orig

## This add a new line at the end of your .bashrc file ##
echo -e "## This option enables history to be formatted by YEAR-month-day TIME ##\nHISTTIMEFORMAT=\"""%Y-%m-%d %T \"""" >> ~/.bashrc
