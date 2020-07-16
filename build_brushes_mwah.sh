 mkdir -p "brushes"
cd ../bin
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/entity_blood.brush ../battlebrothers/unpacked/entity_blood
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legend_characters.brush ../battlebrothers/unpacked/legend_characters
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legend_enemies.brush ../battlebrothers/unpacked/legend_enemies
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legend_runed.brush ../battlebrothers/unpacked/legend_runed
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legend_weapons.brush ../battlebrothers/unpacked/legend_weapons
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legend_world.brush ../battlebrothers/unpacked/legend_world
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legends_ui.brush ../battlebrothers/unpacked/legends_ui
# ./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legend_horses.brush ../battlebrothers/unpacked/legend_horses
python ../battlebrothers/unpacked/make_legend_armor.py
./bbrusher.exe pack --gfxPath "../battlebrothers/" ../battlebrothers/brushes/legend_armor.brush ../battlebrothers/unpacked/legend_armor
cd ../battlebrothers

cp -R gfx/*.png "c:\Program Files (x86)\Steam\steamapps\common\Battle Brothers\data\gfx"
cp -R brushes/. "c:\Program Files (x86)\Steam\steamapps\common\Battle Brothers\data\brushes"