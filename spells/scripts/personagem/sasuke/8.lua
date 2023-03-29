local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -12.5, -4500, -15.0, -8000)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)

local waittime = 3 -- Tempo de exhaustion
local storage = 5223

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
	return false
end

	local target = variantToNumber(var)    
	local positiontarget = {x=getThingPos(target).x+1,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
	local positiontarget1 = {x=getThingPos(target).x+1,y=getThingPos(target).y+1,z=getThingPos(target).z} -- posição do efeito
    local positionplayer = {x=getThingPos(cid).x,y=getThingPos(cid).y,z=getThingPos(cid).z} -- posição do efeito
  	local effecttarget = 837 -- Effect que vai sair
  	local effecttarget1 = 838 -- Effect que vai sair
   	local effectplayer = 0

local parameters = { cid = cid, var = var}

    addEvent(onCastSpell1, 600, parameters)

  	doSendMagicEffect(positionplayer, effectplayer)
    --addEvent(doTeleportThing,100,cid, getThingPos(target))
    addEvent(doSendMagicEffect,200,positiontarget, effecttarget)
    addEvent(doSendMagicEffect,600,positiontarget1, effecttarget1)  
  
  exhaustion.set(cid, storage, waittime)	
  return true,doCombat(cid, combat, var)
end
