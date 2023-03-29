local tempo = 15 -- tempo em segundos.
local effect = {151} -- effect no player, caso queira apenas 1, basta remover os outros numeros.
     
local ml = 55 -- quantos ira aumentar o skill de ML
local skillfist = 100 -- quantos ira aumentar o skill de Fist
local skillsword = 75 -- quantos ira aumentar o skill de Sword
local skillaxe = 0 -- quantos ira aumentar o skill de Axe
local skillclub = 0 -- quantos ira aumentar o skill de Club
local skilldistance = 0 -- quantos ira aumentar o skill de Distance
local skillshield = 0 -- quantos ira aumentar o skill de Shield
local health = 1700 -- A cada 1 segundo quantos aumentar de vida
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
     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)
            
function magicEffect6716(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getPlayerStorageValue(cid, 112776) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
        for i=1, #effect do
        local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect[i])  
        end
    end
end
end
                  
function onCastSpell(cid, var)
local waittime = 60
local storage = 5323

if exhaustion.check(cid, storage) then
doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
return false
end

if getPlayerStorageValue(cid, 112776) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    doCombat(cid, combat, var)
	doPlayerSendTextMessage(cid,27,'+UP Buff.') 
    doPlayerSay(cid, 'Im feeling better!', TALKTYPE_ORANGE_1)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(magicEffect6716, tempo2, tempo2, tempo*1000, cid)
        tempo2 = tempo2 + 300
    end
    setPlayerStorageValue(cid, 112776,1) -- storage verifica transformado, quando = 1 player esta transformado.
	exhaustion.set(cid, storage, waittime)
else
    doPlayerSendCancel(cid, "Sorry, you are transformed.")
end
end