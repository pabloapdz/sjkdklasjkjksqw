local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

 

local arr = {

{0, 0, 1, 1, 1, 0, 0},

{0, 1, 1, 1, 1, 1, 0},

{1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 3, 1, 1, 1},

{1, 1, 1, 1, 1, 1, 1},

{0, 1, 1, 1, 1, 1, 0},

{0, 0, 1, 1, 1, 0, 0}

}

 

local area = createCombatArea(arr)

setCombatArea(combat, area)

 

function onTargetCreature(cid, target)

doChallengeCreature(cid, target)

end

 

setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

 

function onCastSpell(cid, var)
	local waittime = 0.7 -- Tempo de exhaustion
	local storage = 9205

	if exhaustion.check(cid, storage) then
		doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
		return false
	end

	return doCombat(cid, combat, var)

end