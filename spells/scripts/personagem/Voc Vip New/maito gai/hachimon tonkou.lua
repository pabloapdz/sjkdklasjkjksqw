local tempo = 60 -- tempo em segundos.
local time = 10
local time2 = 13
local time3 = 23
local time4 = 24
local time5 = 25
local time6 = 15
----------SKILLS----------
local skillml = 15 -- Magic Level / Put an amount or leave it at zero.
local skillfist = 15 -- Fist Fighting / Put an amount or leave it at zero.
local skillsword = 0 --  Sword Fighting / Put an amount or leave it at zero.
local skillaxe = 0 -- Skill Axe / Put an amount or leave it at zero.
local skillclub = 15 -- Club Fighting / Put an amount or leave it at zero.
local skilldistance = 0 -- Distance Fighting / Put an amount or leave it at zero.
local skillshield = 15 -- Shield / Put an amount or leave it at zero.
local speed = 100 -- Speed / Put an amount or leave it at zero.
local health = 0 -- Health Amount / Example: If you put (200) on it, it will increase (200) life per second, or if you don't want to leave it at 0.
local mana = 0 -- Mana Amount / Example: If you put (200) on it, it will increase (200) life per second, or if you don't want to leave it at 0.
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

---------------------------
local skillml2 = 15
local skillclub2 = 15
local skillshield2 = 15
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 31)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, time2*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, skillml2)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub2)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield2)
setCombatCondition(combat2, condition)

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end



local skillml3 = 20
local skillclub3 = 20
local skillshield3 = 20
local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 31)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, time3*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, skillml3)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub3)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield3)
setCombatCondition(combat4, condition)

local function onCastSpell4(parameters)
doCombat(parameters.cid, parameters.combat4, parameters.var)
end

local skillml4 = 25
local skillclub4 = 25
local skillshield4 = 25
local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 31)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, time4*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, skillml4)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub4)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield4)
setCombatCondition(combat5, condition)

local function onCastSpell5(parameters)
doCombat(parameters.cid, parameters.combat5, parameters.var)
end


local skillml6 = 30
local skillclub6 = 30
local skillshield6 = 30
local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 31)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, time5*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, skillml6)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub6)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield6)
setCombatCondition(combat6, condition)

local function onCastSpell6(parameters)
doCombat(parameters.cid, parameters.combat6, parameters.var)
end

local skillml7 = 35
local skillclub7 = 35
local skillshield7 = 35
local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 31)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, time6*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, skillml7)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub7)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield7)
setCombatCondition(combat7, condition)

local function onCastSpell7(parameters)
doCombat(parameters.cid, parameters.combat7, parameters.var)
end


local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_HITCOLOR, 180)
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.0, -20, -1.0, -20)

arr1 = {
{1, 1, 1, 1, 1},
{1, 1, 3, 1, 1},
{1, 1, 1, 1, 1},
}


local area1 = createCombatArea(arr1)
setCombatArea(combat3, area1)

local function onCastSpell3(parameters)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end


	
----------STATS----------
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_SUBID, 40)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, time*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, skillml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillfist) ------------Do not touch-----------
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield)
setCombatCondition(combat, condition)
----------SPEED----------
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, speed)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, time*1000) ------------Do not touch-----------
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_TICKS, time*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_TICKS, time*1000)
setConditionParam(condition, CONDITION_PARAM_MANAGAIN, mana)
setConditionParam(condition, CONDITION_PARAM_MANATICKS, 1000)
setCombatCondition(combat, condition)


--------------------------DO NOT TOUCH----------------------------------------

function Hachimon(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai Ichi Kaimon", TALKTYPE_ORANGE_1)
end
function Hachimon2(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Kai!", TALKTYPE_ORANGE_1)
end
function Hachimon3(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai Ni Kyumon", TALKTYPE_ORANGE_1)
end
function Hachimon4(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai San Seimon", TALKTYPE_ORANGE_1)
end
function Hachimon5(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai Yon Shomon", TALKTYPE_ORANGE_1)
end
function Hachimon6(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai Go Tomon", TALKTYPE_ORANGE_1)
end
function Hachimon7(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai Rok Keimon", TALKTYPE_ORANGE_1)
end
function Hachimon8(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Kai!", TALKTYPE_ORANGE_1)
end
function Hachimon9(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai Nana Kyomon", TALKTYPE_ORANGE_1)
end
function Hachimon10(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Kai!", TALKTYPE_ORANGE_1)
end
function Hachimon11(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "Dai Hachi Shimon!", TALKTYPE_ORANGE_1)
end
function Hachimon12(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "KAI!", TALKTYPE_ORANGE_1)
end
function Hachimon13(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "", TALKTYPE_ORANGE_1)
end
function Hachimon14(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "", TALKTYPE_ORANGE_1)
end
function Hachimon15(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "", TALKTYPE_ORANGE_1)
end
function Hachimon16(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "", TALKTYPE_ORANGE_1)
end
function Hachimon17(cid, text)
    if not isPlayer(cid) then
        return
    end
	doCreatureSay(cid, "", TALKTYPE_ORANGE_1)
end

--------------------------------------------------------------------------------          
 
function onCastSpell(cid, var)
local waittime = 120 -- Tempo de exhaustion
local storage = 102053 -- não mecha
if exhaustion.check(cid, storage) then
   doPlayerSendCancel(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar o Hachimon Tonkou novamente.")
doSendMagicEffect(getCreaturePosition(cid), 2)
    return false
end
if getPlayerStorageValue(cid, 102053) ~= 1 or getCreatureCondition(cid, CONDITION_ATTRIBUTES, 1) == false then
doCombat(cid, combat, var)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hachimon Tonkou ativado por "..tempo.." segundos")
	setPlayerStorageValue(cid, 102053,1)
	doCreatureSay(cid, "Hachimon Tonkou!", TALKTYPE_ORANGE_1)
	local parameters = {cid = cid, var = var, combat = combat, combat1 = combat1 , combat2 = combat2, combat3 = combat3, combat4 = combat4, combat5 = combat5, combat6 = combat6, combat7 = combat7}

for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
			 local outfit = {lookType = 2087} -- OUTFIT VERDE
                 doSetCreatureOutfit(cid, outfit, 29999)
				 addEvent(Hachimon, 2000, cid, "Dai Ichi Kaimon")
				 addEvent(Hachimon2, 2025, cid, "Kai!")
				 addEvent(Hachimon3, 6000, cid, "Dai Ni Kyumon")
				 addEvent(Hachimon4, 10000, cid, "Dai San Sheimon")
				 addEvent(Hachimon5, 15000, cid, "Dai Yon Shomon")
				 addEvent(Hachimon6, 20000, cid, "Dai Go Tomon")
				 addEvent(Hachimon7, 25000, cid, "Dai Rok Keimon")
				 addEvent(Hachimon8, 25025, cid, "Kai!")
				 addEvent(Hachimon9, 30000, cid, "Dai Nana Kyomon")
				 addEvent(Hachimon10, 30025, cid, "Kai!")
				 addEvent(Hachimon11, 35000, cid, "Dai Hachi Shimon")
				 addEvent(Hachimon12, 35025, cid, "KAI!")
				 addEvent(Hachimon13, 40000, cid, "")
				 addEvent(Hachimon14, 45000, cid, "")
				 addEvent(Hachimon15, 50000, cid, "")
				 addEvent(Hachimon16, 55000, cid, "")
				 addEvent(Hachimon17, 60000, cid, "")

            end
        end, 1 + ((k-1) * 600))
    end
	
	
	for i = 1, 1 do
	addEvent(function()
		if isCreature(cid) then
		setPlayerStorageValue(cid, 2000, 1) -- SEKIZO VERDE
		addEvent(function() setPlayerStorageValue(cid, 2000, -1) end, 29999) -- 29 sec acabar storage e effect
		end
	end, 100 + ((i-1) * 650))
end
for i = 1, 7 do
	addEvent(function()
		if isCreature(cid) then
		setPlayerStorageValue(cid, 2001, 1) -- SEKIZO BLUE
		addEvent(function() setPlayerStorageValue(cid, 2001, -1) end, 4999) -- 5 sec acabar storage e effect
		end
	end, 29999 + ((i-1) * 650))
end
for i = 1, 9 do
	addEvent(function()
		if isCreature(cid) then
		setPlayerStorageValue(cid, 2002, 1) -- SEKIZO RED
		addEvent(function() setPlayerStorageValue(cid, 2002, -1) end, 25000) -- 25 sec acabar storage e effect
		end
	end, 35000 + ((i-1) * 650))
end
for i = 1, 9 do
	addEvent(function()
		if isCreature(cid) then
		setPlayerStorageValue(cid, 2003, 1) -- Yagai RED
		addEvent(function() setPlayerStorageValue(cid, 2003, -1) end, 25000) -- 25 sec acabar storage e effect
		end
	end, 35000 + ((i-1) * 650))
end
	
	for k = 1, 50 do
        addEvent(function()
            if isCreature(cid) then
			 addEvent(onCastSpell2, 100, parameters)
            end
        end, 1 + ((k-1) * 600))
    end
	for k = 1, 8 do
        addEvent(function()
            if isCreature(cid) then
			 addEvent(onCastSpell4, 100, parameters)
            end
        end, 30000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
			 addEvent(onCastSpell5, 100, parameters)
            end
        end, 35000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
			 addEvent(onCastSpell6, 100, parameters)
            end
        end, 40000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
			 addEvent(onCastSpell7, 100, parameters)
            end
        end, 45000 + ((k-1) * 600))
    end
	

	for k = 1, 50 do
        addEvent(function()
            if isCreature(cid) then
			  local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1114)  
            end
        end, 1 + ((k-1) * 600))
    end
	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
			  local outfit = {lookType = 2088} -- OUTFIT AZUl
                 doSetCreatureOutfit(cid, outfit, 5000)
            end
        end, 30000 + ((k-1) * 600))
    end
	for k = 1, 8 do
        addEvent(function()
            if isCreature(cid) then
			  local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1115)  
			  local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1115)  
            end
        end, 30000 + ((k-1) * 600))
    end
	
	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
            end
        end, 35000 + ((k-1) * 600))
    end
	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local outfit = {lookType = 2090} -- OUTFIT VERMELHA
                 doSetCreatureOutfit(cid, outfit, 25000)
            end
        end, 35000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
            end
        end, 35000 + ((k-1) * 600))
    end
	
	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
            end
        end, 40000 + ((k-1) * 600))
    end
	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local outfit = {lookType = 2090}
                 doSetCreatureOutfit(cid, outfit, 20000)
            end
        end, 40000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
            end
        end, 40000 + ((k-1) * 600))
    end

	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
				
            end
        end, 45000 + ((k-1) * 600))
    end
	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local outfit = {lookType = 2090}
                 doSetCreatureOutfit(cid, outfit, 15000)
            end
        end, 45000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
				
            end
        end, 45000 + ((k-1) * 600))
    end
	
 	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
				
            end
        end, 50000 + ((k-1) * 600))
    end
    for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
			  local outfit = {lookType = 2090}
                 doSetCreatureOutfit(cid, outfit, 10000)	
            end
        end, 50000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
				
            end
        end, 50000 + ((k-1) * 600))
    end

	for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
				
            end
        end, 55000 + ((k-1) * 600))
    end
    for k = 1, 1 do
        addEvent(function()
            if isCreature(cid) then
			  local outfit = {lookType = 2090}
                 doSetCreatureOutfit(cid, outfit, 5000)	
            end
        end, 55000 + ((k-1) * 600))
    end
	for k = 1, 9 do
        addEvent(function()
            if isCreature(cid) then
				local pos = {x = getPlayerPosition(cid).x, y = getPlayerPosition(cid).y, z = getPlayerPosition(cid).z}
                doSendMagicEffect(pos, 1116)  
				
            end
        end, 55000 + ((k-1) * 600))
    end
end

doSendMagicEffect(getCreaturePosition(cid), 0)
    doPlayerSendCancel(cid, "Sorry, you are transformed.")
	exhaustion.set(cid, storage, waittime)
end