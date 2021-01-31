local gt = this.getroottable();
gt.Const.World.SpeedSettings.CampMult = 4.0;   // use 4x speed when camping
gt.Const.World.SpeedSettings.EscortMult = 6.0; // use 6x when escorting caravans
gt.Const.World.SpeedSettings.LightSpeedMult <- 4.0; // 4x when the 3 key is pressed
gt.Const.World.SpeedSettings.LudicrousSpeedMult <- 8.0; // 8x when the 4 key is pressed

// reduce some combat delays
// foreach(v in ["Action","MinorAction"]) gt.Const.AI.Agent[v + "Delay"] *= 0.5;
// foreach(v in ["NewEvaluation","CameraAdditional"]) gt.Const.AI.Agent[v + "Delay"] *= 0.25;

