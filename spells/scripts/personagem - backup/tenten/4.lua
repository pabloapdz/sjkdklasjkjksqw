local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1200, -5.0, -1400)

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 100011

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 455)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end
