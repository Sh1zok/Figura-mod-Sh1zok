local function processPCM(pcm) -- Вычисление громкости голоса для FiguraSVC(ебал этот мод в рот)
    local averageAmplitude = 0
    for i = 1, #pcm do
        averageAmplitude = averageAmplitude + math.abs(pcm[i])
    end
    averageAmplitude = averageAmplitude / #pcm

    return averageAmplitude
end

if client:isModLoaded("figextra") then -- Если есть прослойка для PlasmoVoice
    voiceLevelModifier = 0

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
    function events.tick()
        if (currentMouth ~= previousMouth) and isMouthShouldChange then
            pings.changeMouth(currentMouth)
            previousMouth = currentMouth
        end
    end
elseif client:isModLoaded("figurasvc") and host:isHost() then -- Если есть прослойка для Simple Voice Chat
    voiceLevelModifier = 0

    events["svc.microphone"] = function(pcm)
        voiceLevel = (math.floor(processPCM(pcm)) / 100) + voiceLevelModifier
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
    function events.tick()
        if (currentMouth ~= previousMouth) and isMouthShouldChange then
            pings.changeMouth(currentMouth)
            previousMouth = currentMouth
        end
    end
end

if client:isModLoaded("figextra") or client:isModLoaded("figurasvc") then -- Если установлен FigExtra или FiguraSVC
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
    settingIsMouthShouldWork = settingsPage:newAction()
        :title("Визуализация голоса")
        :color(0.75, 0, 0)
        :toggleColor(0, 0.75, 0)
        :hoverColor(1, 1, 1)
        :item("minecraft:observer")
        :toggleItem("minecraft:dispenser")
        :toggled(true)
        :onToggle(function()
            isMouthShouldChange = settingIsMouthShouldWork:isToggled()
            sounds:playSound("block.calcite.place", player:getPos())
        end)
end
