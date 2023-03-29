local condition = createConditionObject(CONDITION_MUTED)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)

local chance = 100
 
function silence(tar, text)
    if(isCreature(tar) == true) then
        doSendAnimatedText(getCreaturePosition(tar), text, 215)
        doAddCondition(tar, condition)
    end
    return true
end

function onCastSpell(cid, var)
local time = 2 -- tempo paralyzado
local from1 = {x=1964, y=731, z=7}
local to1 = {x=1976, y=742, z=7}
local from2 = {x=979, y=911, z=7}
local to2 = {x=994, y=918, z=7}
local from3 = {x=1964, y=731, z=7}
local to3 = {x=1976, y=742, z=7}
local from4 = {x=1019, y=921, z=5}
local to4 = {x=1033, y=924, z=5}
local from5 = {x=663, y=1098, z=7}
local to5 = {x=685, y=1104, z=7}
local from6 = {x=965, y=1483, z=7}
local to6 = {x=979, y=1494, z=7}
local from7 = {x=1161, y=1177, z=7}
local to7 = {x=1167, y=1188, z=7}
local from8 = {x=984, y=578, z=7} -- shinobi war
local to8 = {x=1044, y=652, z=7} -- shinobi war
local from9 = {x=1243, y=725, z=6} -- Kamui no Jutsu
local to9 = {x=1255, y=738, z=6} -- Kamui no Jutsu
local from10 = {x=1902, y=733, z=7} -- Kokuangyou no Jutsu
local to10 = {x=1906, y=737, z=7} -- Kokuangyou no Jutsu
local from11 = {x=1963, y=729, z=7} -- Tsukuyomi World
local to11 = {x=1977, y=743, z=7} -- Tsukuyomi World
local from12 =  {x=1684, y=735, z=7} -- Dai Kamui
local to12 = {x=1686, y=737, z=7} -- Dai Kamui
local from13 =  {x=1732, y=737, z=7} -- Mangekyo Kamui Me
local to13 = {x=1734, y=739, z=7} -- Mangekyo Kamui Me
local from14 =  {x=1841, y=737, z=7} -- Dai Kamui In
local to14 = {x=1843, y=739, z=7} -- Dai Kamui In
local from15 =  {x=2038, y=736, z=6} -- Kotoamatsukami
local to15 = {x=2042, y=740, z=6} -- Kotoamatsukami

if isInRange(getCreaturePosition(cid), from1, to1, from2, to2, from3, to3, from4, to4, from5, to5, from6, to6, from7, to7, from8, to8, from9, to9, from10, to10, from11, to11, from12, to12, from13, to13, from14, to14, from15, to15) then   doPlayerSendTextMessage(cid, 27, "voce não pode usar Dai Shiki Fuujin aqui!")
   return doSendMagicEffect(getCreaturePosition(cid), 2)
end

local target = getCreatureTarget(cid)
local TargetPos = getCreaturePosition(target)
local PlayerPos = getCreaturePosition(cid)

if not isPlayer(target) then
doPlayerSendCancel(cid, "Magen Jubaku Satsu so pode ser usado em Players.")
return FALSE
end

local time = 2 -- tempo paralyzado

if exhaustion.check(cid, 13000) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 13000) .. " segundos para usar novamente.")
return FALSE
end

    local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+2, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
    doSendMagicEffect(position1, 952)

    local tar = getCreatureTarget(cid)
    if hasCondition(tar, CONDITION_MUTED) == true then	
	return false
	else
	
        if isCreature(tar) == true then
if math.random(1,100) <= chance then
local text = "SILENCE"
                    silence(tar, text)     
else
local text = "MISS"
doSendAnimatedText(getCreaturePosition(tar), text, 215)
end

		exhaustion.set(cid, 13000, 45)
--doCreatureSay(cid, "Magen Jubaku Satsu", TALKTYPE_MONSTER)
        else
            if isPlayer(cid) == true then
                doPlayerSendCancel(cid, "Magen Jubaku Satsu so pode ser usado em Players.")
            end
            return false
        end
    end
local function No_Move_Target()
doCreatureSetNoMove(target, false)
end

doCreatureSetNoMove(target, true)
doAddCondition(target, condition)
addEvent(No_Move_Target, time*1000)
    return true
end