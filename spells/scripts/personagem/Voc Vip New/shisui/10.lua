local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1250, -14.0, -1450)

arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 5 -- Tempo de exhaustion
local storage = 8229

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 100, {x = poz.x+2, y = poz.y+1, z = poz.z}, 1097) -- Susanoo
addEvent(doSendMagicEffect, 100, {x = poz.x-3, y = poz.y, z = poz.z}, 1088) -- Esquerda
addEvent(doSendMagicEffect, 100, {x = poz.x+4, y = poz.y, z = poz.z}, 1087) -- Direita
addEvent(doSendDistanceShoot, 100, {x = poz.x+1, y = poz.y-2, z = poz.z}, pos, 79)
addEvent(doSendDistanceShoot, 300, {x = poz.x+1, y = poz.y-2, z = poz.z}, pos, 79)
addEvent(doSendDistanceShoot, 600, {x = poz.x+1, y = poz.y-2, z = poz.z}, pos, 79)
addEvent(doSendDistanceShoot, 900, {x = poz.x+1, y = poz.y-2, z = poz.z}, pos, 79)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell1, 700, parameters)
addEvent(onCastSpell1, 1000, parameters)
--doCreatureSay(cid, "Susanoo Tsukumo", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return TRUE
end 