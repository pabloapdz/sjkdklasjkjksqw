local config = { 
storage = 91812,
cooldown = 90 ,  --- tempo entre um uso e outro
duration = 10 --- duração
} 

local function visible(cid)
   if not isPlayer(cid) then return true end
   doCreatureSetHideHealth(cid, false)
end

local outfit = createConditionObject(CONDITION_INVISIBLE, config.duration*1000)

local function effect1(position1)
doSendMagicEffect(position1, 624)
end

local function effect2(position2)
doSendMagicEffect(position2, 625)
end

local function onCastSpell1(cid, target)
doCreatureSetNoMove(cid, true)
end
 
local function onCastSpell2(cid, target)
doCreatureSetNoMove(cid, false)
end

function onCastSpell(cid, var)

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

if isInRange(getCreaturePosition(cid), from1, to1, from2, to2, from3, to3, from4, to4, from5, to5, from6, to6, from7, to7, from8, to8, from9, to9, from10, to10, from11, to11, from12, to12, from13, to13, from14, to14, from15, to15) then
   doPlayerSendTextMessage(cid, 27, "voce nao pode usar Sanzegarasu no Jutsu aqui!")
   return doSendMagicEffect(getCreaturePosition(cid), 2)
end

local position1 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z+0}      


  if os.time() - getPlayerStorageValue(cid, 55695) >= config.cooldown then
setPlayerStorageValue(cid, 55695, os.time())
setPlayerStorageValue(cid, config.storage, os.time() + config.duration)
doAddCondition(cid, outfit)
doPlayerSendTextMessage(cid, 27, "Voce tem agora ".. config.duration .." segundos de invulnerabilidade.")
    
   doCreatureSetHideHealth(cid, true)
    doCreatureSay(cid, "Sanzengarasu no Jutsu", TALKTYPE_MONSTER)
     setPlayerStorageValue(cid, config.storage , os.time() + config.duration)
      addEvent(visible, config.duration*1000, cid)
	  
	   addEvent(effect1, 100, position1) -- Corvos
	  	addEvent(effect2, 10000, position2) -- Corvos Return

addEvent(onCastSpell1, 0, cid, target)
addEvent(onCastSpell2, 10000, cid, target) --- 1 segundo para voltar a andar

	  else
doPlayerSendCancel(cid, "Sanzengarasu no Jutsu esta em cooldown, voce deve esperar "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, 55695))).." segundos.")
return false
end  
    return true
end