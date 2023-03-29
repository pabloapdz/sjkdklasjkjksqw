local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
--setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(cid, level, maglevel)
	local min = ((level*16)+(maglevel*16))
	local max = ((level*17)+(maglevel*17)) --8000 =  Lv 150 + Nin 150 
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(cid, var)
	local waittime = 0.7 -- Tempo de exhaustion
	local storage = 8205

if exhaustion.check(cid, storage) then
	return false
end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end
