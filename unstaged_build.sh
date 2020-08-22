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
        elif [[ "$xpath" == make_legend_helmet_nuts.py ]]; then
            rm -rf helmets
            mkdir -p "helmets"
            python make_legend_helmet_nuts.py
            cp -R helmets/. "c:\Steam\steamapps\common\Battle Brothers\data\scripts\items\legend_helmets"
        elif [[ "$xpath" == make_legend_armor.py ]]; then
            rm -rf legend_armor
            mkdir -p "legend_armor"
            python make_legend_armor.py
            cp -R legend_armor/. "c:\Steam\steamapps\common\Battle Brothers\data\scripts\items\legend_armor"
        elif [[ "$xpath" == *.py ]]; then
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
            mkdir -p "c:\Steam\steamapps\common\Battle Brothers\data\\$path"
            cp "$xpath" "c:\Steam\steamapps\common\Battle Brothers\data\\$xpath"
        fi
    fi

done <<< "$FILES"

cd ../bin
./masscompile.bat "c:\Steam\steamapps\common\Battle Brothers\data\scripts"
cd ../battlebrothers
