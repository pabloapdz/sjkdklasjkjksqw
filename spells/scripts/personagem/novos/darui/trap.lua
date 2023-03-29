local config = { 
storage = 91811,
duration = 1 --- duração
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1350, -15.0, -1550)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -15.0, -1500, -15.0, -1750)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -1000)

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
local time = 2 -- tempo paralyzado

local waittime = 30 -- Tempo de exhaustion
local storage = 8899

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

	local target = variantToNumber(var)    
	local positiontarget = {x=getThingPos(target).x,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
	local positiontarget1 = {x=getThingPos(target).x,y=getThingPos(target).y,z=getThingPos(target).z} -- posição do efeito
    local positionplayer = {x=getThingPos(cid).x,y=getThingPos(cid).y,z=getThingPos(cid).z} -- posição do efeito
  	local effecttarget = 0 -- Effect que vai sair
  	local effecttarget1 = 989 -- Effect que vai sair
   	local effectplayer = 989

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


local function No_Move_Target()
doCreatureSetNoMove(target, false)
end

doCreatureSetNoMove(target, true)
doAddCondition(target, condition)
addEvent(No_Move_Target, time*1000)
exhaustion.set(cid, storage, waittime)
    return true,doCombat(cid, combat, var)
	
end
