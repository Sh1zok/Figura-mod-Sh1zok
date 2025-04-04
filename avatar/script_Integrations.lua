--[[
    Функции
]]--
function getVoiceLevel(voiceList) -- Вычисление громкости голоса для FiguraSVC
    averageVL = 0

    for i = 1, #voiceList do
        averageVL = averageVL + math.abs(voiceList[i])
    end

    return math.floor(averageVL / (#voiceList * 100))
end

function pings.changeMouth(texture) -- Смена текстуры рта на заданную
    models.model.root.Body.Head.Face.Mouth:setPrimaryTexture("Custom", textures["assets.mouth." .. texture])
end



--[[
    Интеграции
]]--
-- PlasmoVoice
if client:isModLoaded("figextra") then
    previousMouth = "0"
    currentMouth = "0"
    voiceLevelModifier = 0
    isMouthShouldChange = true

    function events.tick()
        voiceLevel = plasmovoice:getVoiceLevel(player:getUUID()) + voiceLevelModifier

        if voiceLevel < 0.65 then
            currentMouth = "0"
        elseif voiceLevel > 0.65 and voiceLevel < 0.75 then
            currentMouth = "1"
        elseif voiceLevel > 0.75 and voiceLevel < 0.8 then
            currentMouth = "2"
        elseif voiceLevel > 0.8 and voiceLevel < 0.925 then
            currentMouth = "3"
        elseif voiceLevel > 0.925 then
            currentMouth = "4"
        end
    end
end

-- FiguraSVC
if client:isModLoaded("figurasvc") and host:isHost() then
    previousMouth = "0"
    currentMouth = "0"
    voiceLevelModifier = 0
    isMouthShouldChange = true

    events["svc.microphone"] = function(pcm)
        voiceLevel = getVoiceLevel(pcm) + (voiceLevelModifier * 4)
        
        if voiceLevel < 2 then
            currentMouth = "0"
        elseif voiceLevel > 2 and voiceLevel < 4 then
            currentMouth = "1"
        elseif voiceLevel > 4 and voiceLevel < 10 then
            currentMouth = "2"
        elseif voiceLevel > 10 and voiceLevel < 100 then
            currentMouth = "3"
        elseif voiceLevel > 100 then
            currentMouth = "4"
        end
    end
end

-- FigExtra или FiguraSVC
if client:isModLoaded("figextra") or client:isModLoaded("figurasvc") then
    settingVoiceLevelModifier = settingsPage:newAction()
        :title("Прибавка к чувствительности голоса: 0§7\n Колёсико мыши вверх: +0.1\n Колёсико мыши вниз: -0.1\n ЛКМ: Сброс")
        :item("minecraft:silence_armor_trim_smithing_template")
        :color(0, 0.75, 0.75)
        :hoverColor(0, 1, 1)
        :onLeftClick(function()
            voiceLevelModifier = 0
            settingVoiceLevelModifier:title("Прибавка к чувствительности голоса: 0§7\n Колёсико мыши вверх: +0.1\n Колёсико мыши вниз: -0.1\n ЛКМ: Сброс")
            sounds:playSound("block.calcite.place", player:getPos())
        end)
        :onScroll(function(dir)
            if dir > 0 then
                voiceLevelModifier = voiceLevelModifier + 0.1
            else
                voiceLevelModifier = voiceLevelModifier - 0.1
            end
            settingVoiceLevelModifier:title("Прибавка к чувствительности голоса: " .. voiceLevelModifier .. "§7\n Колёсико мыши вверх: +0.1\n Колёсико мыши вниз: -0.1\n ЛКМ: Сброс")
            sounds:playSound("block.calcite.place", player:getPos())
        end)

    function events.tick()
        if (currentMouth ~= previousMouth) and isMouthShouldChange then
            pings.changeMouth(currentMouth)
            previousMouth = currentMouth
        end
    end
end

-- Gliders
if client:isModLoaded("vc_gliders") then
    local isGlidingInPreviousTick = false
    local isGlidintInPrePreviousTick = false
    function events.tick()
        local isGlidingInPresentTick = ((math.round(player:getVelocity().y * 100)) / 100 == -0.05)
        if isGlidingInPresentTick then
            if isGlidingInPresentTick and isGlidingInPreviousTick then
                if isGlidingInPresentTick and isGlidingInPreviousTick and isGlidintInPrePreviousTick then
                    animations.model.glider:setPlaying(true)
                else
                    isGlidintInPrePreviousTick = true
                end
            else
                isGlidingInPreviousTick = true
            end
        else
            isGlidingInPreviousTick = false
            isGlidintInPrePreviousTick = false
            animations.model.glider:setPlaying(false)
        end
    end
end

-- Valhelsia Furniture
if client:isModLoaded("valhelsia_furniture") then
    function events.tick()
        if animations.model.sitting:isPlaying() then
            models.model.root:setPos(0, 4, 0)
        else
            models.model.root:setPos(0, 0, 0)
        end
    end
end