local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1650, -17.0, -1950)

arr = {
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

local function onCastSpell1(parameters)
return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 5 -- Tempo de exhaustion
local storage = 8229

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x+1, y=p.y-1, z=p.z},
[1] = {x=p.x+3, y=p.y+1, z=p.z},
[2] = {x=p.x+1, y=p.y+3, z=p.z},
[3] = {x=p.x-1, y=p.y+1, z=p.z}
}
local y = {
[0] = 1034,
[1] = 1035,
[2] = 1036,
[3] = 1037
}

pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]

doSendMagicEffect(pos, eff)
--doCreatureSay(cid, "Aian Kuro", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)

local position = getPlayerPosition(cid)
local parameters = { cid = cid, var = var}

addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 500, parameters)
return TRUE
end