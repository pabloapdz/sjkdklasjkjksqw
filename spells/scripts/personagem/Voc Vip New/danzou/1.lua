local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.5, -300, -2.0, -400)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.5, -300, -2.0, -400)

local function onCastSpell2(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 1023)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)

local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
--doCreatureSay(cid, "Futon Shinkugyoku", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 300, parameters, target)
addEvent(onCastSpell1, 500, parameters, target)
addEvent(onCastSpell1, 700, parameters, target)
addEvent(onCastSpell2, 1, parameters, cid)
addEvent(onCastSpell2, 300, parameters, cid)
addEvent(onCastSpell2, 700, parameters, cid)
addEvent(doSendDistanceShoot, 300, position, getCreaturePosition(getCreatureTarget(cid)), 168)
addEvent(doSendDistanceShoot, 500, position, getCreaturePosition(getCreatureTarget(cid)), 168)
addEvent(doSendDistanceShoot, 700, position, getCreaturePosition(getCreatureTarget(cid)), 168)
addEvent(doSendDistanceShoot, 800, position, getCreaturePosition(getCreatureTarget(cid)), 168)
end