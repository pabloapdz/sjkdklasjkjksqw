local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -15, -2625, -18., -3750)

--local condition = createConditionObject(CONDITION_PARALYZE)
--setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -600)
--setConditionFormula(condition, -9.5, 0, -9.5, 0)
--setCombatCondition(combat, condition)


local arr = {
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{ 0, 0, 0, 0, 1, 1, 3, 1, 1, 0, 0, 0, 0},
{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{ 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
local waittime = 2
local storage = 8222

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local pos1 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local pos2 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local pos3 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}

doSendMagicEffect(pos1, 160)
doSendMagicEffect(pos2, 160)
doSendMagicEffect(pos3, 160)

-- doCreatureSay(cid, "Suiton Senshokuko", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
doCombat(cid, combat, var)
return true
end