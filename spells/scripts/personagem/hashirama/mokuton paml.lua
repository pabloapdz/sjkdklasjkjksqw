local combat1 = createCombatObject()

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 5, y=getCreaturePosition(target).y - 4, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 864) -- DEUS
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -3, -1615, -4.5, -2000)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 865) -- Mão Esquerda
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -3, -1615, -4.5, -2000)

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 3, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 866) -- Mão Direita
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 5 -- Tempo de exhaustion
local storage =18793

if exhaustion.check(cid, storage) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell1, 300, parameters, target)
addEvent(onCastSpell1, 600, parameters, target)
addEvent(onCastSpell1, 900, parameters, target)
addEvent(onCastSpell1, 1200, parameters, target)
addEvent(onCastSpell1, 1500, parameters, target)

addEvent(onCastSpell2, 300, parameters, target)
addEvent(onCastSpell2, 600, parameters, target)
addEvent(onCastSpell2, 900, parameters, target)
addEvent(onCastSpell2, 1200, parameters, target)
addEvent(onCastSpell2, 1500, parameters, target)

addEvent(onCastSpell3, 300, parameters, target)
addEvent(onCastSpell3, 600, parameters, target)
addEvent(onCastSpell3, 900, parameters, target)
addEvent(onCastSpell3, 1200, parameters, target)
addEvent(onCastSpell3, 1500, parameters, target)

exhaustion.set(cid, storage, waittime)
-- doCreatureSay(cid, "Senpo Mokuton Shin Susenju", TALKTYPE_MONSTER)
return TRUE
end