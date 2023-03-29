local lyze = 300 -- SPEED QUE O TARGET VAI FICAR

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_HITCOLOR, COLOR_TEAL)
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 0)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -0.0, -0, -0.0, -0)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2500)
setConditionParam(condition, CONDITION_PARAM_SPEED, -2500)
--setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.2, 0, -0.2, 0)
setCombatCondition(combat1, condition)




arr1 = {
	{3}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)




local function Adicionar_Lyze(cid, targetdoplayer)
	--doCreatureSay(targetdoplayer, "essa eh minha speed atual: ".. tostring(getCreatureSpeed(target)), TALKTYPE_MONSTER)
	local speed_natural_target = getCreatureSpeed(target)
	doChangeSpeed(target, 500)

        local function retirar_lyze_total(targetdoplayer)
        	--doCreatureSay(targetdoplayer, "essa eh minha speed atual: ".. tostring(getCreatureSpeed(target)), TALKTYPE_MONSTER)
			doChangeSpeed(target, speed_natural_target)            
            --doCreatureSay(targetdoplayer, "Foi aumentada para: " ..tostring(getCreatureSpeed(target)), TALKTYPE_MONSTER)
        end

        addEvent(retirar_lyze_total, 3000, targetdoplayer)


end

local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

function onCastSpell(cid, var)
	local canto1 = {x = 488, y = 90, z = 3} -- Canto superior esquerdo do local
	local canto2 = {x = 616, y = 294, z = 10} -- Canto inferior direito do local
	if isInRange(getCreaturePosition(cid), canto1, canto2) then
		return doPlayerSendTextMessage(cid, 27, "Você não pode usar essa spell no castle.")
	end
local waittime = 15 -- Tempo de exhaustion
local storage = 7214

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)  -- efeito no alvo

local speed_natural_target = getCreatureSpeed(target)
--doChangeSpeed(target, 300)

local pos = getCreaturePosition(target)
local poz = getCreaturePosition(cid) -- effeito no caster
doCreatureSetNoMove(target, true)
addEvent(doCreatureSetNoMove, 2 * 1000, target, false)
addEvent(doSendMagicEffect, 100, {x = poz.x, y = poz.y, z = poz.z}, 4)
doTeleportThing(cid,pos)
addEvent(onCastSpell1, 100, parameters)
addEvent(Adicionar_Lyze, 100, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 