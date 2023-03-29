local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.75, -435, -1.75, -500)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}

local pos = getCreaturePosition(cid)
local target = getCreaturePosition(getCreatureTarget(cid))
local targetatk1 = {x=target.x, y=target.y+1, z=target.z}
local targetatk2 = {x=target.x+2, y=target.y+1, z=target.z}
local targetatk3 = {x=target.x+1, y=target.y, z=target.z}
local targetatk4 = {x=target.x+1, y=target.y+1, z=target.z}
local targetatk5 = {x=pos.x+1, y=pos.y+1, z=pos.z}


local function teleport1()
if getCreatureName(getCreatureTarget(cid)) == "Trainer" then
doSendMagicEffect(targetatk1, 1027)
doSendMagicEffect(targetatk2, 1027)
doSendMagicEffect(targetatk3, 1039)
doSendMagicEffect(targetatk4, 1026)
doSendMagicEffect(targetatk5, 1026)
else
doTeleportThing(cid, target)
doSendMagicEffect(targetatk1, 1027)
doSendMagicEffect(targetatk2, 1027)
doSendMagicEffect(targetatk3, 1039)
doSendMagicEffect(targetatk4, 1026)
doSendMagicEffect(targetatk5, 1026)
end
end

addEvent(onCastSpell1, 1, parameters)
--doCreatureSay(cid, "Raiton Lariat", TALKTYPE_MONSTER)
addEvent(teleport1, 1)
return TRUE
end