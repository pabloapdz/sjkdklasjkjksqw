local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

function onCastSpell(cid, var)


local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 1127)
--doCreatureSay(cid, "", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end