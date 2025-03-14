--[[
    Переменные
]]--
local previousSkin = "assets.clear_skin"
local currentSkin = "assets.clear_skin"



--[[
    Инициализация
]]--
-- Убираем ванильную модель
vanilla_model.PLAYER:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)

-- Устанавливаем высоту камеры
renderer:offsetCameraPivot(0, 0.2, 0) -- От третькго лица
renderer:setEyeOffset(0, 0.2, 0) -- От первого лица

models.model.root.Body.Head.Face.Mouth:setPrimaryTexture("Custom", textures["assets.mouth.0"]) -- Устанавливаем текстуру рта

-- Создание страниц колеса действий
mainPage = action_wheel:newPage()
settingsPage = action_wheel:newPage()
action_wheel:setPage(mainPage) -- Задание активной страницы

nameplate.Entity:setPos(0, 0.1, 0) -- Высота панели никнейма



--[[
    Анимации
]]--
-- SquAPI
local squapi = require("libraries.SquAPI") -- Подключение SquAPI
squapi.smoothHead:new({models.model.root.Body.Head, models.model.root.Body}, {0.5, 0.3}, nil, 1, false) -- Гладкий поворот головы
squapi.eye:new(models.model.root.Body.Head.Face.Pupils.LeftPupil, 0.125, 0.375, 0.5, 0.5) -- Настройка левого глаза
squapi.eye:new(models.model.root.Body.Head.Face.Pupils.RightPupil, 0.375, 0.125, 0.5, 0.5) -- -- Настройка правого глаза
squapi.randimation:new(animations.model.blink, 60, true) -- Настройка анимации моргания

-- Настройка анимаций
animations.model.spearR:setPriority(2)
animations.model.spearL:setPriority(2)
animations.model.bowR:setPriority(2)
animations.model.bowL:setPriority(2)
animations.model.crossR:setPriority(2)
animations.model.crossL:setPriority(2)
animations.model.mineR:setPriority(2)
animations.model.mineL:setPriority(2)
animations.model.blink:setPriority(3)
animations.model.actionWave:setPriority(3)
animations.model.actionInspectItem:setPriority(3)
animations.model.actionCrossArms:setPriority(3)
animations.model.actionThinking:setPriority(3)
animations.model.actionPointUp:setPriority(3)
animations.model.actionBeltHands:setPriority(3)
animations.model.spyglassR:setPriority(4)
animations.model.spyglassL:setPriority(4)
animations.model.glider:setPriority(5)

-- Скорости
function events.render()
    local speedXZ = math.sqrt(player:getVelocity().x ^ 2 + player:getVelocity().z ^ 2) -- Скорость игрока в координатах X и Z
    local speedY = math.abs(player:getVelocity().y) -- Скорость игрока по координате Y

    local walkingSpeed = speedXZ * 4.540071 * 4.25 -- Скорость анимации хотьбы
    local sprintingSpeed = speedXZ * 3.5637 * 3.75 -- Скорость анимации бега
    local crouchingSpeed = speedXZ * 15.442 * 1.35 -- Скорость анимации хотьбы в приседе
    local crawlingSpeed = speedXZ * 15.4465 * 2.85 -- Скорость анимации ползания

    -- Поправка скорости для бега в припрыжку
    if (host:isHost() == true) and (speedY > 0) then -- Скорсть бега у игрока установившего аватар
        sprintingSpeed = sprintingSpeed * speedY * 1.56
    elseif (host:isHost() == false) and (speedY > 0.01) then -- Скорость бега у наблюдающих игроков
        sprintingSpeed = sprintingSpeed * speedY * 3.1
    end

    -- Выставление скорстей анимаций
    animations.model.walking:setSpeed(walkingSpeed)
    animations.model.walkingback:setSpeed(walkingSpeed)
    animations.model.sprinting:setSpeed(sprintingSpeed)
    animations.model.crouchwalk:setSpeed(crouchingSpeed)
    animations.model.crouchwalkback:setSpeed(crouchingSpeed)
    animations.model.crawling:setSpeed(crawlingSpeed)
    animations.model.falling:setSpeed(player:getVelocity().y / -3.92)
end



--[[
    Остальное
]]--
function events.render() -- Определение момента показа рук
    if player:getHeldItem(false).id == "minecraft:air" then -- Основная рука должна быть показана
        if player:isLeftHanded() then -- Основная рука - левая
            renderer:setRenderLeftArm(true)
        else -- Основная рука - правая
            renderer:setRenderRightArm(true)
        end
    else -- Основная рука должна быть спрятана
        if player:isLeftHanded() then -- Основная рука - левая
            renderer:setRenderLeftArm(false)
        else -- Основная рука правая
            renderer:setRenderRightArm(false)
        end
    end
    if player:getHeldItem(true).id == "minecraft:air" then -- Дополнительная рука должна быть показана
        if player:isLeftHanded() then -- Основная рука - левая
            renderer:setRenderRightArm(true)
        else -- Основная рука - правая
            renderer:setRenderLeftArm(true)
        end
    else -- Дополнительная рука должна быть спрятана
        if player:isLeftHanded() then -- Основная рука - левая
            renderer:setRenderRightArm(false)
        else -- Основная рука - правая
            renderer:setRenderLeftArm(false)
        end
    end
end

function events.tick() -- Постановка камеры на плечо
    if settingCameraShouldBeOnShoulder:getTitle() == "Снять камеру с плеча" and not renderer:isFirstPerson() then
        if renderer:isCameraBackwards() then
            renderer:setCameraPos(-1, 0, 0)
        else
            renderer:setCameraPos(-1, 0, -2.5)
        end
    else
        renderer:setCameraPos(0, 0, 0)
    end
end

function events.tick() -- Смена текстуры кожи в соответствии с здоровьем игрока
    if player:getHealth() > 15 then
        currentSkin = "assets.clear_skin"
    elseif player:getHealth() <= 15 and player:getHealth() > 10 then
        currentSkin = "assets.a_little_damaged"
    elseif player:getHealth() <= 10 and player:getHealth() > 5 then
        currentSkin = "assets.damaged"
    elseif player:getHealth() <= 5 then
        currentSkin = "assets.badly_damaged"
    end
    if previousSkin ~= currentSkin then
        pings.changeSkin(currentSkin)
        previousSkin = currentSkin
    end
end
