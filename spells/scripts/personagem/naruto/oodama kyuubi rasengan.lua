local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, -2625, -14.0, -3750)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.0, 0, -0.0, 0)

arr1 = {
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}
}

arr2 = {
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1}
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
local waittime = 2
local storage = 8222

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local parameters = {cid = cid, var = var}


local p1 = getCreaturePosition(cid)
local pos1 = {x=p1.x+3, y=p1.y, z=p1.z}
local pos2 = {x=p1.x-2, y=p1.y-2, z=p1.z}
local pos3 = {x=p1.x+4, y=p1.y-2, z=p1.z}
local pos4 = {x=p1.x-2, y=p1.y, z=p1.z}
local pos5 = {x=p1.x-2, y=p1.y+1, z=p1.z}
local pos6 = {x=p1.x+4, y=p1.y, z=p1.z}
local pos7 = {x=p1.x+4, y=p1.y+1, z=p1.z}


doSendMagicEffect(pos1, 862)
-- doCreatureSay(cid, "Oodama Kyuubi Rasengan", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(doSendMagicEffect, 400, pos2, 863)
addEvent(doSendMagicEffect, 400, pos3, 863)
addEvent(doSendMagicEffect, 400, pos4, 863)
addEvent(doSendMagicEffect, 400, pos5, 863)
addEvent(doSendMagicEffect, 400, pos6, 863)
addEvent(doSendMagicEffect, 400, pos7, 863)
exhaustion.set(cid, storage, waittime)
return TRUE
end 