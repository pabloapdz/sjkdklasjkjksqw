local config = { 
storage = 21580,
cooldown = 40  --- tempo entre um uso e outro
} 

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -10000)

function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local efepos = {x=targetpos.x+2, y=targetpos.y+1, z=targetpos.z}
local time = 5 -- tempo paralyzado

local target = getCreatureTarget(cid)
local TargetPos = getCreaturePosition(target)
local PlayerPos = getCreaturePosition(cid)

if not isPlayer(target) then
doPlayerSendCancel(cid, "Hijutsu Mushidama no Jutsu so pode ser usado em Players.")
return FALSE
end

  if os.time() - getPlayerStorageValue(cid, 21580) >= config.cooldown then
setPlayerStorageValue(cid, 21580, os.time())

		--doCreatureSay(cid, "Hijutsu Mushidama no Jutsu", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Hijutsu Mushidama esta em cooldown, sera possivel usa-lo novamente em "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 21580))).." segundos.")
return false
end

local function No_Move_Target()
doCreatureSetNoMove(target, 0)
end

local parameters = { cid = cid, var = var}
doCreatureSetNoMove(target, 1)
doAddCondition(target, condition)
doSendMagicEffect(efepos, 913)

addEvent(doSendMagicEffect, 600, efepos, 913) -- Prisao
addEvent(doSendMagicEffect, 900, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 1200, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 1600, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 1900, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 2200, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 2600, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 2900, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 3200, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 3600, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 3900, efepos, 913) -- Prisao Fechada
addEvent(doSendMagicEffect, 4200, efepos, 913) -- Prisao Fechada

--doCreatureSay(cid, "Hijutsu Mushidama", TALKTYPE_MONSTER)
addEvent(No_Move_Target, time*1000)
return TRUE
end