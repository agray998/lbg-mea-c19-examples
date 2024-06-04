#!/bin/bash
make_files() {
	dir_name=$1
	files=$2
	cd $dir_name
	pwd
	for file in ${files[@]}; do
		touch $file
		cat - >> $file <<EOF
This is $file
EOF
	done
	for file in ${files[@]}; do cat $file; done
}
start_dir=$(pwd)
folder1=$1
folder2=$2
declare -a files=(file1.txt file2.txt)
echo $start_dir
mkdir $folder1
make_files $folder1 \
	   ${files[@]}
mkdir $folder2
ls
make_files $folder2 \
	   ${files[@]}
rm -rf $folder2
echo "This is another file" > file3.txt
cd $start_dir
rm -rf $folder1
