local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -13, -3500, -17, -4500)

function onCastSpell(cid, var)


local waittime = 1 -- Tempo de exhaustion
local storage =100214

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

local parameters = { cid = cid, var = var}
--doCreatureSay(cid, "Doton Doromizu Funka", TALKTYPE_MONSTER)
--addEvent(onCastSpell1, 600, parameters)
doSendMagicEffect(position1, 1056)
exhaustion.set(cid, storage, waittime)  
return doCombat(cid, combat, var)
end