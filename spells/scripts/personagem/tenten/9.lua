local combat1 = createCombatObject()

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 4, y=getCreaturePosition(target).y + 3, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 845)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 844)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -30, -16150, -45, -20000)

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 2, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 846)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

function onCastSpell(cid, var)
	local waittime = 5 -- Tempo de exhaustion
	local storage = 8224

	if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

	local target = getCreatureTarget(cid)
	local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
	addEvent(onCastSpell1, 0, parameters, target)
	addEvent(onCastSpell2, 200, parameters, target)
	addEvent(onCastSpell3, 2000, parameters, target)
		-- doCreatureSay(cid, "Sogu Kyokudai Tekkyu", TALKTYPE_MONSTER)
	exhaustion.set(cid, storage, waittime)
	return TRUE
end  