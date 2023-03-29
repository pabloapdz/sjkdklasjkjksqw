local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, -2625, -14.0, -3750)
local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 2
local storage = 120145

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local parameters = {cid = cid, var = var}


local p1 = getCreaturePosition(cid)

local pos_target = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local pos3 = {x=pos_target.x, y=pos_target.y, z=pos_target.z}


-- doCreatureSay(cid, "Oodama Kyuubi Rasengan", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 300, parameters)
addEvent(doSendMagicEffect, 340, pos3, 1216)
--addEvent(doSendMagicEffect, 450, pos4, 39)
exhaustion.set(cid, storage, waittime)
return TRUE
end 