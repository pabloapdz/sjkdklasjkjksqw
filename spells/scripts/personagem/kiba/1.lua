function formulaByWeaponDmg(cid, level, skill, attack, factor)
min = -(1.2 * (1 * (skill + 150) / 25 + (level - 1) / 10) / factor)
max = -(2 * (2 * (skill + 200) / 25 + (level - 1) / 10) / factor)
return min, max
end

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 23)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.0, -200, -3.0, -300) 

function onCastSpell(cid, var)
local waittime = 0.5 -- Tempo de exhaustion
local storage = 1100101

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 0)
return doCombat(cid, combat, var)
end
