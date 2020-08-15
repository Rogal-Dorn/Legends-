echo hello
mkdir -p "tmp"
unzip "c:\Steam\steamapps\common\Battle Brothers\data\data_001.dat" -d "tmp"
cd ../bin
./massdecompile.bat "..\battlebrothers\tmp"
cd ../battlebrothers
cp tmp/ui .
cp tmp/scripts .
rm -rf tmp
git status
echo DONE
