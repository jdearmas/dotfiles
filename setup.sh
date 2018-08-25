#!/bin/bash


`#copy .*rc files to the home directory` \
cp .*rc ~


`# place vim colors in runtime folder` \
vimout=$(vim --version)
vimLineOut=$(grep "VIMRUNTIME:" <<< "$vimout")
touch test
echo $vimLineOut > test
sed -i 's/.*".//' test
sed -i 's/"//' test
vimXXpath=($cat test)
rm test
vimcolorspath="/$vimXXpath/colors"

