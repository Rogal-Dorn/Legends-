::LegendsRemoveAiRotation <- {
    Version = "1.0.0",
    ID = "remove_ai_rotation",
    Name = "Remove AI Rotation",
};
::mods_registerMod(::LegendsRemoveAiRotation.ID, ::LegendsRemoveAiRotation.Version, ::LegendsRemoveAiRotation.Name);
::mods_queue(::LegendsRemoveAiRotation.ID, "mod_msu(>=1.2.4), mod_legends(>=18.2.4)", function() {
    ::include("remove_ai_rotation/hooks/mod_remove_ai_rotation.nut");
});
