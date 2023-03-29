local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, 950, -0.0, 950)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local waittime = 1 -- Tempo de exhaustion
local storage = 120148

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
local target = getCreatureTarget(cid)

local pos_target = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}


doCreatureSetNoMove(target, true)
addEvent(doSendMagicEffect, 50, {x = pos_target.x+1, y = pos_target.y+3, z = poz.z}, 1211)
addEvent(doSendMagicEffect, 250, {x = pos_target.x+1, y = pos_target.y+3, z = poz.z}, 1211)
addEvent(doSendMagicEffect, 450, {x = pos_target.x+1, y = pos_target.y+3, z = poz.z}, 1211)
addEvent(doSendMagicEffect, 650, {x = pos_target.x+1, y = pos_target.y+3, z = poz.z}, 1211)
addEvent(doSendMagicEffect, 850, {x = pos_target.x+1, y = pos_target.y+3, z = poz.z}, 1211)
addEvent(doSendMagicEffect, 1050, {x = pos_target.x+1, y = pos_target.y+3, z = poz.z}, 1211)
addEvent(doSendMagicEffect, 1200, {x = pos_target.x+1, y = pos_target.y+3, z = poz.z}, 1211)

addEvent(doSendMagicEffect, 100, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1231)
addEvent(doCreatureSetNoMove, 150 * 1000, target, false)
addEvent(doSendMagicEffect, 200, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1229)
addEvent(doSendMagicEffect, 400, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1229)
addEvent(doSendMagicEffect, 600, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1229)
addEvent(doSendMagicEffect, 700, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1229)
addEvent(doSendMagicEffect, 900, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1229)
addEvent(doSendMagicEffect, 1000, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1229)
addEvent(doSendMagicEffect, 1200, {x = pos_target.x+2, y = pos_target.y+1, z = poz.z}, 1230)
--addEvent(doSendMagicEffect, 850, {x = pos_target.x+1, y = pos_target.y+2, z = poz.z}, 1211)
--addEvent(doSendMagicEffect, 1050, {x = pos_target.x+2, y = pos_target.y+1, z = pos_target.z}, 1209)
--addEvent(onCastSpell1, 100, parameters)
exhaustion.set(cid, storage, waittime)
return true
end 