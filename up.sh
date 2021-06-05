#!/bin/bash

tmpfile=/tmp/`basename $0`.$$

ls -1 $bz2dir >$tmpfile

function download (){
yum update --downloadonly --downloaddir $updatedir$unexdir --installroot=$updatedir$unexdir
echo "download now to $updatedir$unexdir"
}

function extract (){
tar xf $f -C $updatedir$unexdir
echo "extrac $f  to $updatedir$unexdir"
}

function createdir (){
mkdir $updatedir$unexdir
echo "create $updatedir$unexdir now"
}

function compress (){
tar cjf $unexdir-update.tar.bz2 $updatedir$unexdir
echo "compress to this name $unexdir-update.tar.bz2 from $updatedir$unexdir"
}
function start (){
for f in `grep -i "bz2" $tmpfile`
do
	#echo $f
	unexdir=$(echo $f |cut -f 1 -d '.')
	#echo $unexdir
	[ -d "$updatedir$unexdir" ] || createdir && extract && download && compress
done
}

while [ "$bz2dir" == "" ] || [ "$updatedir" == "" ]
do
	read -p "Please enter *.bz2 file location and press [Enter]: " bz2dir
	read -p "Please enter extract  location ,example: /tmp/ and press [Enter]: " updatedir
	[ -z $bz2dir ] || [ -z $updatedir ] && echo "is enty"
	start
done
