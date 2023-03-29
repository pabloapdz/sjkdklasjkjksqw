local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.75, -150, -0.75, -200)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 99996

local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendDistanceShoot, 150, getCreaturePosition(cid), pos, 100)
addEvent(doSendDistanceShoot, 150, getCreaturePosition(cid), pos, 100)
addEvent(doSendDistanceShoot, 150, getCreaturePosition(cid), pos, 100)
addEvent(doSendDistanceShoot, 150, getCreaturePosition(cid), pos, 100)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 400, parameters)
exhaustion.set(cid, storage, waittime)
return true
end 