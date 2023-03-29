local config = { 
storage = 3482101,
cooldown = 60,  --- tempo entre um uso e outro
duration = 5, --- duração
effect1 = 694 -- efeito que sai ao falar a spell
} 


--local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration * 1000, false)

local function onCastSpell1(cid, var)
  local pos = getCreaturePosition(cid)
  --local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
  --doSendMagicEffect(position1, 678)
  addEvent(doSendMagicEffect, 100, {x = pos.x, y = pos.y, z = pos.z}, 694)
  return doCombat(cid, combat1, var)
end


function onCastSpell(cid, var)
  
  if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then
setPlayerStorageValue(cid, 55695, os.time())
doSendMagicEffect(getCreaturePosition(cid), config.effect1)
setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doCreatureSay(cid,"INVENCIVEL!!!", 19)
--doAddCondition(cid, outfit)
doPlayerSendTextMessage(cid, 27, "Agora voce tem ".. config.duration .." de invulnerabilidade.")
for k = 1, 10 do
    addEvent(function()
        if isCreature(cid) then
            addEvent(onCastSpell1, 200, cid, var)
        end
    end, 1 + ((k-1) * 500))
end
else
doPlayerSendCancel(cid, "Sua spell esta em cooldown, voce precisa esperar "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." segundos.")
return false
end  
    return true
end