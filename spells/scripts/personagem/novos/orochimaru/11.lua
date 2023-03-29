local combat1 = createCombatObject()

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 927)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end


local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1800, -6.0, -3200)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 927)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1800, -6.0, -3200)

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y + 2, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 927)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1800, -6.0, -3200)

local function onCastSpell4(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 927)
doCombat(parameters.cid, parameters.combat4, parameters.var)
end

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1800, -6.0, -3200)

local function onCastSpell5(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 927)
doCombat(parameters.cid, parameters.combat5, parameters.var)
end

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTBLUE)
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1800, -6.0, -3200)

local function onCastSpell6(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 927)
doCombat(parameters.cid, parameters.combat6, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 8228

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

--doCreatureSay(cid, "Fuuton Daitoppa", TALKTYPE_MONSTER)


local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5, combat6 = combat6 }
addEvent(onCastSpell1, 1, parameters, cid)
addEvent(onCastSpell2, 250, parameters, target)
addEvent(onCastSpell3, 650, parameters, target)
addEvent(onCastSpell4, 1050, parameters, target)
addEvent(onCastSpell5, 1450, parameters, target)

local target = getCreatureTarget(cid)  -- efeito no alvo
local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster

addEvent(doSendDistanceShoot, 100, {x = pos.x+3, y = pos.y-4, z = pos.z}, {x = pos.x, y = pos.y, z = pos.z}, 0)

addEvent(doSendDistanceShoot, 500, {x = pos.x-2, y = pos.y-4, z = pos.z}, {x = pos.x, y = pos.y, z = pos.z}, 0)

addEvent(doSendDistanceShoot, 900, {x = pos.x+3, y = pos.y+5, z = pos.z}, {x = pos.x, y = pos.y, z = pos.z}, 0)

addEvent(doSendDistanceShoot, 1450, {x = pos.x-2, y = pos.y-4, z = pos.z}, {x = pos.x, y = pos.y, z = pos.z}, 0)

addEvent(doSendDistanceShoot, 1700, {x = pos.x-2, y = pos.y+5, z = pos.z}, {x = pos.x, y = pos.y, z = pos.z}, 0)

exhaustion.set(cid, storage, waittime)

return true
end 