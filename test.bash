#!/bin/bash -xv
# SPDX ...

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

### NORMAL INPUT ###
a=$(seq 5 | ./plus)
[ "$a" = 15 ] || ng "$LINENO" 

### STRANGE INPUT ###
a=$(echo あ | ./plus)
[ "$?" = 1 ] || ng "$LINENO" 
[ "$a" = "" ] || ng "$LINENO" 

a=$(echo | ./plus)
[ "$?" = 1 ] || ng "$LINENO" 
[ "$a" = "" ] || ng "$LINENO" 

[ "$res" = 0 ] && echo OK

exit $res
