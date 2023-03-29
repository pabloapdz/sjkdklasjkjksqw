local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7.0, -550, -9.0, -750)

function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 1012)
--doCreatureSay(cid, "Mokuton Jihatsu", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end