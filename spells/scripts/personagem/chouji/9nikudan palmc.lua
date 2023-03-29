function onGetFormulaValues(cid, level, skill, attack, p, factor)
min = -(15 * (1 * (skill + 1600) / 25 + (level - 1) / 10) / factor)
max = -(15* (1 * (skill + 1800) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, -142.5, -15200, -142.5, -17100)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 6 -- Tempo de exhaustion
local storage = 5159

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local parameters = { cid = cid, var = var}
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+6, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 554)
addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y+1, z = pos.z}, 136)
addEvent(onCastSpell1, 300, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 