FILES=$(git diff --name-only `git merge-base origin/master HEAD`)
while read -r line; do
    if [[ "$line" == *.sh ]]; then
        echo "skipping $line"
    elif [[ "$line" == *.md ]]; then
        echo "skipping $line"
    elif [[ "$line" == unpacked* ]]; then
        echo "skipping $line"
    elif [[ "$line" == gfx/*.png ]]; then
        echo "skipping $line"
    elif [[ "$line" == gfx/*.jpg ]]; then
        echo "skipping $line"
    elif [[ "$line" == sounds/*.wav ]]; then
        echo "skipping $line"
    elif [[ "$line" == *.cnut ]]; then
        echo "skipping $line"
    elif [ "$line" == ".gitignore" ]; then
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
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_bow.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_crush_armor.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_decapitate.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_default.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_knock_out.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_lash.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_swallow_whole.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_hook.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_boost_stamina.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_charm.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/ai/tactical/behaviors/ai_defend_rotation.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/contracts/contracts/barbarian_king_contract" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/factions/faction_action.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/skills/racial/alp_racial.nut" ]; then
        echo "skipping $line"
    elif [ "$line" == "scripts/events/events/dlc4/cultist_origin_vs_old_gods_event.nut" ]; then
        echo "skipping $line"
    else
        echo "$line"
        path=$( echo ${line%/*} )
        mkdir -p "c:\Steam\steamapps\common\Battle Brothers\data\\$path"
        cp "$line" "c:\Steam\steamapps\common\Battle Brothers\data\\$line"
    fi
done <<< "$FILES"

mkdir -p "brushes"
cd ../bin
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/entity_blood.brush ../Repo/unpacked/entity_blood
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_characters.brush ../Repo/unpacked/legend_characters
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_enemies.brush ../Repo/unpacked/legend_enemies
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_runed.brush ../Repo/unpacked/legend_runed
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_weapons.brush ../Repo/unpacked/legend_weapons
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_world.brush ../Repo/unpacked/legend_world
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legends_ui.brush ../Repo/unpacked/legends_ui
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_horses.brush ../Repo/unpacked/legend_horses
python ../Repo/unpacked/make_legend_armor.py
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_armor.brush ../Repo/unpacked/legend_armor
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_helmets.brush ../Repo/unpacked/legend_helmets
./bbrusher.exe pack --gfxPath "../Repo/" ../Repo/brushes/legend_objects.brush ../Repo/unpacked/legend_objects
./masscompile.bat "c:\Steam\steamapps\common\Battle Brothers\data\scripts"
cd ../Repo

cp -R sounds/. "c:\Steam\steamapps\common\Battle Brothers\data\sounds"
cp -R gfx/. "c:\Steam\steamapps\common\Battle Brothers\data\gfx"
cp -R brushes/. "c:\Steam\steamapps\common\Battle Brothers\data\brushes"
