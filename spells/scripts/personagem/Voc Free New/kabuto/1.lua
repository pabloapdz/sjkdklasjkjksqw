local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.5, -300, -2.0, -400)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -2000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)


local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 956)
--doCreatureSay(cid, "Dai Hebi no Jutsu", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end