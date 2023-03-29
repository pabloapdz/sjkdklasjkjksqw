local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_BROWN)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -13, -3500, -17, -4500)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
    local waittime = 2 -- Tempo de exhaustion
    local storage = 100082

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

	local parameters = { cid = cid, var = var}
	addEvent(onCastSpell1, 100, parameters)
	local positionME = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
	doSendMagicEffect(positionME, 141) 
	local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
	doSendMagicEffect(position1, 49)

	exhaustion.set(cid, storage, waittime)
	return TRUE
end