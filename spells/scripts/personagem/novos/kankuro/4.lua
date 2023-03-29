local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -7.0, -2000, -9.0, -2500)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -5.0, -1500, -6.5, -1900)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 10, 1500, -4300)
setCombatCondition(combat1, condition)


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

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)

local function onCastSpell1(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)

local waittime = 1.5 -- Tempo de exhaustion
local storage = 110139

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local parameters = {cid = cid, var = var}
addEvent(onCastSpell1, 1, parameters)
addEvent(onCastSpell2, 1, parameters)
--doCreatureSay(cid, "Dokukiri Jigoku Kuroari", TALKTYPE_MONSTER)
return true
end