local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7, -1600, -7, -1800)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -7, -1800, -7, -1800)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}

arr2 = {
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 2, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)
--local positionME = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
--doSendMagicEffect(positionME, 237)
local positionME = {x=getPlayerPosition(cid).x+2, y=getPlayerPosition(cid).y+2, z=getPlayerPosition(cid).z}
doSendMagicEffect(positionME, 31)  
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
return true
end 