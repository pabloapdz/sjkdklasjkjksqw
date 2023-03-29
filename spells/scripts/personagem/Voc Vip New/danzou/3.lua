local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1024)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)

local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
--doCreatureSay(cid, "Futon Shinkuha", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 300, parameters, target)
addEvent(onCastSpell1, 500, parameters, target)
addEvent(onCastSpell1, 700, parameters, target)
addEvent(onCastSpell2, 1000, parameters, target)
addEvent(doSendDistanceShoot, 1, position, getCreaturePosition(getCreatureTarget(cid)), 167)
addEvent(doSendDistanceShoot, 300, position, getCreaturePosition(getCreatureTarget(cid)), 167)
addEvent(doSendDistanceShoot, 700, position, getCreaturePosition(getCreatureTarget(cid)), 167)
addEvent(doSendDistanceShoot, 900, position, getCreaturePosition(getCreatureTarget(cid)), 167)
addEvent(doSendDistanceShoot, 1100, position, getCreaturePosition(getCreatureTarget(cid)), 167)
end