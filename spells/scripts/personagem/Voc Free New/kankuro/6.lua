local combat1 = createCombatObject()

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat2, condition)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat3, condition)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat4, condition)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat5, condition)

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat6, condition)

local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat7, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat7, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat7, condition)

local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat8, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat8, COMBAT_FORMULA_LEVELMAGIC, -1.75, -400, -1.75, -465)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -3000)
setCombatCondition(combat8, condition)

local condition1 = createConditionObject(CONDITION_POISON)
addDamageCondition(condition1, 10, 1500, -10000)
setCombatCondition(combat1, condition1)

local condition2 = createConditionObject(CONDITION_POISON)
addDamageCondition(condition2, 10, 1500, -10000)
setCombatCondition(combat5, condition2)

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 787)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 787)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

local function onCastSpell4(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 787)
doCombat(parameters.cid, parameters.combat4, parameters.var)
end

local function onCastSpell5(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 0)
doCombat(parameters.cid, parameters.combat5, parameters.var)
end

local function onCastSpell6(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 787)
doCombat(parameters.cid, parameters.combat6, parameters.var)
end

local function onCastSpell7(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 787)
doCombat(parameters.cid, parameters.combat7, parameters.var)
end

local function onCastSpell8(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y + 0, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 787)
doCombat(parameters.cid, parameters.combat8, parameters.var)
end

local arr1 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr2 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr3 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr4 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr5 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr6 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr7 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local arr8 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
local area7 = createCombatArea(arr7)
local area8 = createCombatArea(arr8)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
setCombatArea(combat6, area6)
setCombatArea(combat7, area7)
setCombatArea(combat8, area8)


function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5, combat6 = combat6, combat7 = combat7, combat8 = combat8 }
--doCreatureSay(cid, "Dokukiri Jigoku Renpatsu", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 100, parameters, target)
addEvent(onCastSpell2, 100, parameters, target)
addEvent(onCastSpell3, 400, parameters, target)
addEvent(onCastSpell4, 400, parameters, target)
addEvent(onCastSpell5, 600, parameters, target)
addEvent(onCastSpell6, 600, parameters, target)
addEvent(onCastSpell7, 800, parameters, target)
addEvent(onCastSpell8, 800, parameters, target)
return TRUE
end  