local config = { 
storage = 91813,
cooldown = 45,  --- tempo entre um uso e outro
duration = 3, --- duração
speed =  10,
effect1 = 125 -- efeito que sai ao falar a spell
} 

local function visible(cid)
   if not isPlayer(cid) then return true end
   doCreatureSetHideHealth(cid, false)
   --doChangeSpeed(cid, getCreatureSpeed(cid) - config.speed)
end

local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration*1000)

function onCastSpell(cid, var)


  if os.time() - getPlayerStorageValue(cid, 55689) >= config.cooldown then
setPlayerStorageValue(cid, 55689, os.time())
doSendMagicEffect(getCreaturePosition(cid), config.effect1)
setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doAddCondition(cid, outfit)
doPlayerSendTextMessage(cid, 27, "Voce tem agora ".. config.duration .." segundos de invulnerabilidade.")
    
    doCreatureSetHideHealth(cid, true)
    --doChangeSpeed(cid, getCreatureSpeed(cid) + config.speed)
      --doCreatureSay(cid, "Kawarimi no Jutsu", TALKTYPE_MONSTER)
    setPlayerStorageValue(cid, config.storage , os.time() + config.duration)
    addEvent(visible, config.duration*1000, cid)

else
doPlayerSendCancel(cid, "Kawarimi no Jutsu em cooldown, voce deve esperar "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55689))).." segundos.")
return false
end  
    return true
end