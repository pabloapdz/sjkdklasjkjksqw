
local time = 2 -- tempo paralyzado e mutado



local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, time*1000)
 
function silence(tar, text)
    if(isCreature(tar) == true) then
        doSendAnimatedText(getCreaturePosition(tar), text, 215)
        doAddCondition(tar, condition)
    end
    return true
end

function onCastSpell(cid, var)
    local waittime = 2 -- Tempo de exhaustion
    local storage = 100030

    local target = getCreatureTarget(cid)
    local TargetPos = getCreaturePosition(target)
    local PlayerPos = getCreaturePosition(cid)

    if not isPlayer(target) then
       doPlayerSendCancel(cid, "Este jutsu so pode ser usado em Players.")
       return false
    end

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.")
        return false
    end

    local poz = getCreaturePosition(target)

    addEvent(doSendMagicEffect, 1, poz, 1240) -- macarrao caindo

    addEvent(doSendMagicEffect, 400, poz, 1236) -- efeito macarrao subindo

    addEvent(doSendMagicEffect, 500, poz, 1237) -- efeito macarrao parado

    addEvent(doSendMagicEffect, 700, poz, 1237) -- efeito macarrao parado

    addEvent(doSendMagicEffect, 1000, poz, 1237) -- efeito macarrao parado

    addEvent(doSendMagicEffect, 1500, poz, 1237) -- efeito macarrao parado

    --addEvent(doSendMagicEffect, 800, poz, 1237) -- efeito macarrao parado

    addEvent(doSendMagicEffect, 2210, poz, 1238) -- efeito macarrao desfazendo

    local tar = getCreatureTarget(cid)


    local function No_Move_Target()
        doCreatureSetNoMove(target, false)
    end

    doCreatureSetNoMove(target, true)
    doAddCondition(target, condition)
    addEvent(No_Move_Target, time*1000)
    exhaustion.set(cid, storage, waittime)
    return true
end