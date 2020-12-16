BBDir="${1-"c:\\Steam\\steamapps\\common\\Battle Brothers\\data\\"}"
RepoDir="${2-"battlebrothers"}"

function checkForCompileError() {
code=0
while read -r line; do
    if [[ $line == *"error"* ]]; then
        echo "$line"
        code=1
    fi
done <<< "$1"
if [ $code == 1 ]
then
    return 1
else
    return 0
fi
}

function handleExit() {
    # Get exit code of the previous command, instead of echo
    exitCode=$?
    if [ $exitCode -ne "0" ]
    then
        echo "Failed to build Legends!"
        exit 1
    fi
}

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
            :
            #echo "skipping $line"
        elif [[ "$xpath" == make_legend_helmets.py ]]; then
            rm -rf helmets
            mkdir -p "helmets"
            python make_legend_helmets.py
            handleExit
            cp -R helmets/. "$BBDir\scripts\items\legend_helmets"
        elif [[ "$xpath" == make_legend_armor.py ]]; then
            rm -rf legend_armor
            mkdir -p "legend_armor"
            python make_legend_armor.py
            handleExit
            cp -R legend_armor/. "$BBDir\scripts\items\legend_armor"
        elif [[ "$xpath" == *.py ]]; then
            :
            #echo "skipping $line"
        elif [[ "$xpath" == *.md ]]; then
            :
            #echo "skipping $line"
        elif [[ "$xpath" == unpacked* ]]; then
            :
            #echo "skipping $line"
        elif [[ "$xpath" == *.cnut ]]; then
            :
            #echo "skipping $line"

        else
            echo "$xpath"
            path=$( echo ${xpath%/*} )
            mkdir -p "$BBDir\\$path"
            cp "$xpath" "$BBDir\\$xpath"
        fi
    fi

done <<< "$FILES"

cd ../bin
o=$(./masscompile.bat "$BBDir\scripts")
cd ../"$RepoDir"
checkForCompileError "$o"
if [ $? -ne "0" ]
then
    echo "Failed to build Legends!"
else
    echo "Success!"
fi

