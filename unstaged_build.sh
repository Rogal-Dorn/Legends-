FILES=$(git status -s)
while read -r line; do
    #echo $line
    x=${line:0:1}
    if [ $x == "M" ]; then
        xpath=${line:2} 
        if [ "$xpath" == "build.sh" ]; then
            echo "skipping $xpath"
        elif [ "$xpath" == "unstaged_build.sh" ]; then
            echo "skipping $xpath"                    
        elif [ "$xpath" == "ReleaseNotes.md" ]; then
            echo "skipping $xpath"
        elif [ "$xpath" == "scripts/mapgen/templates/world/worldmap_generator.nut" ]; then
            echo "skipping $xpath"  
        elif [ "$xpath" == "scripts/contracts/contract.nut" ]; then
            echo "skipping $xpath"
        elif [ "$xpath" == "scripts/entity/world/combat_manager.nut" ]; then
            echo "skipping $xpath"
        elif [ "$xpath" == "scripts/states/tactical_state.nut" ]; then
            echo "skipping $xpath"     
        elif [ "$xpath" == "scripts/entity/tactical/actor.nut" ]; then
            echo "skipping $xpath"
        elif [ "$xpath" == "scripts/entity/tactical/tactical_entity_manager.nut" ]; then
            echo "skipping $xpath"                           
        else
            echo "$xpath"
            path=$( echo ${xpath%/*} )
            mkdir -p "c:\Steam\steamapps\common\Battle Brothers\data\\$path"
            cp "$xpath" "c:\Steam\steamapps\common\Battle Brothers\data\\$xpath"
        fi
    fi

done <<< "$FILES"
