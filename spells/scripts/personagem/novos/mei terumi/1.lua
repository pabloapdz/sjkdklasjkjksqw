local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.67, -67, -1.0, -134)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1071)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

function onCastSpell(cid, var)

local waittime = 1 -- Tempo de exhaustion
local storage =100210

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

	
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell1, 200, parameters, target)
addEvent(onCastSpell1, 400, parameters, target)
--doCreatureSay(cid, "Suiton Shigure", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)  
return true
end
