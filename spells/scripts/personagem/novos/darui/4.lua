local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.5, -1000, -4.5, -1250)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 984)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.5, -1000, -4.5, -1250)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 0)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)

local waittime = 1.5 -- Tempo de exhaustion
local storage = 110137

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell2, 500, parameters, target)
--doCreatureSay(cid, "", TALKTYPE_MONSTER)
return true
end