# declare -a scriptFiles=(
#     "scripts/config/actor.nut"
# )

FILES=$(git diff --name-only `git merge-base origin/master HEAD`)
while read -r line; do
    if [ "$line" == "build.sh" ]; then
        echo "skipping $line"
    else 
        echo "$line"
        path=$( echo ${line%/*} )
        mkdir -p "c:\Steam\steamapps\common\Battle Brothers\data\\$path"
        cp "$line" "c:\Steam\steamapps\common\Battle Brothers\data\\$line"
    fi
done <<< "$FILES"
