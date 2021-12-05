#!/bin/bash
#Simple script to install seqtk

source lib/bash-utility/src/file.sh
source lib/shml/shml.sh


URL=https://github.com/lh3/seqtk/archive/refs/heads/master.zip

echo ""
echo "$(fgcolor cyan 'Installing seqtk for BioBash' )"
echo ""

cd tmp
wget https://github.com/lh3/seqtk/archive/refs/heads/master.zip
unzip master.zip
cd seqtk-master
make
mv seqtk ../../bin
cd ../..
rm -Rf tmp/*

echo ""
echo "$(fgcolor cyan 'SEQTK succesfully installed.' )"
echo ""
exit 
