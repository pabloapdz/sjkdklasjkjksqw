local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 158)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.0, -1000, -3.6, -1200)

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 2, y=getCreaturePosition(cid).y + 1, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 879)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x - 3, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 879)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local function onCastSpell3(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 4, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 879)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 6222

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1 }
doCreatureSay(cid, "Dai Shiki Shuriken", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 100, parameters, cid)
addEvent(onCastSpell1, 300, parameters, cid)
addEvent(onCastSpell1, 500, parameters, cid)
addEvent(onCastSpell1, 700, parameters, cid)
addEvent(onCastSpell1, 900, parameters, cid)

exhaustion.set(cid, storage, waittime)
return TRUE
end