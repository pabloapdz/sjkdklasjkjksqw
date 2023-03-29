local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -5000)

function onCastSpell(cid, var)

local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local efepos = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
local efepos2 = {x=targetpos.x+1, y=targetpos.y+1, z=targetpos.z}
local time = 5 -- tempo paralyzado

local target = getCreatureTarget(cid)
local TargetPos = getCreaturePosition(target)
local PlayerPos = getCreaturePosition(cid)

if not isPlayer(target) then
doPlayerSendCancel(cid, "Kurohigi Sandai Higeki no Jutsu so pode ser usado em Players.")
return FALSE
end

if exhaustion.check(cid, 12000) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 12000) .. " segundos para usar novamente.")
return FALSE
end

local function No_Move_Target()
doCreatureSetNoMove(target, 0)
end

exhaustion.set(cid, 12000, 40)
doCreatureSetNoMove(target, 1)
--doCreatureSay(cid,"Kurohigi Sandai Higeki", 19)
doAddCondition(target, condition)
addEvent(doSendMagicEffect, 600, efepos, 915) -- Prisao
addEvent(doSendMagicEffect, 900, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 1200, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 1600, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 1900, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 2200, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 2600, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 2900, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 3200, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 3600, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 3900, efepos2, 915) -- Prisao Fechada
addEvent(doSendMagicEffect, 4200, efepos2, 915) -- Prisao Fechada
addEvent(No_Move_Target, time*1000)
return TRUE
end