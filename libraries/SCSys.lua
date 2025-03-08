--[[
    ■■■■
    ■  ■ Sh1zok's Capes System
    ■■■  v1.5
]]--



--[[
    Инициализация
]]--
capeModelParts = {} -- Список частей модели что являются частью плаща
capesList = {} -- Список плащей
capeButtonCommonColor = ""
capeButtonAccentColor = ""
capeButtonTitle = ""
capeButtonDescription = ""
local currentCape = 1

-- Функция формирующая титул кнопки
function updateCapeButtonTitle()
    -- Название кнопки и её описание
    local title = capeButtonTitle .. ": " .. capesList[currentCape][1] .. "\n §7" .. capeButtonDescription

    -- Список плащей
    for index, value in ipairs(capesList) do
        if index == currentCape then -- Выделение выбранного плаща акцентным цветом
            title = title .. "\n " .. capeButtonAccentColor .. value[1]
        else -- Остальные более тусклым
            title = title .. "\n " .. capeButtonCommonColor .. value[1]
        end
    end

    return(title)
end

-- Функция возвращающая текстуру кнопки
function updateCapeButtonTexture()
    return(textures[capesList[currentCape][3]])
end



--[[
    Пинги
]]--
function pings.setCape(texturePath) -- Смена текстур плаща и элитр на заданные
    for _, value in ipairs(capeModelParts) do
        value:setPrimaryTexture("Custom", textures[texturePath])
    end
end



--[[
    Функции для кнопки плаща
]]--
-- Функция для выбора плаща
function capeButtonSelect(dir)
    if dir < 0 then -- При прокручивании вверх
        if currentCape ~= #capesList then
            currentCape = currentCape + 1
        else -- Переход в конец списка если выбор в начале списка
            currentCape = 1
        end
    else -- При прокручивании вниз
        if currentCape ~= 1 then
            currentCape = currentCape - 1
        else -- Переход в начало списка если выбор в конце списка
            currentCape = #capesList
        end
    end

    pings.setCape(capesList[currentCape][2])
end
