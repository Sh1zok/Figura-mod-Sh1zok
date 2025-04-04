--[[
    ■■■■
    ■  ■ Sh1zok's Outfits System
    ■■■  v1.6
]]--



--[[
    Инициализация
]]--
outfitModelParts = {} -- Список частей модели что являются частью наряда
hatModelParts = {} -- Список частей модели что являются частью шляпы
headSecondLayerModelPart = nil -- Часть модели что является вторым слоем головы(волосами)
outfitsList = {} -- Список нарядов
outfitButtonCommonColor = ""
outfitButtonAccentColor = ""
outfitButtonTitle = ""
outfitButtonDescription = ""
currentOutfit = 1

-- Функция формирующая титул кнопки
function updateOutfitButtonTitle()
    -- Название кнопки и её описание
    local title = outfitButtonTitle .. ": " .. outfitsList[currentOutfit][1] .. "\n §7" .. outfitButtonDescription

    -- Список нарядов
    for index, value in ipairs(outfitsList) do
        if index == currentOutfit then -- Выделение выбранного наряда акцентным цветом
            title = title .. "\n " .. outfitButtonAccentColor .. value[1]
        else -- Остальные более тусклым
            title = title .. "\n " .. outfitButtonCommonColor .. value[1]
        end
    end

    return(title)
end

-- Функция возвращающая текстуру кнопки
function updateOutfitButtonTexture()
    return(textures[outfitsList[currentOutfit][3]])
end

-- Функция синхронизирующая наряды с конфигом
function getOutfitFromConfig()
    currentOutfit = config:load("SOSys_outfit")

    if currentOutfit == nil then
        currentOutfit = 1
    end

    pings.setOutfit(outfitsList[currentOutfit][2], outfitsList[currentOutfit][4], outfitsList[currentOutfit][5])
end



--[[
    Пинги
]]--
-- Смена текстур наряда на заданную, регулировка высоты шляпы, переключение видимости второя слоя головы
function pings.setOutfit(texturePath, hatHeightOffset, isHairsVisible)
    -- Задаём текстуру наряда
    for _, value in ipairs(outfitModelParts) do
        value:setPrimaryTexture("Custom", textures[texturePath])
    end

    -- Задаём высоту шляпы
    for _, value in ipairs(hatModelParts) do
        value:setPos(0, hatHeightOffset, 0)
    end

    -- Задаём видимость второго слоя головы
    headSecondLayerModelPart:setVisible(isHairsVisible)
end



--[[
    Функции для кнопки наряда
]]--
-- Функция для выбора наряда
function outfitButtonSelect(dir)
    if dir < 0 then -- При прокручивании вверх
        if currentOutfit ~= #outfitsList then
            currentOutfit = currentOutfit + 1
        else -- Переход в конец списка если выбор в начале списка
            currentOutfit = 1
        end
    else -- При прокручивании вниз
        if currentOutfit ~= 1 then
            currentOutfit = currentOutfit - 1
        else -- Переход в начало списка если выбор в конце списка
            currentOutfit = #outfitsList
        end
    end

    config:save("SOSys_outfit", currentOutfit)
    
    pings.setOutfit(outfitsList[currentOutfit][2], outfitsList[currentOutfit][4], outfitsList[currentOutfit][5])
end
