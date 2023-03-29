function formulaByWeaponDmg(cid, level, skill, attack, factor)
min = -(1.2 * (1 * (skill + 150) / 25 + (level - 1) / 10) / factor)
max = -(2 * (2 * (skill + 200) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 23)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -150, -2.0, -200) 

function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 0)
return doCombat(cid, combat, var)
end
