local combat1 = createCombatObject()

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 898)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -30, -16150, -45, -20000)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 897)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 98543

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position = {x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters, cid)
addEvent(onCastSpell2, 500, parameters, target)
addEvent(doSendDistanceShoot, 300, position, getCreaturePosition(getCreatureTarget(cid)), 36)
exhaustion.set(cid, 12135, 3.5)
--doCreatureSay(cid, "Hachibi Energy", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
end