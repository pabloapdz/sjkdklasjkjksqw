

local distancia_maxima_de_sqm = 30

local tempo = 15 -- tempo em segundos.
local effect = {1241} -- effect no player, caso queira apenas 1, basta remover os outros numeros.
     
local ml = 50 -- quantos ira aumentar o skill de ML
local skillfist = 30 -- quantos ira aumentar o skill de Fist
local skillsword = 30 -- quantos ira aumentar o skill de Sword
local skillaxe = 130 -- quantos ira aumentar o skill de Axe
local skillclub = 130 -- quantos ira aumentar o skill de Club
local skilldistance = 130 -- quantos ira aumentar o skill de Distance
local skillshield = 30 -- quantos ira aumentar o skill de Shield
local health = 1500 -- A cada 1 segundo quantos aumentar de vida
local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
     
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillfist)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)



function onCastSpell(cid, var)
	local waittime = 60
	local storage = 100036
	local storage2 = 100080

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
	end

	local function magicEffectBuffPT(tempo2,tempo3,cid, pid)
		local membersList = getPartyMembers(cid)	
		for _, pid in ipairs(membersList) do
			if getPlayerStorageValue(cid, storage2) > 0 then
				local pos = getCreaturePosition(pid)
				doSendMagicEffect({x = pos.x+1, y = pos.y, z = pos.z}, effect[1])
		    end
		end
	end

	if getPlayerStorageValue(cid, storage2) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    	--doPlayerSendTextMessage(cid,27,'Comam! Saco vazio nao para em pe!')
		local pos, membersList = getCreaturePosition(cid), getPartyMembers(cid)	

		if(membersList == nil or type(membersList) ~= 'table' or table.maxn(membersList) <= 1) then
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
			doSendMagicEffect(pos, CONST_ME_POFF)
			return false
		end	

		local affectedList = {}	

		for _, pid in ipairs(membersList) do
			if(getDistanceBetween(getCreaturePosition(pid), pos) <= distancia_maxima_de_sqm) then
				table.insert(affectedList, pid)
			end	
		end	

		local tmp = table.maxn(affectedList)
		
		if(tmp <= 1) then
			doPlayerSendTextMessage(cid,27,'Necessario ter algum membro na party ao menos ' .. tostring(distancia_maxima_de_sqm) .. ' SQM de distancia de voce.')
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
			doSendMagicEffect(pos, CONST_ME_POFF)
			return false
		end	

		doCreatureSay(cid,"Comam! Saco vazio nao para em pe!", 19)

		exhaustion.set(cid, storage, waittime)
		for _, pid in ipairs(affectedList) do
			doAddCondition(pid, condition)
		end
		tempo2 = 0
	    while (tempo2 ~= (tempo*1000)) do
	        addEvent(magicEffectBuffPT, tempo2, tempo2, tempo*1000, cid)
	        tempo2 = tempo2 + 300
	    end
		return true
	else
	    doPlayerSendCancel(cid, "Sorry, you are transformed.")
	end
end