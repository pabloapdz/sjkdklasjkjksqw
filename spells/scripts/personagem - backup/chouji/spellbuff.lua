--Spell Method by Night Wolf

local config = {
tempo = 20, --- tempo que vai durar a spell (em segundos)
-- Skills --
ml = 15, -- quantos ira aumentar o skill de ML
skillfist = 0, -- quantos ira aumentar o skill de Fist
skillsword = 30, -- quantos ira aumentar o skill de Sword
skillaxe = 30, -- quantos ira aumentar o skill de Axe
skillclub = 30, -- quantos ira aumentar o skill de Club
skilldistance = 30, -- quantos ira aumentar o skill de Distance
skillshield = 0, -- quantos ira aumentar o skill de Shield
-- //Skills --
outfit = 1047, --- outfit que o player ira ter
storage = 15674, -- storage que salva o cooldown
cooldown = 60, -- tempo em segundos de 1 uso e outro
efeito = 5 -- efeito que sai ao castar a spell
}

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, config.efeito)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, config.tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, config.ml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, config.skillfist)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, config.skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, config.skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, config.skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, config.skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, config.skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, config.outfit)
setCombatCondition(combat, condition)


function onCastSpell(cid, var)
	if getPlayerStorageValue(cid, config.storage) - os.time() <= 0 then
	setPlayerStorageValue(cid, config.storage, os.time() + config.cooldown)
		local outfit = getCreatureOutfit(cid)
		outfit.lookType = config.outfit
		doSetCreatureOutfit(cid, outfit, config.tempo * 1000)
		doCombat(cid, combat, var)
	else
		doPlayerSendCancel(cid, "Your spell is in cooldown.")
		return false
	end
return true
end