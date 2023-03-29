local combat1 = createCombatObject()

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 885)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -12.5, -4500, -15.0, -8000)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 0)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 5 -- Tempo de exhaustion
local storage = 8253

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local pos = getCreaturePosition(cid)
local target = getCreaturePosition(getCreatureTarget(cid))
local targetatk2 = {x=target.x+1, y=target.y, z=target.z} -- <<
local targetatk4 = {x=target.x+2, y=target.y+1, z=target.z} -- \/
local targetatk6 = {x=target.x+3, y=target.y, z=target.z} -- >>
local targetatk8 = {x=target.x+2, y=target.y-1, z=target.z} -- /\
local targetatk9 = {x=target.x+2, y=target.y, z=target.z} -- MEIO

local function magias(cid)
doSendMagicEffect(targetatk2, 886)
doSendMagicEffect(targetatk4, 886)
doSendMagicEffect(targetatk6, 886) -- Explosao
doSendMagicEffect(targetatk8, 886)
doSendMagicEffect(targetatk9, 886)
end

local position = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
addEvent(doSendMagicEffect, 0, position, 884)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 500, parameters, target)
addEvent(onCastSpell2, 1000, parameters, target)
addEvent(onCastSpell2, 1300, parameters, target)
addEvent(magias, 1400, cid)
	--doCreatureSay(cid, "Dai Katon Meteor no Jutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return TRUE
end  