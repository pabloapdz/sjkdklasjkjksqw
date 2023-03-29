local combat1 = createCombatObject()

local function onCastSpell1(parameters, cid)
if not isPlayer(parameters.cid) then return true end
if not isCreature(cid) then return true end
local targetpos = { x=getCreaturePosition(cid).x + 1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z }
doSendMagicEffect(targetpos, 640)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -19.0, -6500, -22.0, -7500)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 0)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

function onCastSpell(cid, var)
	local waittime = 2.5 -- Tempo de exhaustion
	local storage = 8521

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
	end

	local position = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}

	local target = getCreatureTarget(cid)
	local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2}
	addEvent(onCastSpell1, 0, parameters, cid)
	addEvent(onCastSpell2, 700, parameters, target)
	--doCreatureSay(cid, "Rasenkyugan", TALKTYPE_MONSTER)

	addEvent(doSendDistanceShoot, 600, position, getCreaturePosition(getCreatureTarget(cid)), 163)
	exhaustion.set(cid, storage, waittime)
end