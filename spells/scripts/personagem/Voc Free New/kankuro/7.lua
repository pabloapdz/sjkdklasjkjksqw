local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 166)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.75, -435, -1.75, -500)

arr = {
	{3}
}


local area = createCombatArea(arr)
setCombatArea(combat, area)
 
local function onCastSpell1(parameters)
return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end


function onCastSpell(cid, var)
local waittime = 2 -- Tempo de exhaustion
local storage = 8224

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

local position = getPlayerPosition(cid)
local parameters = { cid = cid, var = var}
--doCreatureSay(cid, "Chobuki Kogeki", TALKTYPE_MONSTER)
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell1, 300, parameters)
addEvent(onCastSpell1, 500, parameters)
addEvent(onCastSpell1, 700, parameters)
addEvent(onCastSpell1, 900, parameters)
addEvent(onCastSpell1, 1200, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end