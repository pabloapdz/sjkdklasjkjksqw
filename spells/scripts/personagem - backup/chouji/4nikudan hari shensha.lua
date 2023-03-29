function onGetFormulaValues(cid, level, skill, attack, p, factor)
min = -(4 * (1 * (skill + 800) / 25 + (level - 1) / 10) / factor)
max = -(4 * (1 * (skill + 1000) / 25 + (level - 1) / 10) / factor)
return min, max
end

function onGetFormulaValues2(cid, level, skill, attack, p, factor)
min = -(0.2 * (1 * (skill + 2) / 25 + (level - 1) / 10) / factor)
max = -(0.2 * (1 * (skill + 2) / 25 + (level - 1) / 10) / factor)
return min, max
end


local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatFormula(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, -4.0, -800, -4.0, -1000)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, CALLBACK_PARAM_LEVELMAGICVALUE, -0.2, -2, -0.2, -2)


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
local waittime = 2
local storage = 100072

if exhaustion.check(cid, storage) then
return false
end



local position1 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 0, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell2, 500, parameters)
doSendMagicEffect(position1, 210)

exhaustion.set(cid, storage, waittime)

return true
end 