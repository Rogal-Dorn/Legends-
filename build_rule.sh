BBDir="${1-"c:\\Steam\\steamapps\\common\\Battle Brothers\\data"}"
RepoDir="${2-"battlebrothers"}"

mv "$BBDir\\gfx\\fonts" .\

./build_legends_mod.sh "$BBDir" "$RepoDir"
resp="$?"
echo $resp
if [ $resp -ne "0" ]
then
    echo "Failed to build Legends!"
    exit 1
fi

echo "Zipping mod ..."
rm -rf "$BBDir\\mod_legends.zip"
"C:\Program Files\7-Zip\7z.exe" a "$BBDir\\mod_legends.zip" "$BBDir\\brushes" "$BBDir\\gfx" "$BBDir\\preload" "$BBDir\\scripts" "$BBDir\\sounds" "$BBDir\\ui"
echo "Cleaning up ..."
rm -rf  "$BBDir\\brushes" "$BBDir\\gfx" "$BBDir\\preload" "$BBDir\\scripts" "$BBDir\\sounds" "$BBDir\\ui"
mv fonts "$BBDir\\gfx"
