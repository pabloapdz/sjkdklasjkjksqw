local combat1 = createCombatObject()

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y - 2, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 905) -- Susanoo
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -0.67, -100, -1, -134)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x , y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 906) -- Esquerda
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 0.5
local storage = 100035

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell1, 300, parameters, target)
addEvent(onCastSpell1, 600, parameters, target)
addEvent(onCastSpell1, 900, parameters, target)

addEvent(onCastSpell2, 300, parameters, target)
addEvent(onCastSpell2, 600, parameters, target)
addEvent(onCastSpell2, 900, parameters, target)

exhaustion.set(cid, storage, waittime)
--doCreatureSay(cid, "Shura no Ko", TALKTYPE_MONSTER)
return TRUE
end