local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_GREY)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -5.5, -1350, -5.5, -1400) 

local function onCastSpell1(cid, var)
    local pos = getCreaturePosition(cid)
    if getCreatureTarget(cid) then
        local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
        doSendMagicEffect(position1, 79)
        local positionME = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
        doSendMagicEffect(positionME, 416) 
        return doCombat(cid, combat1, var)
    end
end
 
function onCastSpell(cid, var)
local waittime = 1
local storage = 100039

    if isPlayer(cid) then

        if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
        end
        for k = 1, 4 do
            addEvent(function()
                if isCreature(cid) then
                    addEvent(onCastSpell1, 1, cid, var)
                end
            end, 1 + ((k-1) * 500))
        end
        exhaustion.set(cid, storage, waittime)
        return true
    end
end