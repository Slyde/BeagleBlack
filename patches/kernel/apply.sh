#!/bin/bash

p=$(pwd)
sp=$(dirname $(readlink -f $0))

echo ""
echo "************************************"
echo "Apply Slyd3 custom kernel patches..."
echo "************************************"
echo ""

# just check if path seems correct..
echo -n "Verifying kernel path ... "
if ! echo $p | grep -e '.*kernel/kernel$' > /dev/null;
then
	echo "OOPS!"
	echo ""
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo "Path kernel seems wrong ! "
	echo "Path should finish by 'kernel/kernel'"
	echo "But current path is $p"
	echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
	echo ""
	echo ""
	exit 1
fi
echo "OK"

echo ""
echo "Now applying all patches..."

for file in $sp/*.patch
do
	echo -n "Applying patch $file .... "
	patch -p1 -t -s < $file
	echo "Done"
done
