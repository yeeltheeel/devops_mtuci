#!/bin/bash

substring="file"
mydir="."

# user input
if [[ $# == 2 ]]; then 
	# single file case
	substring="$1"
	mydir="$2"
	if [[ ! -d "$mydir" ]]; then
		echo "error: invalid directory";
		while [[ ! -d "$mydir" ]]; do
			echo "error: invalid path"
			echo "input directory path: "
			read mydir; 
		done
	fi
	echo "check: remove $substring from $mydir";
elif [[ $# == 3 ]]; then
	# pattern case
	substring="$1"
	mydir="$3"
	if [[ $2 == "-p" ]]; then
		if [[ ! -d "$mydir" ]]; then
			echo "error: invalid directory";
			while [[ ! -d "$mydir" ]]; do
				echo "error: invalid path"
				echo "input directory path: "
				read mydir;
			done;
		fi
		echo "check: remove $substring from $mydir";
	else
		echo "error: invalid flag"
	fi;
else 
	echo "error: invalid parameters";
fi

# initial file list
if [[ $# == 2 || $# == 3 ]]; then 
	echo "before: "
	for file in "$mydir"/*; do
		echo "$file"
	done;
fi

if [[ $# == 2 ]]; then 
	# single file case
	for file in "$mydir"/*; do
		if [[ -f "$file" && "$file" == *"$substring" ]]; then 
			echo "found $file equal to $substring"
			rm -f "$file"; 
		fi
	done;
elif [[ $# == 3 && $2 == "-p" ]]; then 
	# pattern case
	for file in "$mydir"/*; do
		if [[ -f "$file" && "$file" == *"$substring"* ]]; then 
			echo "$file has $substring"
			rm -f "$file"; 
		fi
	done;
fi

# check removed
if [[ $# == 2 || $# == 3 ]]; then 
	echo "after: "
	for file in "$mydir"/*; do
		echo "$file"
	done;
fi
