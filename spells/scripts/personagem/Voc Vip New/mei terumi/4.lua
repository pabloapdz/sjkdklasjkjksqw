local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7.0, -850, -9.0, -1000)

function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 1065)
--doCreatureSay(cid, "Dai Raisuiryudan", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end