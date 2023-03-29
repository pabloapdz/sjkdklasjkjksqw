local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 7.0, -850, -9.0, -1000)

function onCastSpell(cid, var)
	
local waittime = 2 -- Tempo de exhaustion
local storage =100215

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 1011)
--doCreatureSay(cid, "Fuuton Shinkugyoku", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)  
return doCombat(cid, combat, var)
end