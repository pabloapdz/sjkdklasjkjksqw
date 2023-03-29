local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.3, -30, -0.5, 0)


local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_TICKS, 10000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, -100)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 10000)
setCombatCondition(combat, condition)

function getNextCreature(cid, target)
    local pos = getCreaturePosition(target)
    local creatures = getSpectators(pos, 6, 6, false)
    local next_creature = nil

    for i, creature in pairs(creatures) do
        if(isCreature(creature) and creature ~= target and creature ~= cid) then
            next_creature = creature
            break
        end
    end

    return next_creature
end

local function onCastSpell1(cid, var, target)
    if getCreatureTarget(cid) ~= true then
        local position1 = {x=getThingPosition(target).x+1, y=getThingPosition(target).y, z=getThingPosition(target).z}
        doSendMagicEffect(position1, 79)
        local positionME = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
        doSendMagicEffect(positionME, 416) 
        setCreatureMaxHealth(target, -1000)
        return true
        --return doCombat(cid, combat, var)
    end
end



local function doDamage(cid, targets)

    if isCreature(targets) then
        local position1 = {x=getThingPosition(targets).x+1, y=getThingPosition(targets).y, z=getThingPosition(targets).z}
        doSendMagicEffect(position1, 79)
        local positionME = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
        doSendMagicEffect(positionME, 416) 


        min = -(getPlayerLevel(cid) + getPlayerMagLevel(cid) * -0.3 + 30)
        max = -(getPlayerLevel(cid) + getPlayerMagLevel(cid) * -0.5 + 0)

        local dano = math.random(min, max)
        doCreatureAddHealth(targets, dano)

        


        --if(getCreatureHealth(targets) <= 0) then
            --local next_target = getNextCreature(cid, targets)
            --if(next_target ~= nil) then
              --  doDamage(cid, next_target)
            --end
        --end
    end
end


function onCastSpell(cid, var)
    local target = getCreatureTarget(cid)
    if(not target) then
        return doPlayerSendCancel(cid, "Voce precisa escolher um alvo valido.")
    end

    if(not isPlayer(target) and not isMonster(target)) then
        return doPlayerSendCancel(cid, "Voce precisa escolher um alvo valido.")
    end


        if (target ~= 0) then
            
            for i = 1, 10 do
                local function damageRepeat(cid, target)
                    print(" Este é o i = " .. i .. '        target>' .. target)
                    --print("123 <- entrou com o target -> " .. tostring(target))
                    if(not isCreature(target)) then
                        return true
                    end

                    if(isCreature(target) and not isCreature(cid)) then
                        return true
                    end

                    --if(not doCombat(cid, combat, var)) then
                        --return true
                    --end

                    min = -(getPlayerLevel(cid) + getPlayerMagLevel(cid) * -0.3 + 30)
                    max = -(getPlayerLevel(cid) + getPlayerMagLevel(cid) * -0.5 + 0)

                    --print("min-> " .. min .. " max ->" .. max)
                    for j=1, 4 do
                        addEvent(doDamage, j, cid, target)
                    end


                    local next_target = nil
                    if(getCreatureHealth(target) + max <= 0) then
                        --print('target atual -> ' .. tostring(target))
                        next_target = getNextCreature(cid, target)
                        --print('proximo target -> ' .. tostring(next_target))
                    end
                    if(next_target ~= nil) then
                        --print("entrou aqui com o target -> " .. tostring(target))
                        target = next_target
                        addEvent(damageRepeat, 1000, cid, target)
                        --print(' saiu com o target -> ' .. tostring(target))
                    end


                    --if getcreatureahealth(targets) <= min then
                    --if(not next_target) then
                        --return true
                    --end

                    --if(not isCreature(next_target)) then
                     --   return true
                    --end

                    --addEvent(onCastSpell1, 1, cid, var, next_target)


                    
                end

                damageRepeat(cid, target)
            end

        end



    return true
end