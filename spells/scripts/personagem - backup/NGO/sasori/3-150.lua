local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_LIGHTGREEN)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, CALLBACK_PARAM_LEVELMAGICVALUE, -4.0, -800, -4.0, -1000)


local function onCastSpell1(cid, var)
    local pos = getCreaturePosition(cid)
    local position2 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
    doSendMagicEffect(position2, 262)
    return doCombat(cid, combat1, var)
end

function onCastSpell(cid, var)
    local waittime = 2 -- Tempo de exhaustion
    local storage = 100061

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

    addEvent(onCastSpell1, 1, cid, var)
    exhaustion.set(cid, storage, waittime)
    return true
end
