local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7.0, -850, -9.0, -1000)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
--doCreatureSay(cid, "Doton Doromizu Funka", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 600, parameters)
doSendMagicEffect(position1, 1056)
return doCombat(cid, combat, var)
end