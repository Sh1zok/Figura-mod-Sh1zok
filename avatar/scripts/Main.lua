-- Убираем ванильную модель
vanilla_model.PLAYER:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)

-- Устанавливаем высоту камеры
renderer:offsetCameraPivot(0, 0.25, 0) -- От третькго лица
renderer:setEyeOffset(0, 0.25, 0) -- От первого лица

nameplate.Entity:setPos(0, 0.2, 0) -- Высота панели никнейма
nameplate.Entity:setOutline(true) -- Обводка никнейма
nameplate.Entity:setOutlineColor(0, 0.75, 0.75) -- Цвет обводки
nameplate.Entity:setBackgroundColor(0, 0, 0, 0) -- Фон никнейма

-- Скорости анимаций
function events.render()
    local speedXZ = math.sqrt(player:getVelocity().x ^ 2 + player:getVelocity().z ^ 2) -- Скорость игрока в координатах X и Z
    local speedY = math.abs(player:getVelocity().y) -- Скорость игрока по координате Y

    local walkingSpeed = speedXZ * 4.540071 * 4.25 -- Скорость анимации хотьбы
    local sprintingSpeed = speedXZ * 3.5637 * 3.75 -- Скорость анимации бега
    local crouchingSpeed = speedXZ * 15.442 * 1.35 -- Скорость анимации хотьбы в приседе
    local crawlingSpeed = speedXZ * 15.4465 * 2.85 / 2 -- Скорость анимации ползания

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

-- Руки от первого лица
if host:isHost() then
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
end

function pings.setArmorVisibility(value) -- Устанавливает видимость брони
    vanilla_model.ARMOR:setVisible(value)
end

function pings.setNameplateVisibility(value) -- Устанавливает видимость никнейма
    nameplate.Entity:setVisible(value)
end

-- Видимость брони и неймплейта
if host:isHost() then
    local ticks = 0
    function events.tick()
        ticks = ticks + 1
        
        if ticks >= 200 then
            ticks = 0
            pings.setArmorVisibility(config:load("armorVisibility"))
            pings.setNameplateVisibility(config:load("nameplateVisibility"))
        end
    end
end