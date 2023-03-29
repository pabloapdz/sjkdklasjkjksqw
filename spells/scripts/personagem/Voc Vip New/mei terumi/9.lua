local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -14.0, -1350, -15.0, -1450)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1067)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -14.0, -1350, -15.0, -1450)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 5, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1068)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 5 -- Tempo de exhaustion
local storage = 8229

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }

addEvent(onCastSpell1, 200, parameters, target)
addEvent(onCastSpell1, 700, parameters, target)
addEvent(onCastSpell1, 1100, parameters, target)
addEvent(onCastSpell1, 1700, parameters, target)
addEvent(onCastSpell1, 2100, parameters, target)

addEvent(onCastSpell2, 500, parameters, target)
addEvent(onCastSpell2, 900, parameters, target)
addEvent(onCastSpell2, 1400, parameters, target)
addEvent(onCastSpell2, 1900, parameters, target)
addEvent(onCastSpell2, 2400, parameters, target)

--doCreatureSay(cid, "Yoton Yokai no Jutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
end