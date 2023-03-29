local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2, -200, -3.0, -300)

function onCastSpell(cid, var)


local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 981)
--doCreatureSay(cid, "", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end