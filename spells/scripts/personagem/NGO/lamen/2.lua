local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 172)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 1245)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -300, -3.0, -400)

function onCastSpell(cid, var)

local waittime = 1 -- Tempo de exhaustion
local storage =100211

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 0)
exhaustion.set(cid, storage, waittime)  
return doCombat(cid, combat, var)
end
