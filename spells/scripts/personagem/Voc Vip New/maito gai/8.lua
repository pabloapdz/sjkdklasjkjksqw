-------Created:FABIAN MARZAN/ DISCORD: SoyFabi#5938-------
---------SCRIPTS---------
-----------FOR---------
----------NARUTO-------

local config = { 
storage = 91811,
duration = 1 --- duração
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_HITCOLOR, 215)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.0, -1050, -10.0, -1150)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_HITCOLOR, 66)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1250, -12.0, -1350)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, 143)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -14.0, -1450, -14.0, -1550)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_HITCOLOR, 180)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -16.0, -1650, -16.0, -1750)

local function visible(cid)
   if not isPlayer(cid) then return true end
   doCreatureSetHideHealth(cid, false)
end

local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration*1000)

function onCastSpell(cid, var)
local waittime = 3 -- Tempo de exhaustion
local storage = 8227

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

	local target = variantToNumber(var)    
	local positiontarget = {x=getThingPos(target).x+2,y=getThingPos(target).y+2,z=getThingPos(target).z} -- posição do efeito
	local positiontarget1 = {x=getThingPos(target).x+2,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
    local positionplayer = {x=getThingPos(cid).x,y=getThingPos(cid).y,z=getThingPos(cid).z} -- posição do efeito
  	local effecttarget = 0 -- Effect que vai sair
  	local effecttarget1 = 1099 -- Effect que vai sair
   	local effectplayer = 0

local parameters = { cid = cid, var = var}

setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doAddCondition(cid, outfit)
    doCreatureSetHideHealth(cid, true)
    setPlayerStorageValue(cid, config.storage , os.time() + config.duration)
	    addEvent(visible, config.duration*1000, cid)
		
    addEvent(onCastSpell1, 500, parameters)

  	doSendMagicEffect(positionplayer, effectplayer)
    addEvent(doTeleportThing,100,cid, getThingPos(target))
    addEvent(doSendMagicEffect,500,positiontarget, effecttarget)
    addEvent(doSendMagicEffect,700,positiontarget1, effecttarget1)
	
	local target = getCreatureTarget(cid)  -- efeito no alvo
    local pos = getCreaturePosition(target)
    local poz = getCreaturePosition(target) -- effeito no caster 
	
	--doCreatureSay(cid, "Sekizo", TALKTYPE_MONSTER)
	
	if getCreatureStorage(cid, 2000) == 1 then --- GREEN
addEvent(doSendMagicEffect, 300, {x = poz.x+2, y = poz.y+2, z = poz.z}, 1121) -- Explosão Green
exhaustion.set(cid, storage, waittime)  
		return doCombat(cid, combat2, var)
	else
	end
	if getCreatureStorage(cid, 2001) == 1 then --- BLUE
addEvent(doSendMagicEffect, 300, {x = poz.x+2, y = poz.y+2, z = poz.z}, 1122) -- Explosão Blue
exhaustion.set(cid, storage, waittime)  
		return doCombat(cid, combat3, var)
	else
	end
	if getCreatureStorage(cid, 2002) == 1 then --- RED
addEvent(doSendMagicEffect, 300, {x = poz.x+2, y = poz.y+2, z = poz.z}, 1223) -- Explosão Red
exhaustion.set(cid, storage, waittime)  
		return doCombat(cid, combat4, var)
	else
	end

addEvent(doSendMagicEffect, 300, {x = poz.x+2, y = poz.y+2, z = poz.z}, 1105) -- Explosão Branca
exhaustion.set(cid, storage, waittime)  
		return doCombat(cid, combat, var)
	end

---DISCORD: SoyFabi#5938---