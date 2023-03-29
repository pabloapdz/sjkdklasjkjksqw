local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_PURPLE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7.0, -3500, -9.0, -5000)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1008)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

function onCastSpell(cid, var)

local waittime = 1 -- Tempo de exhaustion
local storage =100212

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1 }
addEvent(onCastSpell1, 200, parameters, target)
addEvent(doSendDistanceShoot, 1, position, getCreaturePosition(getCreatureTarget(cid)), 169)
--doCreatureSay(cid, "Katon Dragon no Endan", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)  
return true
end

