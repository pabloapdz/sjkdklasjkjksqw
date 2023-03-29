local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.0, -150, -1.0, -200)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -350)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
--doCreatureSay(cid, "Dokukiri Jigoku Attack", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end