local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -142.5, -8550, -142.5, -10450)

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 214)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -142.5, -9500, -142.5, -12350)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y , z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 868)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
if isPlayer(cid) and exhaustion.check(cid, 13546) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters, cid)
addEvent(onCastSpell2, 600, parameters, target)
-- doCreatureSay(cid, "Suiton Suishoha", TALKTYPE_MONSTER)
exhaustion.set(cid, 13546, 4)
end