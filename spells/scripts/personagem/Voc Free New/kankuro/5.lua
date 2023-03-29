local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 787)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1600, -9.0, -1800)

local condition = createConditionObject(CONDITION_POISON)
addDamageCondition(condition, 20, 1500, -8000)
setCombatCondition(combat, condition)

arr = {

{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 1, 3, 1, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local function onCastSpell1(parameters)
    return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8223

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local parameters = {cid = cid, var = var}
--doCreatureSay(cid, "Dokukiri Jigoku Baribari Hyaku Renpatsu", TALKTYPE_MONSTER)
local position = getCreaturePosition(cid)
addEvent(onCastSpell1, 1, parameters)
for i = 1, 40 do
doSendDistanceShoot(position, {x=position.x+math.random(-5,5), y=position.y+math.random(-5,5), z=position.z}, 106)
exhaustion.set(cid, storage, waittime)
end
return TRUE
end