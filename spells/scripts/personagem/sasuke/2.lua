local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 39)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.7, -100, -1.0, -134)


arr1 = {
	{3}
}


local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

 
local function onCastSpell1(cid, var)

local pos = getCreaturePosition(cid)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 501)
return doCombat(cid, combat1, var)
end
 

function onCastSpell(cid, var)
	local waittime = 0.5 -- Tempo de exhaustion
	local storage =100211

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		doSendMagicEffect(getCreaturePosition(cid), 2)
		return false
	end
	local parameters = { cid = cid, var = var}
			addEvent(onCastSpell1, 100, cid, var)
			addEvent(onCastSpell1, 300, cid, var)
			addEvent(onCastSpell1, 500, cid, var)
		exhaustion.set(cid, storage, waittime)  
	return true
end 
 