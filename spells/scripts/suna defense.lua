local config = { 
storage = 3727678,
cooldown = 45,  --- tempo entre um uso e outro
duration = 3, --- dura��o
effect1 = 10 -- efeito que sai ao falar a spell
} 


function onCastSpell(cid, var)
  
  if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then
setPlayerStorageValue(cid, 55695, os.time())
doSendMagicEffect(getCreaturePosition(cid), config.effect1)
setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doPlayerSendTextMessage(cid, 27, "Voc� ativou ".. config.duration .." segundos de Kaiten modo defensivo.")
else
doPlayerSendCancel(cid, "Voc� precisa aguardar "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." segundos.")
return false
end  
    return true
end