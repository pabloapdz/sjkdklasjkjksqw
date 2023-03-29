local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 602)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -18.0, -1600, -18.0, -1800)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 602)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -18.0, -1600, -18.0, -1800)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 602)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -18.0, -1600, -18.0, -1800)


arr1 = {
	{0, 0, 0, 0, 0},
	{0, 1, 1, 1, 0},
	{0, 1, 3, 1, 0},
	{0, 1, 1, 1, 0},
	{0, 0, 0, 0, 0}
}

arr2 = {
	{1, 1, 1, 1, 1},
	{1, 0, 0, 0, 1},
	{1, 0, 3, 0, 1},
	{1, 0, 0, 0, 1},
	{1, 1, 1, 1, 1}
}

arr3 = {
	{0, 0, 1, 1, 1, 0, 0},
	{0, 0, 0, 0, 0, 0, 0},
	{1, 0, 0, 0, 0, 0, 1},
	{1, 0, 0, 3, 0, 0, 1},
	{1, 0, 0, 0, 0, 0, 1},
	{0, 0, 0, 0, 0, 0, 0},
	{0, 0, 1, 1, 1, 0, 0}
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
local waittime = 2 -- Tempo de exhaustion
local storage = 8223

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 10, {x = poz.x+1, y = poz.y, z = poz.z}, 362)
addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell2, 800, parameters)
addEvent(onCastSpell3, 1000, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 