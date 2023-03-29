local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.0, 100, -1.5, 150)

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 895)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -9.5, -950, -9.5, -1425)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 896)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 0.5 -- Tempo de exhaustion
local storage = 100013

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters, cid)
addEvent(onCastSpell1, 300, parameters, cid)
addEvent(onCastSpell1, 600, parameters, cid)
addEvent(onCastSpell1, 900, parameters, cid)
addEvent(onCastSpell2, 300, parameters, target)
addEvent(onCastSpell2, 600, parameters, target)
addEvent(onCastSpell2, 900, parameters, target)
-- doCreatureSay(cid, "Scythe Ultimate", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return true
end