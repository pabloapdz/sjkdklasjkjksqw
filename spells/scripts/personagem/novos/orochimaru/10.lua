local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -20, -7000, -24, -9000)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8227

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 932)
--doCreatureSay(cid, "Kusanagi no Tsurugi", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end