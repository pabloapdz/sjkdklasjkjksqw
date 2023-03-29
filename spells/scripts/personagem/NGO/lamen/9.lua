local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 173)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -4.3, -3000, -5.0, -5333)

local condition = createConditionObject(CONDITION_BLEEDING)
addDamageCondition(condition, 5, 1000, -1000)
setCombatCondition(combat, condition)

local function onCastSpell1(parameters, target)
	local position1 = {x=getThingPosition(getCreatureTarget(parameters.cid)).x, y=getThingPosition(getCreatureTarget(parameters.cid)).y, z=getThingPosition(getCreatureTarget(parameters.cid)).z}
	doSendMagicEffect(position1, 0)
	doCombat(parameters.cid, parameters.combat, parameters.var)
end



function onCastSpell(cid, var)

local waittime = 3 -- Tempo de exhaustion
local storage =100212

local parameters = { cid = cid, var = var, combat = combat }
if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local target = getCreatureTarget(cid)
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell1, 100, parameters, target)
addEvent(onCastSpell1, 200, parameters, target)

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
exhaustion.set(cid, storage, waittime)  
return true
end
