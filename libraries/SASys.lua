--[[
    ■■■■
    ■  ■ Sh1zok's Actions System
    ■■■  v2.0
]]--



--[[
    Инициализация
]]--
stopingAnimsList = {} -- Список анимаций несовместимых с действиями
actionsList = {} -- Список действий
actionButtonCommonColor = ""
actionButtonAccentColor = ""
actionButtonTitle = ""
actionButtonDescription = ""
local selectedAction = 1 -- Выбор действия
activeAction = {"Нет", nil} -- Активное действие

-- Функция для остоновки всех действий
function stopAllActions()
    for _, action in ipairs(actionsList) do
        if action[2] ~= nil then
            action[2]:stop()
        end
    end

    activeAction = {"Нет", nil}
end

-- Функция для задания приоритетов анимациям действий
function prioritizeActionAnimations(priorityValue)
    for _, action in ipairs(actionsList) do
        if action[2] ~= nil then
            action[2]:setPriority(priorityValue)
        end
    end
end

-- Функция для задания интерполяции анимаций дейсвий если среди библиотек есть GSAnimBlend
function blendActionAnimations(blendValue)
    -- Находим GSAnimBlend
    local GSAnimBlendIsHere = false
    for _, key in ipairs(listFiles(nil,true)) do
        if key:find("GSAnimBlend$") then
            GSAnimBlendIsHere = true
            break
        end
    end

    -- Если GSAnimBlend найден, то устанавливаем анимациям действий интерполяцию
    if GSAnimBlendIsHere then
        for _, action in ipairs(actionsList) do
            if action[2] ~= nil then
                action[2]:setBlendTime(blendValue)
            end
        end
    end
end

-- Функция формирующая титул кнопки
function updateActionButtonTitle()
    -- Название кнопки и её описание
    local title = actionButtonTitle .. ": " .. actionsList[selectedAction][1] .. "\n §7" .. actionButtonDescription

    -- Список действий
    for index, value in ipairs(actionsList) do
        if index == selectedAction then -- Выделение выбираемого действия акцентным цветом
            title = title .. "\n " .. actionButtonAccentColor .. value[1]
        else -- Остальные более тусклым
            title = title .. "\n " .. actionButtonCommonColor .. value[1]
        end
    end

    return(title)
end

-- Проверяем каждый тик проигрывание несовместимых с действиями анимациями
function events.tick()
    for _, value in ipairs(stopingAnimsList) do
        if value:isPlaying() then
            stopAllActions()
        end
    end
end



--[[
    Пинги
]]--
-- Пинг проигрывающий действие
function pings.playAction(selection)
    stopAllActions() -- Остановка всех действий

    activeAction = actionsList[selection] -- Выбор активного действия

    if activeAction[2] ~= nil then
        activeAction[2]:play() -- Проигрывание активного действия
    end
end

-- Пинг останавливающий действие
function pings.stopAction()
    stopAllActions()
end



--[[
    Функции для кнопки действия
]]--
-- Функция для активации действий
function actionButtonPlay()
    pings.playAction(selectedAction) -- Активируем действие
end

-- Функция для остановки действий
function actionButtonStop()
    pings.stopAction()
end

-- Функция для выбора действия
function actionButtonSelect(dir)
    if dir < 0 then -- При прокручивании вверх
        if selectedAction ~= #actionsList then
            selectedAction = selectedAction + 1
        else -- Переход в конец списка если выбор в начале списка
            selectedAction = 1
        end
    else -- При прокручивании вниз
        if selectedAction ~= 1 then
            selectedAction = selectedAction - 1
        else -- Переход в начало списка если выбор в конце списка
            selectedAction = #actionsList
        end
    end
end
