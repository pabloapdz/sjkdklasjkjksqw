local config = { 
storage = 21580,
cooldown = 40  --- tempo entre um uso e outro
} 

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -5000)

function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local efepos = {x=targetpos.x+3, y=targetpos.y+3, z=targetpos.z}
local efepos2 = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
local time = 5 -- tempo paralyzado

local target = getCreatureTarget(cid)
local TargetPos = getCreaturePosition(target)
local PlayerPos = getCreaturePosition(cid)

if not isPlayer(target) then
doPlayerSendCancel(cid, "Kongo Roheki no Jutsu so pode ser usado em Players.")
return FALSE
end

  if os.time() - getPlayerStorageValue(cid, 21580) >= config.cooldown then
setPlayerStorageValue(cid, 21580, os.time())

		-- doCreatureSay(cid, "Kongo Roheki", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Kongo Roheki esta em cooldown, sera possivel usa-lo novamente em "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 21580))).." segundos.")
return false
end

local function No_Move_Target()
doCreatureSetNoMove(target, false)
end

doCreatureSetNoMove(target, true)
doAddCondition(target, condition)
addEvent(doSendMagicEffect, 600, efepos, 875) -- Prisao
addEvent(doSendMagicEffect, 900, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 1200, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 1600, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 1900, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 2200, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 2600, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 2900, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 3200, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 3600, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 3900, efepos2, 876) -- Prisao Fechada
addEvent(doSendMagicEffect, 4200, efepos2, 876) -- Prisao Fechada
addEvent(No_Move_Target, time*1000)
return TRUE
end