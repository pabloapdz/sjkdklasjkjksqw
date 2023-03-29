local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 119)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.34, -134, -2.0, -234)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 119)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.34, -134, -2.0, -234)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 119)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.34, -134, -2.0, -234)

arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{3}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var)
	local waittime = 1 -- Tempo de exhaustion
	local storage =100210

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
end

local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)
local poz = getCreaturePosition(cid)
addEvent(doSendMagicEffect, 100, {x = poz.x+1, y = poz.y+1, z = poz.z}, 82)
addEvent(doSendMagicEffect, 300, {x = poz.x+1, y = poz.y+1, z = poz.z}, 82)
addEvent(doSendMagicEffect, 600, {x = poz.x+1, y = poz.y+1, z = poz.z}, 82)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
exhaustion.set(cid, storage, waittime)  
return true
end 