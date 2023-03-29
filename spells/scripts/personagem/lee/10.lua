local config = { 
storage = 91811,
duration = 1 --- duração
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -6.0, -3230, -9.0, -4000)

local function visible(cid)
   if not isPlayer(cid) then return true end
   doCreatureSetHideHealth(cid, false)
end

local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration*1000)

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 5
local storage = 91811

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

	local target = variantToNumber(var)    
	local positiontarget = {x=getThingPos(target).x+2,y=getThingPos(target).y+1,z=getThingPos(target).z} -- posição do efeito
	local positiontarget1 = {x=getThingPos(target).x+3,y=getThingPos(target).y+3,z=getThingPos(target).z} -- posição do efeito
    local positionplayer = {x=getThingPos(cid).x,y=getThingPos(cid).y,z=getThingPos(cid).z} -- posição do efeito
  	local effecttarget = 841 -- Effect que vai sair
  	local effecttarget1 = 842 -- Effect que vai sair
   	local effectplayer = 0

local parameters = { cid = cid, var = var}

setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
--doAddCondition(cid, outfit)
    doCreatureSetHideHealth(cid, true)
    setPlayerStorageValue(cid, config.storage , os.time() + config.duration)
	    addEvent(visible, config.duration*1000, cid)

addEvent(onCastSpell1, 400, parameters)
addEvent(onCastSpell1, 600, parameters)
addEvent(onCastSpell1, 800, parameters)
addEvent(onCastSpell1, 1000, parameters)

    --local target_player = getCreatureTarget(cid)
    --doCreatureSetNoMove(target_player, true)



  	doSendMagicEffect(positionplayer, effectplayer)
    addEvent(doTeleportThing,100,cid, getThingPos(target))
    addEvent(doSendMagicEffect,200,positiontarget, effecttarget)
    addEvent(doSendMagicEffect,500,positiontarget1, effecttarget1)
-- doCreatureSay(cid, "Konoha Tsumuji Senpu", TALKTYPE_MONSTER) 
exhaustion.set(cid, storage, 4)

	    return true,doCombat(cid, combat, var)
end
