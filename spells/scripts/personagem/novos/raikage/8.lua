local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -19, -6500, -22, -7500)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8227

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

	local target = variantToNumber(var)    
	local positiontarget = {x=getThingPos(target).x,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
        local positionplayer = {x=getThingPos(target).x+1,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
  	local effecttarget = 1033 -- Effect que vai sair
   	local effectplayer = 1039
	
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 600, parameters)
 

    addEvent(doTeleportThing,100,cid, getThingPos(target))
    addEvent(doSendMagicEffect,200,positiontarget, effecttarget)
    addEvent(doSendMagicEffect,300,positionplayer, effectplayer)
doPlayerSendCancel(cid, "Use apenas em players.")
--doCreatureSay(cid, "Dai Rariatto", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
    return true,doCombat(cid, combat, var)
end