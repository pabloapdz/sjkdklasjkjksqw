local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15, -2625, -18, -3750)

arr = {
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
{1, 1, 1, 1, 1},
}

local area1 = createCombatArea(arr)
setCombatArea(combat1, area1)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8522

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local poss = getCreaturePosition(cid)

local function Flame_Shoot()
if isCreature(cid) then
for i=1, 5 do
local pos = {x=poss.x-5, y=poss.y-5, z=poss.z}
local pos2 = {x=poss.x+(math.random(-1,4)), y=poss.y+(math.random(-3,2)), z=poss.z}
local pos3 = {x=poss.x+(math.random(-3,2))+1, y=poss.y+(math.random(-2,4))-1, z=poss.z}
doSendMagicEffect(pos3, 1066)
end
end
return TRUE
end


local parameters = { cid = cid, var = var}
--doCreatureSay(cid, "", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 1, parameters)
addEvent(onCastSpell1, 1000, parameters)
addEvent(Flame_Shoot, 100)
addEvent(Flame_Shoot, 200)
addEvent(Flame_Shoot, 400)
addEvent(Flame_Shoot, 600)
addEvent(Flame_Shoot, 800)
addEvent(Flame_Shoot, 1000)
addEvent(Flame_Shoot, 1200)
addEvent(Flame_Shoot, 1400)
exhaustion.set(cid, storage, waittime)
return true
end