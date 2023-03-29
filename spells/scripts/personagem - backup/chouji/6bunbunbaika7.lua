function onGetFormulaValues(cid, level, skill, attack, p, factor)
min = -(6 * (1 * (skill + 1400) / 25 + (level - 1) / 10) / factor)
max = -(6 * (1 * (skill + 1600) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, CALLBACK_PARAM_LEVELMAGICVALUE, -6.0, -1400, -6.0, -1600)

function onCastSpell(cid, var)
local waittime = 1
local storage = 8011
if exhaustion.check(cid, storage) then
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 222)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end