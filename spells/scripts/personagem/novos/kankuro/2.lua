local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -300, -3.0, -400)

function onCastSpell(cid, var)
--doCreatureSay(cid, "Kiki Ippatsu", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end