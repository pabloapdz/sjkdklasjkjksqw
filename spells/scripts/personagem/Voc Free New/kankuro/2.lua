local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 788)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -400, -2.0, -600)

function onCastSpell(cid, var)
--doCreatureSay(cid, "Kiki Ippatsu", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end