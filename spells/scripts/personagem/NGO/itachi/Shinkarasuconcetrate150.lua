local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -10, -3000, -12, -3500)


arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1.5 -- Tempo de exhaustion
local storage = 100021


local parameters = { cid = cid, var = var}
--local target = getCreatureTarget(cid)  -- efeito no alvo
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 52) 
--addEvent(doSendMagicEffect, 1, {x = target.x, y = target.y, z = target.z}, 52)
--addEvent(onCastSpell1, 800, parameters)

exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat1, var)
--return true
end 