local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_YELLOW)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -10.0, -2625, -12.0, -3750)


setCombatArea(combat1, createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 2, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
}))


local function onCastSpell1(parameters)
    doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
    local waittime = 2 -- Tempo de exhaustion
    local storage = 100034
    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end


    local parameters = { cid = cid, var = var}
    local target = getCreatureTarget(cid)  -- efeito no alvo
    local pos = getCreaturePosition(target)
    local poz = getCreaturePosition(cid) -- effeito no caster

    addEvent(doSendMagicEffect, 25, {x = poz.x+2, y = poz.y+2, z = poz.z}, 1242)
    addEvent(onCastSpell1, 100, parameters)
    exhaustion.set(cid, storage, waittime)
    return true
end 