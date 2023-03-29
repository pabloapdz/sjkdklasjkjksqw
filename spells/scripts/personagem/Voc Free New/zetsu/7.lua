local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -9.0, -1050, -10.0, -1250)

function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8226

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 978)
--doCreatureSay(cid, "", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end