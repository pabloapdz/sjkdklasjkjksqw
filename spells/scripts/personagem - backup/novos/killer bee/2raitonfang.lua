local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_WHITE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.75, -135, -0.75, -200)

arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
addEvent(doSendMagicEffect, 100, {x = pos.x, y = pos.y, z = pos.z}, 232)
addEvent(doSendMagicEffect, 200, {x = pos.x+1, y = pos.y+1, z = pos.z}, 348)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 400, parameters)
return TRUE
end 