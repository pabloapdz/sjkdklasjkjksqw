local combat1 = createCombatObject()

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 3, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 889) -- Susano
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3.0, -1000, -3.6, -1200)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 890) -- Explosão
doCombat(parameters.cid, parameters.combat2, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8223

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
-- doCreatureSay(cid, "Susano Yasaka no Magatama", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 7, parameters, cid)
addEvent(onCastSpell2, 300, parameters, target)
addEvent(onCastSpell2, 500, parameters, target)
addEvent(onCastSpell2, 600, parameters, target)
addEvent(onCastSpell2, 800, parameters, target)
addEvent(onCastSpell2, 1000, parameters, target)
addEvent(doSendDistanceShoot, 300, position, getCreaturePosition(getCreatureTarget(cid)), 82)
addEvent(doSendDistanceShoot, 500, position, getCreaturePosition(getCreatureTarget(cid)), 82)
addEvent(doSendDistanceShoot, 600, position, getCreaturePosition(getCreatureTarget(cid)), 82)
addEvent(doSendDistanceShoot, 800, position, getCreaturePosition(getCreatureTarget(cid)), 82)
addEvent(doSendDistanceShoot, 1000, position, getCreaturePosition(getCreatureTarget(cid)), 82)
exhaustion.set(cid, storage, waittime)
return TRUE
end