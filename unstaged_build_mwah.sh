FILES=$(git status -s)
while read -r line; do
    #echo $line
    x=${line:0:1}
    if [ $x == "M" ] || [ $x == "A" ]; then
        if [ $x == "M" ]; then
            xpath=${line:2}
        else 
            xpath=${line:3}
        fi
        if [[ "$xpath" == *.sh ]]; then
            echo "skipping $line" 
        elif [[ "$xpath" == *.md ]]; then
            echo "skipping $line"
        elif [[ "$xpath" == unpacked* ]]; then
            echo "skipping $line"
        elif [[ "$xpath" == *.cnut ]]; then
            echo "skipping $line"
        else
            echo "$xpath"
            path=$( echo ${xpath%/*} )
            mkdir -p "c:\Program Files (x86)\Steam\steamapps\common\Battle Brothers\data\\$path"
            cp "$xpath" "c:\Program Files (x86)\Steam\steamapps\common\Battle Brothers\data\\$xpath"
        fi
    fi

done <<< "$FILES"

cd ../bin
./masscompile.bat "c:\Program Files (x86)\Steam\steamapps\common\Battle Brothers\data\scripts"
cd ../battlebrothers
