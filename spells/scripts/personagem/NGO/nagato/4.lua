local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_ORANGE)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 148)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -47.5, -11400, -47.5, -13300)


local function doPushCreature(target, cid)
    if target > 0 then
   if not isNpc(target) then
   local position = getThingPosition(cid)
   local fromPosition = getThingPosition(target)
   local x = ((fromPosition.x - position.x) < 0 and -1 or ((fromPosition.x - position.x) == 0 and 0 or 1))
   local y = ((fromPosition.y - position.y) < 0 and -1 or ((fromPosition.y - position.y) == 0 and 0 or 1))
   local toPosition = {x = fromPosition.x - x, y = fromPosition.y - y, z = fromPosition.z}
   if doTileQueryAdd(target, toPosition) == 1 and getTileInfo(toPosition).house == false then
   doTeleportThing(target, toPosition, true)
   end
   end
    end
end
local



arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
	local waittime = 3 -- Tempo de exhaustion
	local storage = 100033

	function onTargetCreature(cid, target)
	   doPushCreature(target, cid)
	end
    setCombatCallback(combat1, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")



	local parameters = { cid = cid, var = var}
	local target = getCreatureTarget(cid)  -- efeito no alvo

	local pos = getCreaturePosition(target)
	local poz = getCreaturePosition(cid) -- effeito no caster

	addEvent(doSendMagicEffect, 300, {x = pos.x, y = pos.y, z = pos.z}, 54)

	addEvent(onCastSpell1, 5, parameters)
	--addEvent(doSendMagicEffect, 1, {x = target.x, y = target.y, z = target.z}, 468)
	exhaustion.set(cid, storage, waittime)
	return true
end 