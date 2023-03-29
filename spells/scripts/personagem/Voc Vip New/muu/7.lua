local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1050, -10.0, -1250)

function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
--doCreatureSay(cid, "Doton Dragon Tougoku", TALKTYPE_MONSTER)
doSendMagicEffect(position1, 1047)
return doCombat(cid, combat, var)
end