local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1600, -15.0, -1800)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 25 -- Tempo de exhaustion
local storage = 7214

	local canto1 = {x = 488, y = 90, z = 3} -- Canto superior esquerdo do local
	local canto2 = {x = 616, y = 294, z = 10} -- Canto inferior direito do local
	if isInRange(getCreaturePosition(cid), canto1, canto2) then
		return doPlayerSendTextMessage(cid, 27, "Você não pode usar essa spell no castle.")
	end

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 1, getCreaturePosition(cid), pos, 93)
addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 4)
doTeleportThing(cid,pos)
addEvent(onCastSpell1, 100, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 