local config = { 
storage = 91811,
duration = 1 --- duração
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1350, -13.0, -1350)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -12.0, -1350, -13.0, -1350)

local function visible(cid)
   if not isPlayer(cid) then return true end
end

local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration*1000)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

local function onCastSpell2(parameters)
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
	local positiontarget = {x=getThingPos(target).x+2,y=getThingPos(target).y+2,z=getThingPos(target).z} -- posição do efeito
	local positiontarget1 = {x=getThingPos(target).x+2,y=getThingPos(target).y+2,z=getThingPos(target).z} -- posição do efeito
    local positionplayer = {x=getThingPos(cid).x,y=getThingPos(cid).y,z=getThingPos(cid).z} -- posição do efeito
  	local effecttarget = 0 -- Effect que vai sair
  	local effecttarget1 = 1086 -- Effect que vai sair
   	local effectplayer = 0

local parameters = { cid = cid, var = var}

addEvent(onCastSpell1, 600, parameters)

setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doAddCondition(cid, outfit)
    setPlayerStorageValue(cid, config.storage , os.time() + config.duration)
	    addEvent(visible, config.duration*1000, cid)
		
  	doSendMagicEffect(positionplayer, effectplayer)
    addEvent(doTeleportThing,100,cid, getThingPos(target))
    addEvent(doSendMagicEffect,0,positiontarget, effecttarget)
    addEvent(doSendMagicEffect,200,positiontarget1, effecttarget1)
--doCreatureSay(cid, "Shunshin Shinkarasu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)         
    return true,doCombat(cid, combat, var)
end
