local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -6.5, -1750, -8.5, -2250)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -19.0, -4750, -19.0, -5700)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -6.5, -1750, -8.5, -2250)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end
 
function onCastSpell(cid, var)
if isPlayer(cid) and exhaustion.check(cid, 19455) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 843)
addEvent(onCastSpell1, 1, parameters)
local Mana_Drain = addEvent(onCastSpell2, 200, parameters)
doCreatureAddMana(cid, Mana_Drain)
addEvent(onCastSpell3, 200, parameters)
-- doCreatureSay(cid, "Dai Juhou Punch", TALKTYPE_MONSTER)
exhaustion.set(cid, 19455, 2)
return doCombat(cid, combat, var)
end