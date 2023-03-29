local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -4.3, -1066, -5.6, -1666)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
	if isCreature(parameters.cid) then
    	return doCombat(parameters.cid, combat1, parameters.var)
    end
end

function onCastSpell(cid, var)
	local waittime = 2 -- Tempo de exhaustion
	local storage = 8214

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
	end
	local parameters = { cid = cid, var = var}
	local target = getCreatureTarget(cid)  -- efeito no alvo
	local pos = getCreaturePosition(target)
	local poz = getCreaturePosition(cid) -- effeito no caster
	addEvent(doSendMagicEffect, 25, {x = pos.x, y = pos.y+1, z = pos.z}, 384)
	addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 38)
	addEvent(onCastSpell1, 500, parameters)
	addEvent(doSendMagicEffect, 275, {x = pos.x, y = pos.y+1, z = pos.z}, 384)
	addEvent(doSendMagicEffect, 850, {x = pos.x+1, y = pos.y+1, z = pos.z}, 38)
	addEvent(onCastSpell1, 850, parameters)
	addEvent(doSendMagicEffect, 675, {x = pos.x, y = pos.y+1, z = pos.z}, 384)
	addEvent(doSendMagicEffect, 1000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 38)
	addEvent(onCastSpell1, 1000, parameters)
	exhaustion.set(cid, storage, waittime)
	return true
end 