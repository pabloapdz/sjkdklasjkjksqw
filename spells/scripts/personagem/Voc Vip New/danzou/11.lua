local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -14.0, -1500, -14.0, -1750)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x - 4, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1017) -- Esquerda 
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 4, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1016) -- Direita
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local combat3 = createCombatObject()

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y - 4, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1019) -- Cima
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

local combat4 = createCombatObject()

local function onCastSpell4(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y + 4, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1018) -- Baixo
doCombat(parameters.cid, parameters.combat4, parameters.var)
end

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1500, -15.0, -1750)

local function onCastSpell5(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 4, y=getCreaturePosition(target).y + 3, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 1020) -- Explosão
doCombat(parameters.cid, parameters.combat5, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 5 -- Tempo de exhaustion
local storage = 8229

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell2, 1, parameters, target)
addEvent(onCastSpell3, 1, parameters, target)
addEvent(onCastSpell4, 1, parameters, target)
addEvent(onCastSpell5, 500, parameters, target)
--doCreatureSay(cid, "Ura Shiso Fuinjutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
end