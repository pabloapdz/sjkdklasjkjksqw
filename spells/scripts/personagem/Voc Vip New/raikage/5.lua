local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 1028)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1000, -9.0, -1300)

arr1 = {
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
}

arr2 = {
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8522

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local pos = getCreaturePosition(cid)
local pos1 = {x=pos.x+1, y=pos.y, z=pos.z}


local parameters = {cid = cid, var = var}
doSendMagicEffect(pos1, 1039)
--doCreatureSay(cid, "Doton Punch", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 100, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end