local outfit = {lookType = 179} -- outfit
local tempo = 30 -- tempo em segundos.
local effect = {600} -- effect no player, caso queira apenas 1, basta remover os outros numeros.

local config = {
storage = 199316,
storage2 = 100055,
cooldown = 60,  --- tempo entre um uso e outro
}
     
local ml = 75 -- quantos ira aumentar o skill de ML
local skillfist = 0 -- quantos ira aumentar o skill de Fist
local skillsword = 0 -- quantos ira aumentar o skill de Sword
local skillaxe = 0 -- quantos ira aumentar o skill de Axe
local skillclub = 0 -- quantos ira aumentar o skill de Club
local skilldistance = 0 -- quantos ira aumentar o skill de Distance
local skillshield = 20 -- quantos ira aumentar o skill de Shield
local health = 1200 -- A cada 1 segundo quantos aumentar de vida
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
setCombatCondition(combat, condition)
     
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 400)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)
     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)

local sys = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys, outfit)
setCombatCondition(combat, sys)
            
function magicEffect6620(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getPlayerStorageValue(cid, 19733) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
        for i=1, #effect do
        local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect[i])
        end
    end
end
end

local sys = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys, CONDITION_PARAM_TICKS, tempo*1000)
addOutfitCondition(sys, outfit)
setCombatCondition(combat, sys)
                  

function onCastSpell(cid, var)
    local waittime = config.cooldown
    local storage = config.storage
    local storage = config.storage2

    if exhaustion.check(cid, storage) then
        doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
        return false
    end

    if getPlayerStorageValue(cid, 100049) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
        doCombat(cid, combat, var)
        doPlayerSendTextMessage(cid,27,'+UP Buff.') 
        doPlayerSay(cid, 'Im feeling better!', TALKTYPE_ORANGE_1)
        tempo2 = 0
        while (tempo2 ~= (tempo*1000)) do
            addEvent(magicEffect6620, tempo2, tempo2, tempo*1000, cid)
            tempo2 = tempo2 + 300
        end
        setPlayerStorageValue(cid, 100049,1) -- storage verifica transformado, quando = 1 player esta transformado.
        exhaustion.set(cid, storage, waittime)
    else
        doPlayerSendCancel(cid, "Sorry, you are transformed.")
    end
end