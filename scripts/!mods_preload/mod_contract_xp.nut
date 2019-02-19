::mods_hookNewObject("contracts/contracts/escort_caravan_contract", function(o) {

    local createScreens = o.createScreens;
    o.createScreens = function() 
    {
        createScreens();

        foreach (s in this.m.Screens)
        {
            switch(s.ID)
            {
                case "Success1":
                local XP = 100; //you would do some percentage calculation here
                local sFunc = s.start;
                s.start = function () {
                    sFunc();
                    this.List.push({
                        this.List.push({
                            id = 11,
                            icon = "ui/icons/asset_money.png",
                            text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + XP + "[/color] XP"
                        });
                    })

                }
            }
        }
    }
})