--[[
    ■■■■■
    ■   ■ Sh1zok's Emotions System
    ■■■■  v2.0
]]--



--[[
    Инициализация
]]--
emotionsList = {} -- Список эмоций
emotionButtonCommonColor = ""
emotionButtonAccentColor = ""
emotionButtonTitle = ""
emotionButtonDescription = ""
local selectedEmotion = 1 -- Выбор эмоции
activeEmotion = {"Нет", nil} -- Активная эмоция

-- Функция для остоновки всех эмоций
function stopAllEmotions()
    for _, value in ipairs(emotionsList) do
        if value[2] ~= nil then
            value[2]:stop()
        end
    end

    activeEmotion = {"Нет", nil}
end

-- Функция для задания интерполяции анимаций эмоций если среди библиотек есть GSAnimBlend
function blendEmotionAnimations(blendValue)
    -- Находим GSAnimBlend
    local GSAnimBlendIsHere = false
    for _, key in ipairs(listFiles(nil,true)) do
        if key:find("GSAnimBlend$") then
            GSAnimBlendIsHere = true
            break
        end
    end

    -- Если GSAnimBlend найден, то устанавливаем анимациям эмоций интерполяцию
    if GSAnimBlendIsHere then
        for _, emotion in ipairs(emotionsList) do
            if emotion[2] ~= nil then
                emotion[2]:setBlendTime(blendValue)
            end
        end
    end
end

-- Функция формирующая титул кнопки
function updateEmotionButtonTitle()
    -- Название кнопки и её описание
    local title = emotionButtonTitle .. ": " .. emotionsList[selectedEmotion][1] .. "\n §7" .. emotionButtonDescription

    -- Список эмоций
    for index, value in ipairs(emotionsList) do
        if index == selectedEmotion then -- Выделение выбираемой эмоции акцентным цветом
            title = title .. "\n " .. emotionButtonAccentColor .. value[1]
        else -- Остальные более тусклым
            title = title .. "\n " .. emotionButtonCommonColor .. value[1]
        end
    end

    return(title)
end



--[[
    Пинги
]]--
-- Пинг проигрывающий эмоцию
function pings.playEmotion(selection)
    stopAllEmotions() -- Остановка всех эмоций

    activeEmotion = emotionsList[selection] -- Выбор активной эмоции

    if activeEmotion[2] ~= nil then
        activeEmotion[2]:play() -- Проигрывание активной эмоции
    end
end

-- Пинг останавливающий эмоцию
function pings.stopEmotion()
    stopAllEmotions()
end



--[[
    Функции для кнопки эмоций
]]--
-- Функция для активации эмоций
function emotionButtonPlay()
    pings.playEmotion(selectedEmotion)
end

-- Функция для остановки эмоций
function emotionButtonStop()
    pings.stopEmotion()
end

-- Функция для выбора эмоции
function emotionButtonSelect(dir)
    if dir < 0 then -- При прокручивании вверх
        if selectedEmotion ~= #emotionsList then
            selectedEmotion = selectedEmotion + 1
        else -- Переход в конец списка если выбор в начале списка
            selectedEmotion = 1
        end
    else -- При прокручивании вниз
        if selectedEmotion ~= 1 then
            selectedEmotion = selectedEmotion - 1
        else -- Переход в начало списка если выбор в конце списка
            selectedEmotion = #emotionsList
        end
    end
end
