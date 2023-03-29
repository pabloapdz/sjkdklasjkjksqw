function onGetFormulaValues(cid, level, skill, attack, p, factor)
min = -(3 * (1 * (skill + 600) / 25 + (level - 1) / 10) / factor)
max = -(3* (1 * (skill + 800) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, CALLBACK_PARAM_LEVELMAGICVALUE, -3.0, -600, -3.0, -800)

function onCastSpell(cid, var)
local waittime = 1
local storage = 100073

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 209)

exhaustion.set(cid, storage, waittime)


return doCombat(cid, combat, var)
end
