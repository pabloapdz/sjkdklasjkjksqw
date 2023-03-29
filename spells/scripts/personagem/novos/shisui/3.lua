local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -7.5, -4038, -11.3, -5000) 

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -7.5, -4038, -11.3, -5000) 

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -7.5, -4038, -11.3, -5000) 

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -7.5, -4038, -11.3, -5000)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1078)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1078)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

local function onCastSpell4(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1078)
doCombat(parameters.cid, parameters.combat4, parameters.var)
end

local function onCastSpell5(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1078)
doCombat(parameters.cid, parameters.combat5, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 3.5 -- Tempo de exhaustion
local storage = 8522

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position = {x=getCreaturePosition(cid).x+0, y=getCreaturePosition(cid).y+0, z=getCreaturePosition(cid).z}
addEvent(doSendMagicEffect, 0, position, 1009)

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5}
--doCreatureSay(cid, "Amaterasu Entenka", TALKTYPE_MONSTER)
addEvent(onCastSpell2, 400, parameters, target)
addEvent(onCastSpell3, 800, parameters, target)
addEvent(onCastSpell4, 1200, parameters, target)
addEvent(onCastSpell5, 1400, parameters, target)
exhaustion.set(cid, storage, waittime)
return true
end  