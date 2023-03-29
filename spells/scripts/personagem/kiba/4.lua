function formulaByWeaponDmg(cid, level, skill, attack, factor)
min = -(5 * (1 * (skill + 1200) / 25 + (level - 1) / 10) / factor)
max = -(5 * (2 * (skill + 1400) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3, -300, -4.5, -525)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3, -300, -4.5, -525)


arr1 = {
	{0, 1, 0, 1, 0},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{0, 0, 1, 0, 0}
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
local waittime = 1 -- Tempo de exhaustion
local storage = 100004
if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local position1 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell2, 10, parameters)
addEvent(onCastSpell1, 100, parameters)
doSendMagicEffect(position1, 149)
doSendMagicEffect(position2, 149)
doSendMagicEffect(position3, 149)
exhaustion.set(cid, storage, waittime)
return true
end 