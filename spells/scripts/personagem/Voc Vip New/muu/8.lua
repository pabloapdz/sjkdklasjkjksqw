local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -8.0, -750, -10.0, -950)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local function effect02(position2)
doSendMagicEffect(position2, 0) -- Explosao
end

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8226

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local position2 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
--doCreatureSay(cid, "Doton Takai Murasakiiro", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 600, parameters)
doSendMagicEffect(position1, 1050)
doSendMagicEffect(position2, 1050)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end