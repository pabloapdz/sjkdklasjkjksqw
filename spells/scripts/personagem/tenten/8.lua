local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 153)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0, -0, -0, -0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 140)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -4, -1000, -4.5, -1500)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 135)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -4, -1000, -4.5, -1500)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 153)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -4, -1000, -4.5, -1500)


local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, 125)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -4, -1000, -4.5, -1500)


local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, 140)
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 28)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -19.0, -5225, -19.0, -7600)


arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{3}
}

arr4 = {
	{3}
}

arr5 = {
	{3}
}

arr6 = {
	{3}
}


local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
setCombatArea(combat6, area6)

 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat5, parameters.var)
end

local function onCastSpell6(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat6, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8223

if exhaustion.check(cid, storage) then
return false
end
local poz = getCreaturePosition(cid) -- effeito no caster
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+3, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 1, parameters)
addEvent(doSendMagicEffect, 1, {x = poz.x, y = poz.y, z = poz.z}, 3)

addEvent(doSendMagicEffect, 400, {x = position1.x+3, y = position1.y+0, z = position1.z}, 836)

addEvent(onCastSpell2, 400, parameters)
addEvent(doSendMagicEffect, 6000, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell3, 600, parameters)
addEvent(doSendMagicEffect, 600, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell4, 600, parameters)
addEvent(doSendMagicEffect, 600, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell5, 600, parameters)
addEvent(doSendMagicEffect, 600, {x = poz.x, y = poz.y, z = poz.z}, 3)
addEvent(onCastSpell6, 600, parameters)
addEvent(doSendMagicEffect, 600, {x = poz.x, y = poz.y, z = poz.z}, 3)
exhaustion.set(cid, storage, waittime)
return TRUE
end 