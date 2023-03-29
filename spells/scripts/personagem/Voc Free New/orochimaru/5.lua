local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end


function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 924)
--doCreatureSay(cid, "Idaina Hebi no Kougeki", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end