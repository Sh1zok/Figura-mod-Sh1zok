--[[
    ■■■■
    ■  ■ Sh1zok's Actions System
    ■■■  v1.5
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
selectedAction = 1 -- Выбор действия
activeAction = {"Нет", nil} -- Активное действие

local stopPointUp = true
local stopHighFive = true
local highFiveCheck = false

handParticle = particles["sonic_boom"]
handParticle:setScale(1)

-- Функция для остоновки всех действий
function stopAllActions()
    -- Останавливаем стандартные действия
    for _, value in ipairs(actionsList) do
        if value[2] ~= nil then
            value[2]:stop()
        end
    end

    -- Останавливаем специальные действия
    stopPointUp = true
    stopHighFive = true
    animations.model.actionHighFiveBegin:stop()
    animations.model.actionHighFiveEnd:stop()
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



--[[
    Проверки
]]--
-- Проверяем каждый тик проигрывание несовместимых с действиями анимациями
function events.tick()
    for _, value in ipairs(stopingAnimsList) do
        if value:isPlaying() then
            stopAllActions()
        end
    end
end

-- Выставлет руку в сторону направления взгляда если stopPointUp = false
function events.render()
    if not stopPointUp then
        local headrotation = (vanilla_model.HEAD:getOriginRot() + 180) % 360 - 180
        models.model.root.Body.RightArm:setRot(headrotation)
    else 
        models.model.root.Body.RightArm:setRot(0, 0, 0)
        animations.model.actionPointUp:stop()
        stopPointUp = true
    end
end

-- Действие "Дай пять"
function events.render(delta)
    if not stopHighFive then
        local hand_pos = models.model.root.Body.RightArm.RightABottom.RightItemPivot:partToWorldMatrix():apply()
        handParticle:setPos(hand_pos)
        for _, player in pairs(world:getPlayers()) do
            local pos = player:getPos(delta) + vec(0, player:getEyeHeight(delta), 0)
            local dist = (hand_pos - pos):length()
            pos = pos + player:getLookDir(delta)*dist
            if player:isSwingingArm() and (hand_pos - pos):length() <= 0.3 then
                highFiveCheck = true
            end
        end
        if handParticle:isAlive() == false then
            handParticle = particles["sonic_boom"]
            handParticle:setScale(1)
            handParticle:spawn()
        end
    end
    if highFiveCheck and not stopHighFive then
        animations.model.actionHighFiveBegin:stop()
        animations.model.actionHighFiveEnd:play()

        highFiveCheck = false
        stopHighFive = true

        sounds:playSound("block.froglight.step", player:getPos())
    end
end



--[[
    Пинги
]]--
-- Пинг проигрывающий действие
function pings.playAction(selection)
    stopAllActions() -- Остановка всех действий

    activeAction = actionsList[selection] -- Выбор активного действия

    activeAction[2]:play() -- Проигрывание активного действия
end

-- Пинг останавливающий действие
function pings.stopAction()
    stopAllActions()

    activeAction = {"Нет", nil}
end

-- Пинг для специального действия "Указать на место"
function pings.pointUp()
    stopAllActions() -- Остановка всех действий

    activeAction = actionsList[selection] -- Выбор активного действия

    stopPointUp = false
    animations.model.actionPointUp:play()
end

-- Пинг для специального действия "Дай пять!"
function pings.highFive()
    stopAllActions() -- Остановка всех действий

    activeAction = actionsList[selection] -- Выбор активного действия

    stopHighFive = false
    highFiveCheck = false

    animations.model.actionHighFiveBegin:play()

    handParticle:spawn()
end



--[[
    Функции для кнопки действия
]]--
-- Функция для активации действий
function actionButtonPlay()
    -- Активируем действие
    if actionsList[selectedAction][2] ~= nil then
        pings.playAction(selectedAction) -- В этом случае активируется стандартное действие
    else
        -- В этом случае активируется специальное действие
        if actionsList[selectedAction][1] == "Указать на место" then
            pings.pointUp()
        elseif actionsList[selectedAction][1] == 'Жест "Дай пять"' then
            pings.highFive()
        end
    end
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
