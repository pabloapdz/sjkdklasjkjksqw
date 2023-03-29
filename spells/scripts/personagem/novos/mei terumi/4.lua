local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -13, -3500, -17, -4500)

function onCastSpell(cid, var)

local waittime = 2 -- Tempo de exhaustion
local storage = 120129

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 1065)
--doCreatureSay(cid, "Dai Raisuiryudan", TALKTYPE_MONSTER)
return doCombat(cid, combat, var)
end