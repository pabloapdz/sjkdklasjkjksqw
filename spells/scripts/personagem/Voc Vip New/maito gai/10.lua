local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.0, -1050, -10.0, -1250)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, 66)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1250, -12.0, -1450)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, 66)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -14.0, -1450, -16.0, -1650)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 5 -- Tempo de exhaustion
local storage = 8229

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

	local target = variantToNumber(var)    
	local positiontarget = {x=getThingPos(target).x+2,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
	local positiontarget1 = {x=getThingPos(target).x+2,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
    local positionplayer = {x=getThingPos(cid).x,y=getThingPos(cid).y,z=getThingPos(cid).z} -- posição do efeito
  	local effecttarget = 0 -- Effect que vai sair
  	local effecttarget1 = 0 -- Effect que vai sair
   	local effectplayer = 0

    local parameters = { cid = cid, var = var}
	
    addEvent(onCastSpell1, 500, parameters)

  	doSendMagicEffect(positionplayer, effectplayer)
    addEvent(doTeleportThing,100,cid, getThingPos(target))
    addEvent(doSendMagicEffect,500,positiontarget, effecttarget)
    addEvent(doSendMagicEffect,700,positiontarget1, effecttarget1)
	
	local target = getCreatureTarget(cid)  -- efeito no alvo
    local pos = getCreaturePosition(target)
    local poz = getCreaturePosition(target) -- effeito no caster 
	
--doCreatureSay(cid, "Yagai", TALKTYPE_MONSTER)

	if getCreatureStorage(cid, 2003) == 1 then --- Dragao Red
addEvent(doSendMagicEffect, 200, {x = poz.x+1, y = poz.y, z = poz.z}, 1124) -- Yagai Dragão Vermelho
addEvent(doSendMagicEffect, 700, {x = poz.x+2, y = poz.y+2, z = poz.z}, 1125) -- Explosão Vermelha
exhaustion.set(cid, storage, waittime)
		return doCombat(cid, combat2, var)
	else
	end
addEvent(doSendMagicEffect, 200, {x = poz.x+1, y = poz.y, z = poz.z}, 1106) -- Yagai Dragão Amarelo
addEvent(doSendMagicEffect, 700, {x = poz.x+2, y = poz.y+1, z = poz.z}, 1108) -- Explosão Amarela
exhaustion.set(cid, storage, waittime)
end