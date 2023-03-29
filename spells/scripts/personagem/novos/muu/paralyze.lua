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
local efepos = {x=targetpos.x+1, y=targetpos.y, z=targetpos.z}
local time = 5 -- tempo paralyzado

local target = getCreatureTarget(cid)
local TargetPos = getCreaturePosition(target)
local PlayerPos = getCreaturePosition(cid)

if not isPlayer(target) then
doPlayerSendCancel(cid, "Doton Takai Prision no Jutsu so pode ser usado em Players.")
return FALSE
end

  if os.time() - getPlayerStorageValue(cid, 21580) >= config.cooldown then
setPlayerStorageValue(cid, 21580, os.time())

		--doCreatureSay(cid, "Doton Takai Prision no Jutsu", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Doton Takai Prision esta em cooldown, sera possivel usa-lo novamente em "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 21580))).." segundos.")
return false
end

local function No_Move_Target()
doCreatureSetNoMove(target, 0)
end

local parameters = { cid = cid, var = var}
exhaustion.set(cid, 21580, 40)
doCreatureSetNoMove(target, 1)
doAddCondition(target, condition)

addEvent(doSendMagicEffect, 1, efepos, 1058) -- Prisao
addEvent(No_Move_Target, time*1000)
return TRUE
end