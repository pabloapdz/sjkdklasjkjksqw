local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 111)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.75, -1250, -4.5, -1500)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 870)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 111)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.75, -1250, -4.5, -1500)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 871)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 111)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -3.75, -1250, -4.5, -1500)

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 872)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 111)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -3.75, -1250, -4.5, -1500)

local function onCastSpell4(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 873)
doCombat(parameters.cid, parameters.combat4, parameters.var)
end


function onCastSpell(cid, var)

local waittime = 2.3 -- Tempo de exhaustion
local storage =25678


if isPlayer(cid) and exhaustion.check(cid, storage) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4 }
addEvent(onCastSpell1, 200, parameters, target)
addEvent(onCastSpell2, 550, parameters, target)
addEvent(onCastSpell3, 650, parameters, target)
addEvent(onCastSpell4, 900, parameters, target)
-- doCreatureSay(cid, "Goton Dairendan no Jutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return TRUE
end 