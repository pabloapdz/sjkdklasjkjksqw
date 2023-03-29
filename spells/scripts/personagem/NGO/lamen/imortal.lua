local config = { 
storage = 3412101,
cooldown = 90,  --- tempo entre um uso e outro
duration = 5, --- duração
} 


local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration * 1000, false)


function onCastSpell(cid, var)
    local waittime = 7 -- Tempo de exhaustion
    local storage = 100069

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end
    local pos = getCreaturePosition(cid)
    doSendMagicEffect({x = pos.x+4, y = pos.y+1, z = pos.z}, 1234)
    setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
    --doCreatureSay(cid,"Tijela de Lamen!", 19)
    addEvent(doSendMagicEffect, 300, {x = pos.x+4, y = pos.y+1, z = pos.z}, 1235) -- Tijela parada
    addEvent(doSendMagicEffect, 1000, {x = pos.x+4, y = pos.y+1, z = pos.z}, 1235) -- Tijela parada
    addEvent(doSendMagicEffect, 1700, {x = pos.x+4, y = pos.y+1, z = pos.z}, 1235) -- Tijela parada
    addEvent(doSendMagicEffect, 2400, {x = pos.x+4, y = pos.y+1, z = pos.z}, 1235) -- Tijela parada
    addEvent(doSendMagicEffect, 3100, {x = pos.x+4, y = pos.y+1, z = pos.z}, 1235) -- Tijela parada
    addEvent(doSendMagicEffect, 3800, {x = pos.x+4, y = pos.y+1, z = pos.z}, 1235) -- Tijela parada
    addEvent(doSendMagicEffect, 4300, {x = pos.x+4, y = pos.y+1, z = pos.z}, 1235) -- Tijela parada

    local function No_Move_Target()
        doCreatureSetNoMove(cid, false)
    end

    doCreatureSetNoMove(cid, true)
    
    addEvent(No_Move_Target, config.duration*1000)

    doPlayerSendTextMessage(cid, 27, "Voce tem ".. config.duration .." segundos de invulnerabilidade.")

    exhaustion.set(cid, storage, waittime)

    return true
end