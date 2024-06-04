#!/bin/bash
make_files() {
	dir_name=$1
	files=$2
	content1=$3
	content2=$4
	cd $dir_name
	pwd
	for file in ${files[@]}; do
		touch $file
	done
	#echo $content1 > $file1
	#echo $content2 > $file2
	#cat $file1 $file2
}
start_dir=$(pwd)
folder1=$1
folder2=$2
declare -a files=(file1.txt file2.txt)
echo $start_dir
mkdir $folder1
make_files $folder1 \
	   ${files[@]} \
           "This is the first file" \
           "This is the second file"
mkdir $folder2
ls
make_files $folder2 \
	   ${files[@]} \
	   "This file is in $folder2" \
	   "This file is also in $folder2"
rm -rf $folder2
echo "This is another file" > file3.txt
cd $start_dir
rm -rf $folder1
