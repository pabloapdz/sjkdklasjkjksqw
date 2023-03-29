local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1000, -13.0, -1200) 

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 25, 5150, -12500)
setCombatCondition(combat1, condition)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 2, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 931)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -7.0, -700, -9.0, -800) 

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y + 1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 935)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell2, 300, parameters, target)
--doCreatureSay(cid, "Sojasosai no Jutsu", TALKTYPE_MONSTER)
return TRUE
end