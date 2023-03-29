local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -6.3, -1800, -8.1, -2250)

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
local waittime = 0.1 -- Tempo de exhaustion
local storage =100201

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end


local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x+1, y=p.y, z=p.z},
[1] = {x=p.x+2, y=p.y+1, z=p.z},
[2] = {x=p.x+1, y=p.y+2, z=p.z},
[3] = {x=p.x, y=p.y+1, z=p.z}
}
local y = {
[0] = 1110, -- /\
[1] = 1111, -- >
[2] = 1112, -- \/
[3] = 1113  -- <
}

pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]

doSendMagicEffect(pos, eff)
--doCreatureSay(cid, "Saigo Asa Kujaku", TALKTYPE_MONSTER)

local position = getPlayerPosition(cid)
local parameters = { cid = cid, var = var}

addEvent(onCastSpell1, 100, parameters)
exhaustion.set(cid, storage, waittime)  
return TRUE
end