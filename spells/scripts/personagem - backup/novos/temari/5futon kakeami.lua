local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 100091
if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 100, getCreaturePosition(cid), pos, 13)
addEvent(doSendDistanceShoot, 300, getCreaturePosition(cid), pos, 13)
addEvent(doSendDistanceShoot, 500, getCreaturePosition(cid), pos, 13)
addEvent(doSendMagicEffect, 150, {x = pos.x, y = pos.y, z = pos.z}, 54)
addEvent(doSendMagicEffect, 350, {x = pos.x, y = pos.y, z = pos.z}, 54)
addEvent(doSendMagicEffect, 550, {x = pos.x, y = pos.y, z = pos.z}, 54)
addEvent(onCastSpell1, 150, parameters)
addEvent(onCastSpell1, 350, parameters)
addEvent(onCastSpell1, 550, parameters)
return TRUE
end 