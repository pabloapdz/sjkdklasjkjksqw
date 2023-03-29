local config = { 
storage = 21580,
cooldown = 8  --- tempo entre um uso e outro
} 

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -3400)
setConditionFormula(condition, -0.2, 0, -0.2, 0)
setCombatCondition(combat1, condition)

local combat1 = createCombatObject()

local function onCastSpell1(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 832)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -19, -6500, -22, -7500)

local function onCastSpell2(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = { x=getCreaturePosition(target).x + 3, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z }
doSendMagicEffect(targetpos, 833)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local combat3 = createCombatObject()

local function onCastSpell3(parameters, target)
if not isPlayer(parameters.cid) then return true end
if not isCreature(target) then return true end
local targetpos = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
doSendMagicEffect(targetpos, 0)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 8 -- Tempo de exhaustion
local storage = 98203
local time = 2 -- tempo paralyzado

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

  if os.time() - getPlayerStorageValue(cid, 21580) >= config.cooldown then
setPlayerStorageValue(cid, 21580, os.time())
else
doPlayerSendCancel(cid, "Bakuhatsuda esta em cooldown, sera possivel usa-lo novamente em "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 21580))).." segundos.")
return false
end

local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
addEvent(doSendMagicEffect, 200, position, 834)
local target = getCreatureTarget(cid)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
addEvent(onCastSpell1, 1, parameters, target)
addEvent(onCastSpell2, 500, parameters, target)
-- addEvent(onCastSpell3, 800, parameters, target)
	-- doCreatureSay(cid, "Bakuhatsuda", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
local function No_Move_Target()
doCreatureSetNoMove(target, false)
end
	doCreatureSetNoMove(target, true)
doAddCondition(target, condition)
addEvent(No_Move_Target, time*1000)
return TRUE
end  