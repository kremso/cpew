#!/bin/bash

## Create new eclipse workspace and copy the settings from the old workspace
## Tomas Kramar, kramar.tomas@gmail.com, 2008
##
## This code is free, you may do whatever you want with it.

function die {
	echo $1
	exit 1
}

if [ $(whoami) = "root" ]; then
	echo "Don't do this as root"
	exit 1
fi

if [ "$#" = "1" -a "$1" = "-i" ]; then
	echo -n "Path to old workspace: "
	read OLD_WORKSPACE
	echo -n "Path to new workspace: "
	read NEW_WORKSPACE
fi

if [ "$#" = "2" ]; then
	OLD_WORKSPACE=$1;
	NEW_WORKSPACE=$2;
fi

if [ "$#" = "0" -o "$#" -gt "2" ]; then
	echo usage: $0 [-i] old-workspace new-workspace
	exit 1
fi

if [[ ! ( ( -d "$OLD_WORKSPACE" ) && ( -r "$OLD_WORKSPACE" ) ) ]]; then
	echo $OLD_WORKSPACE is not a readable directory
	exit 1
fi

WORKSPACE_DIR=`dirname $NEW_WORKSPACE`

if [[ ! ( ( -d "$WORKSPACE_DIR" ) && ( -w "$WORKSPACE_DIR" ) ) ]]; then
	echo $WORKSPACE_DIR is not a writable directory
	exit 1
fi

mkdir -p "$NEW_WORKSPACE" || die Could not create directory $NEW_WORKSPACE

mkdir -p "$NEW_WORKSPACE/.metadata/.plugins/org.eclipse.core.runtime/" || die Could not create eclipse settings directory

cp -R "$OLD_WORKSPACE/.metadata/.plugins/org.eclipse.core.runtime/.settings/" "$NEW_WORKSPACE/.metadata/.plugins/org.eclipse.core.runtime/" || die Could not copy old settings

echo New workspace created. Now start your Eclipse and point it to the $NEW_WORKSPACE workspace

