local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -25.0, -9000, -30.0, -16000)

function onCastSpell(cid, var)
local waittime = 4 -- Tempo de exhaustion
local storage = 8228

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 1072)
--doCreatureSay(cid, "Dai Suiton Suiryudan no Jutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end