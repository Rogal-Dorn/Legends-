BBDir="${1-"c:\\Steam\\steamapps\\common\\Battle Brothers\\data"}"
RepoDir="${2-"battlebrothers"}"
BuildDir="${3-".\\build"}"

function checkForCompileError() {
code=0
while read -r line; do
    if [[ $line == *" error"* ]]; then
        #echo "$line"
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

rm "$BuildDir" -r

cp unpacked/dead_arrows.png unpacked/legend_characters/entity/bodies
cp unpacked/dead_javelin.png unpacked/legend_characters/entity/bodies

./build_brushes.sh "$BuildDir" "$RepoDir"
handleExit

echo "Copying sounds to $BuildDir\\sounds ..."
cp -R sounds/. "$BuildDir\\sounds"
handleExit
echo "Copying gfx to $BuildDir\\gfx ..."
cp -R gfx/. "$BuildDir\\gfx"
echo "Copying mod_legends to $BuildDir\\mod_legends ..."
cp -R mod_legends/. "$BuildDir\\mod_legends"
handleExit
echo "Copying mod script files to $BuildDir\\scripts ..."
cp -R scripts/. "$BuildDir\\scripts"
handleExit
echo "Copying mod script files to $BuildDir\\ui ..."
cp -R ui/. "$BuildDir\\ui"
handleExit
echo "Copying mod preload files to $BuildDir\\preload ..."
cp -R ui/. "$BuildDir\\preload"
handleExit
# while read -r line; do
#     if [[ "$line" == *.sh ]]; then
#         :
#     elif [[ "$line" == *.md ]]; then
#         :
#     elif [[ "$line" == *.py ]]; then
#         :
#     elif [[ "$line" == documentation/*.txt ]]; then
#         :
#     elif [[ "$line" == unpacked* ]]; then
#         :
#     elif [[ "$line" == gfx/*.png ]]; then
#         :
#     elif [[ "$line" == gfx/*.jpg ]]; then
#         :
#     elif [[ "$line" == sounds/*.wav ]]; then
#         :
#     elif [[ "$line" == *.cnut ]]; then
#         :
#     elif [ "$line" == ".gitignore" ]; then
#         :
#     elif [ "$line" == ".editorconfig" ]; then
#         :
#     elif [ "$line" == "scripts/mapgen/templates/world/worldmap_generator.nut" ]; then
#         :
#     elif [ "$line" == "scripts/contracts/contract.nut" ]; then
#         :
#     elif [ "$line" == "scripts/entity/world/combat_manager.nut" ]; then
#         :
#     elif [ "$line" == "scripts/states/tactical_state.nut" ]; then
#         :
#     elif [ "$line" == "scripts/entity/tactical/actor.nut" ]; then
#         :
#     elif [ "$line" == "scripts/skills/skill.nut" ]; then
#         :
#     elif [ "$line" == "scripts/skills/skill_container.nut" ]; then
#         :
#     elif [ "$line" == "scripts/entity/tactical/tactical_entity_manager.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_bow.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_crush_armor.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_decapitate.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_default.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_knock_out.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_lash.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_swallow_whole.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_hook.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_boost_stamina.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_charm.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_defend_rotation.nut" ]; then
#         :
#     elif [ "$line" == "scripts/ai/tactical/behaviors/ai_attack_terror.nut" ]; then
#         :
#     elif [ "$line" == "scripts/contracts/contracts/barbarian_king_contract" ]; then
#         :
#     elif [ "$line" == "scripts/factions/faction_action.nut" ]; then
#         :
#     elif [ "$line" == "scripts/skills/racial/alp_racial.nut" ]; then
#         :
#     elif [ "$line" == "scripts/events/events/dlc4/cultist_origin_vs_old_gods_event.nut" ]; then
#         :
#     elif [ "$line" == "scripts/config/world_entity_common.nut" ]; then
#         :
#     elif [ "$line" == "scripts/!mods_preload/!config/tnf_debugMode_lib.nut" ]; then
#         :
#     elif [ "$line" == "scripts/!mods_preload/tnf_debugMode.nut" ]; then
#         :
#     elif [ "$line" == "scripts/crafting/blueprints/paint_black_blueprint.nut" ]; then
#         :
#     elif [ "$line" == "scripts/crafting/blueprints/paint_orange_red_blueprint.nut" ]; then
#         :
#     elif [ "$line" == "scripts/crafting/blueprints/paint_red_blueprint.nut" ]; then
#         :
#     elif [ "$line" == "scripts/crafting/blueprints/paint_remover_blueprint.nut" ]; then
#         :
#     elif [ "$line" == "scripts/crafting/blueprints/paint_set_blueprint.nut" ]; then
#         :
#     elif [ "$line" == "scripts/crafting/blueprints/paint_white_blue_blueprint.nut" ]; then
#         :
#     elif [ "$line" == "scripts/crafting/blueprints/paint_white_green_yellow_blueprint.nut" ]; then
#         :
#     else
#         #echo "$line"
#         path=$( echo ${line%/*} )
#         mkdir -p "$BuildDir\\$path"
#         handleExit
#         cp "$line" "$BuildDir\\$line"
#         handleExit
#     fi
# done <<< "$FILES"

# echo "Compiling all nut files ..."
# cd ../bin
# o=$(./masscompile.bat "$BuildDir\\scripts")
# o=$(./masscompile.bat "$BuildDir\\mod_legends")
# cd ../"$RepoDir"

# checkForCompileError "$o"
# resp="$?"
# echo $resp
# if [ $resp -ne "0" ]
# then
#     echo "Failed to build Legends!"
#     exit 1
# else
#     echo "Success!"
#     exit 0
# fi

# zip the content of build dir and move file to bb's /data dir
cd "$BuildDir"
7z a -tzip mod_legends.zip *
mv mod_legends.zip "$BBDir"
