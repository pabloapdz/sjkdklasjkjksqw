local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7.0, -850, -9.0, -1000)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 973)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -7.0, -850, -9.0, -1000)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 973)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell2, 500, parameters, target)
--doCreatureSay(cid, "", TALKTYPE_MONSTER)
end