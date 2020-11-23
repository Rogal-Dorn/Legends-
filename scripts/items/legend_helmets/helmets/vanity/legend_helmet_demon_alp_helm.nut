
this.legend_helmet_demon_alp_helm <- this.inherit("scripts/items/legend_helmets/legend_helmet_upgrade", {
	m = {
        GruesomeFromHelm = true
    },
	function create()
	{
		this.legend_helmet_upgrade.create();
		this.m.Type = this.Const.Items.HelmetUpgrades.Vanity;
		this.m.ID = "armor.head.legend_helmet_demon_alp_helm";
		this.m.Name = "Demon Alp Helm";
		this.m.Description = "A trophy made from the face of a demon";
		this.m.ArmorDescription = this.m.Description;
		this.m.Variants = [1];
        this.m.Variant = this.m.Variants[this.Math.rand(0, this.m.Variants.len() - 1)];
		this.updateVariant();
		this.m.ImpactSound = this.Const.Sound.ArmorChainmailImpact;
		this.m.InventorySound = this.Const.Sound.ArmorChainmailImpact;
		this.m.Value = 200;
		this.m.Condition = 10;
		this.m.ConditionMax = 10;
		this.m.StaminaModifier = -1;
		this.m.Vision = 0;
		this.m.IsLowerVanity = false;
		this.m.HideHair = true;
		this.m.HideBeard = false;
	}


    //only remove & add the scream if we don't have the horrify perk already
    function onAdded()
	{
		this.legend_helmet_upgrade.onAdded();
        local hasPerk = this.getContainer.getSkills().hasSkill("perk.legend_horrify");
        if (!hasPerk && !this.getContainer.getSkills().hasSkill("actives.legend_horrific_scream"))
        {
		    this.addSkill(this.new("scripts/skills/actives/legend_horrific_scream"));
        }
	}

    function onRemoved()
    {
        local hasPerk = this.getContainer.getSkills().hasSkill("perk.legend_horrify");
        if (!hasPerk)
        {
            this.getContainer().getSkills().removeByID("actives.legend_horrific_scream");
        }
    }

	function updateVariant()
	{
		local variant = this.m.Variant > 9 ? this.m.Variant : "0" + this.m.Variant;
		this.m.Sprite = "legendhelms_demon_alp_helm" + "_" + variant;
		this.m.SpriteDamaged = "legendhelms_demon_alp_helm" + "_" + variant + "_damaged";
		this.m.SpriteCorpse = "legendhelms_demon_alp_helm" + "_" + variant + "_dead";
		this.m.IconLarge = "";
		this.m.Icon = "legend_helmets/inventory_demon_alp_helm" + "_" + variant + ".png";
		this.m.OverlayIcon = this.m.Icon;
		this.m.OverlayIconLarge = this.m.OverlayIcon;
	}
});
