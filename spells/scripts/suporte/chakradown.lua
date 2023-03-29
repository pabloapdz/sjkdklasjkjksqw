function onCastSpell(cid, var)
  local mana = getCreatureMana(cid)/3
  local waittime = 4 -- Tempo de exhaustion
  local storage = 824257

  if exhaustion.check(cid, storage) then
    doPlayerSendChannelMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde ".. exhaustion.get(cid, storage) .. " segundos para usar o jutsu novamente.", TALKTYPE_CHANNEL_O, CHANNEL_SPELL)
    return false
  end

  if doCreatureAddMana(cid, -mana) then
    if doPlayerAddSpentMana(cid, mana) then
      doSendMagicEffect(getCreaturePosition(cid), 1)
      exhaustion.set(cid, storage, waittime)
      return false
    else
     doCreatureAddMana(cid, mana)
    end
  end
  
  exhaustion.set(cid, storage, waittime)
  doSendMagicEffect(getCreaturePosition(cid), 1)
  return false
end