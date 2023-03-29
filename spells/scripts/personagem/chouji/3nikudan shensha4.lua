function onGetFormulaValues(cid, level, skill, attack, p, factor)
min = -(3 * (1 * (skill + 600) / 25 + (level - 1) / 10) / factor)
max = -(3* (1 * (skill + 800) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat, CALLBACK_PARAM_LEVELMAGICVALUE, -4, -400, -6, -700)

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 100073

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 209)

exhaustion.set(cid, storage, waittime)

return doCombat(cid, combat, var)
end
