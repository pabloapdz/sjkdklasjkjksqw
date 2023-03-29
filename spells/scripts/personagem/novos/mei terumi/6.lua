local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -19, -6500, -22, -7500)

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8226

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+2, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
doSendMagicEffect(position1, 1062)
--doCreatureSay(cid, "Futton Komu no Jutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end