local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -30, -16150, -45, -20000)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local function effect01(position1)
doSendMagicEffect(position1, 855) -- Explosao
end

function onCastSpell(cid, var)
local waittime = 4
local storage = 82245

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
-- doCreatureSay(cid, "Suiton Fuin Suigadan", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 900, parameters)
addEvent(effect01, 1, position1)
exhaustion.set(cid, storage, waittime)
end