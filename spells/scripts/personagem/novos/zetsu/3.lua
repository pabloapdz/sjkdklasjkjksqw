local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -4, -600, -6, -700)

function onCastSpell(cid, var)


local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 967)
--doCreatureSay(cid, "", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end