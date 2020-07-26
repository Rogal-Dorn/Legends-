local g_modHooks = { }, g_newHooks = null, g_inheritHooks = null, g_oneTimeHooks = { }, g_states = { };
local g_cssFiles = [ ], g_jsFiles = [ ], g_mods = [ ];

local varcall = function(func, args)
{
  switch(args.len())
  {
    case 0: return func();
    case 1: return func(args[0]);
    case 2: return func(args[0], args[1]);
    case 3: return func(args[0], args[1], args[2]);
    case 4: return func(args[0], args[1], args[2], args[3]);
    case 5: return func(args[0], args[1], args[2], args[3], args[4]);
    case 6: return func(args[0], args[1], args[2], args[3], args[4], args[5]);
    case 7: return func(args[0], args[1], args[2], args[3], args[4], args[5], args[6]);
    case 8: return func(args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7]);
    default: throw "Too many arguments: " + args.len();
  }
}

local wrapInstance = function(o)
{
  local wrapper = { };
  foreach(k,_v in o.getclass())
  {
    local v = o[k];
    wrapper[k] <- typeof(v) == "function" ? @(...) varcall(v.bindenv(o), vargv) : v;
  }
  return wrapper;
}

::mods_addHookCore <- function(hooks, name, func)
{
  if(!(name in hooks)) hooks[name] <- [ ];
  if(func) hooks[name].append(func);
}

::mods_addHook <- function(name, func = null) { ::mods_addHookCore(g_modHooks, name, func); }

::mods_callHookCore <- function(hooks, name, args)
{
  if(name in hooks)
  {
    local funcs = hooks[name];
    for(local i = 0; i < funcs.len(); )
    {
      local func = funcs[i];
      local result = varcall(func, args);
      if(result != null) return result;
      if (i < funcs.len() && funcs[i] == func) i++; // only increment if the hook didn't remove itself
    }
  }
  
  return null;
}

::mods_callHook <- function(name, ...) { return ::mods_callHookCore(g_modHooks, name, vargv); }

::mods_removeHookCore <- function(hooks, name, func)
{
  if(name in hooks)
  {
    local funcs = hooks[name], index = funcs.find(func);
    if(index != null) funcs.remove(index);
  }
}

::mods_removeHook <- function(name, func) { ::mods_removeHook(g_modHooks, name, func); }

::mods_hookNewObject <- function(name, func, once = false)
{
  if(g_newHooks == null)
  {
    g_newHooks = { };
    ::mods_addHook("new", @(n,o) ::mods_callHookCore(g_newHooks, n, [o]));
  }

  local scriptName = "scripts/" + name, hook = func;
  if(once)
  {
    hook = function(o)
    {
      o = func(o);
      ::mods_removeHookCore(g_newHooks, scriptName, hook);
      if(!(scriptName in g_oneTimeHooks)) g_oneTimeHooks[scriptName] <- [ ];
      g_oneTimeHooks[scriptName].append(hook);
      return o;
    };
  }

  ::mods_addHookCore(g_newHooks, scriptName, hook);
}

::mods_hookNewObjectOnce <- function(name, func) { ::mods_hookNewObject(name, func, true); }

::mods_hookClass <- function(name, func, abstract = false)
{
  if(!abstract) ::mods_hookNewObject(name, func);

  if(g_inheritHooks == null)
  {
    g_inheritHooks = { };
    ::mods_addHook("inherit", @(n,o) ::mods_callHookCore(g_inheritHooks, n, [o]));
  }
  ::mods_addHookCore(g_inheritHooks, "scripts/" + name, func);
}

::mods_hookBaseClass <- function(name, func) { ::mods_hookClass(name, func, true); }

::mods_addField <- function(obj, className, fieldName, value)
{
  ::mods_getClassForOverride(obj, className).m[fieldName] <- value;
}

::mods_addMember <- function(obj, className, memberName, value)
{
  ::mods_getClassForOverride(obj, className)[memberName] <- value;
}

::mods_getClassForOverride <- function(obj, className)
{
  local o = className ? ::mods_isClass(obj, className) : null;
  return o ? o : obj;
}

::mods_getField <- function(obj, fieldName)
{
  while(true)
  {
    if("m" in obj && fieldName in obj.m) return obj.m[fieldName];
    else obj = obj[obj.SuperName];
  }
}

::mods_getMember <- function(obj, key)
{
  while(true)
  {
    if(key in obj) return obj[key];
    else obj = obj[obj.SuperName];
  }
}

::mods_isClass <- function(obj, className)
{
  if("ClassName" in obj && obj.ClassName == className)
  {
    return obj;
  }
  else
  {
    for(local o = obj; "SuperName" in o; )
    {
      local baseName = o.SuperName;
      o = o[baseName];
      if(baseName == className) return o;
    }
    return null;
  }
}

::mods_override <- function(obj, key, value)
{
  while(true)
  {
    if(key in obj) { obj[key] = value; break; }
    else obj = obj[obj.SuperName];
  }
}

::mods_overrideField <- function(obj, fieldName, value)
{
  while(true)
  {
    if("m" in obj && fieldName in obj.m) { obj.m[fieldName] = value; break; }
    else obj = obj[obj.SuperName];
  }
}

this.logInfo("Redirecting core functions");

local inheritFunc = inherit;
inherit = function(baseScript, newMembers)
{
  local c = inheritFunc(baseScript, newMembers), mc = ::mods_callHook("inherit", baseScript, c);
  return mc ? mc : c;
}

local newFunc = new;
new = function(scriptName)
{
  local i = newFunc(scriptName), mi = ::mods_callHook("new", scriptName, i);
  return mi ? mi : i;
}

local spawnEntityFunc = World.spawnEntity;
World.spawnEntity = function(scriptName, ...)
{
  local args = [ scriptName ];
  args.extend(vargv);
  local i = varcall(spawnEntityFunc, args), mi = ::mods_callHook("new", scriptName, i);
  return mi ? mi : i;
}

local getPlayerEntityFunc = World.getPlayerEntity, lastPlayer = null;
World.getPlayerEntity = function()
{
  local o = getPlayerEntityFunc();
  if(o != (lastPlayer != null ? lastPlayer.ref() : null))
  {
    lastPlayer = o != null ? o.weakref() : null;
    local mo = ::mods_callHook("new", "scripts/entity/world/player_party", o);
    if(mo) o = mo;
  }

  return o;
}

local wrapRoster = function(roster)
{
  local wrapper = typeof(roster) == "instance" ? wrapInstance(roster) : roster;
  local createFunc = wrapper.create;
  wrapper.create = function(scriptName)
  {
    local o = createFunc(scriptName), mo = ::mods_callHook("new", scriptName, o);
    return mo ? mo : o;
  }
  return wrapper;
}

local getPlayerRosterFunc = World.getPlayerRoster;
local lastPlayerRoster = null, playerRosterWrapper = null;
World.getPlayerRoster = function()
{
  local roster = getPlayerRosterFunc();
  if(roster != (lastPlayerRoster != null ? lastPlayerRoster.ref() : null))
  {
    lastPlayerRoster = roster.weakref();
    playerRosterWrapper = wrapRoster(roster);
  }
  return playerRosterWrapper;
}

local removeFunc = World.getPlayerRoster().remove;
World.getPlayerRoster().remove = function(actor)
{
  World.LegendsMod.BroStats().removeActorID(actor.getCompanyID())
  removeFunc();
}

local getRosterFunc = World.getRoster, lastRoster = { }, rosterWrapper = { };
World.getRoster = function(id)
{
  local roster = getRosterFunc(id);
  if(!(id in lastRoster) || roster != lastRoster[id])
  {
    lastRoster[id] <- roster.weakref();
    rosterWrapper[id] <- wrapRoster(roster);
  }
  return rosterWrapper[id];
}

::mods_addHook("beforeCampaignLoad", function() // executed once per campaign load
{
  foreach(k,L in g_oneTimeHooks) // restore one-time hooks
    foreach(h in L)
      ::mods_addHookCore(g_newHooks, k, h);
  g_oneTimeHooks = { };
});

::mods_addHook("root_state.onInit", function(r) // executed once per game session
{
  local addFunc = r.add;
  r.add = function(name, scriptName)
  {
    local old = name in g_states ? g_states[name] : null, o = addFunc(name, scriptName);
    if(o != old)
    {
      // world_state is (re)added when a campaign is loaded
      if(scriptName == "scripts/states/world_state") ::mods_callHook("beforeCampaignLoad");
      g_states[name] <- o != null ? o.weakref() : null;
      local mo = ::mods_callHook("new", scriptName, o);
      if(mo) o = mo;
    }
  
    return o;
  }
});

::mods_hookNewObjectOnce("states/world_state", function(o) {
  local loadCampaign = o.loadCampaign;
  o.loadCampaign = function(fileName)
  {
    // this ugly hack exists in world_state.nut so we have to duplicate it
		if (Time.getRealTimeF() - m.CampaignLoadTime >= 4.0)
		{
      loadCampaign(fileName);
      ::mods_callHook("onCampaignLoaded", this);
    }
  }
});

::mods_addHook("onCampaignLoaded", function(worldState) {
  local parties = World.getAllEntitiesAtPos(worldState.getPlayer().getPos(), 1.0e9); 
  foreach(e in parties) ::mods_callHook("onEntityLoaded", e);
  foreach(e in World.getPlayerRoster().getAll())
    ::mods_callHook("new", "scripts/entity/tactical/" + e.ClassName, e);
});

::mods_addHook("onEntityLoaded", function(e) {
  if(e.ClassName == "party" || e.ClassName == "player_party")
    ::mods_callHook("new", "scripts/entity/world/" + e.ClassName, e);

  if(::mods_isClass(e, "world_entity"))
  {
    foreach(t in e.getTroops()) ::mods_callHook("new", t.Script, t);
  }
});

::mods_hookNewObjectOnce("ui/screens/menu/main_menu_screen", function(o) {
  o.getRegisteredCSSHooks <- function()
  {
    local files = g_cssFiles;
    g_cssFiles = [ ];
    return files;
  }

  o.getRegisteredJSHooks <- function()
  {
    local files = g_jsFiles;
    g_jsFiles = [ ];
    return files;
  }
});

::mods_registerCSS <- function(path) 
{
  g_cssFiles.append("mods/" + path);
}

::mods_registerJS <- function(path) 
{
  g_jsFiles.append("mods/" + path);
}

::mods_getRegisteredMod <- function(codeName)
{
  for(local i = 0; i < g_mods.len(); i++)
  {
    if(g_mods[i].Name == codeName) return g_mods[i];
  }
  return null;
}

::mods_getRegisteredMods <- function()
{
  return clone g_mods;
}

::mods_registerMod <- function(codeName, version, friendlyName = null, extra = null)
{
  local m = extra ? clone extra : { };
  m.Name <- codeName;
  m.Version <- version;
  m.FriendlyName <- friendlyName ? friendlyName : codeName;
  g_mods.append(m);
  logInfo("mod_hooks: mod " + codeName + (m.FriendlyName != codeName ? " (" + friendlyName + ")" : "") + " version " + version + " registered.");
}

::mods_registerMod("mod_hooks", 12, "modding script hooks");
