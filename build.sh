
FILES=$(git diff --name-only `git merge-base origin/master HEAD`)
while read -r line; do
    if [ "$line" == "build.sh" ]; then
        echo "skipping $line"
    elif [ "$line" == "unstaged_build.sh" ]; then
        echo "skipping $line"
    elif [ "$line" == "build_compile.sh" ]; then
        echo "skipping $line"                   
    elif [ "$line" == "ReleaseNotes.md" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/mapgen/templates/world/worldmap_generator.nut" ]; then
        echo "skipping $line"  
    elif [ "$line" == "scripts/contracts/contract.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/entity/world/combat_manager.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/states/tactical_state.nut" ]; then
        echo "skipping $line"     
    elif [ "$line" == "scripts/entity/tactical/actor.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/entity/tactical/tactical_entity_manager.nut" ]; then
        echo "skipping $line"        
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_default.nut" ]; then
        echo "skipping $line"     	
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_knock_out.nut" ]; then
        echo "skipping $line"  		
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_hook.nut" ]; then
        echo "skipping $line"  
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_charm.nut" ]; then
        echo "skipping $line"  		
    else
        echo "$line"
        path=$( echo ${line%/*} )
        mkdir -p "c:\Steam\steamapps\common\Battle Brothers\data\\$path"
        cp "$line" "c:\Steam\steamapps\common\Battle Brothers\data\\$line"
    fi
done <<< "$FILES"