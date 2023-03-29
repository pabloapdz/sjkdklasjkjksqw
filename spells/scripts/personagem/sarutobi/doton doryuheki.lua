local combat1 = createCombatObject()

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y - 2, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 648)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()

local function onCastSpell2(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 3, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 648)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local combat3 = createCombatObject()

local function onCastSpell3(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x - 1, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 648)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -2.12, -722, -2.45, -834)

local function onCastSpell4(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
doCombat(parameters.cid, parameters.combat4, parameters.var)
end

function onCastSpell(cid, var)

local waittime = 3 -- Tempo de exhaustion
local storage =19877


if isPlayer(cid) and exhaustion.check(cid, storage) == true then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4 }

local position1 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}

addEvent(onCastSpell1, 1, parameters, cid)
addEvent(onCastSpell2, 1, parameters, cid)
addEvent(onCastSpell3, 1, parameters, cid)
addEvent(onCastSpell4, 300, parameters, target)
addEvent(onCastSpell4, 300, parameters, target)
addEvent(onCastSpell4, 300, parameters, target)
addEvent(onCastSpell4, 600, parameters, target)
addEvent(onCastSpell4, 600, parameters, target)
addEvent(onCastSpell4, 600, parameters, target)
addEvent(onCastSpell4, 900, parameters, target)
addEvent(onCastSpell4, 900, parameters, target)
addEvent(onCastSpell4, 900, parameters, target)


addEvent(doSendDistanceShoot, 300, position1, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 300, position2, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 300, position3, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 600, position1, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 600, position2, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 600, position3, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 900, position1, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 900, position2, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's
addEvent(doSendDistanceShoot, 900, position3, getCreaturePosition(getCreatureTarget(cid)), 87) -- stone doton's

exhaustion.set(cid, storage, waittime)
-- doCreatureSay(cid, "Doton Doryuheki", TALKTYPE_MONSTER)
return TRUE
end