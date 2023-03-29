local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_PURPLE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -2, -300, -3, -400)

arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 0.5 -- Tempo de exhaustion
local storage = 100014

local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 100, getCreaturePosition(cid), pos, 12)
addEvent(onCastSpell1, 125, parameters)
addEvent(doSendDistanceShoot, 300, getCreaturePosition(cid), pos, 12)
addEvent(onCastSpell1, 325, parameters)
addEvent(doSendDistanceShoot, 500, getCreaturePosition(cid), pos, 12)
addEvent(onCastSpell1, 525, parameters)

exhaustion.set(cid, storage, waittime)
return true
end 