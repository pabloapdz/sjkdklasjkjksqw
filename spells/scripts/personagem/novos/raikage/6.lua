local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -13, -3500, -17, -4500)

function onCastSpell(cid, var)
if exhaustion.check(cid, 13175) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)

local waittime =  2 -- Tempo de exhaustion
local storage = 115915

exhaustion.set(cid, storage, waittime)

return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 1031)
--doCreatureSay(cid, "Girochin Doroppu", TALKTYPE_MONSTER)
exhaustion.set(cid, 13175, 2)
return doCombat(cid, combat, var)
end