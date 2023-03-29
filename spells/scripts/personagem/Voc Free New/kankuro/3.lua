local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.5, -300, -2.0, -400)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat, condition)


local arr = {
{0, 1, 0},
{1, 3, 1},
{0, 1, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
--doCreatureSay(cid, "Dokukiri Jigoku Bomb", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end