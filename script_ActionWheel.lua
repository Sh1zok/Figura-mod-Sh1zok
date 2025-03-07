--[[
    Написание начальных динамических названий
]]--
-- Создание начального названия и описания кнопки выбора действия
local manageActionTitle = "Действие: Нет\n §7Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n" -- Шапка названия и описания кнопки
for index, value in ipairs(actionsList) do -- Перечисление пунктов за исключением "Нет"
    if index == currentAction then -- Помечаем выбранный пункт более ярким цветом
        manageActionTitle = manageActionTitle .. "\n §f" .. value[1]
    else -- Остальные более тусклым
        manageActionTitle = manageActionTitle .. "\n §3" .. value[1]
    end
end

-- Создание начального названия и описания кнопки выбора эмоции
local manageEmotionTitle = "Эмоция: Нет\n §7Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n" -- Шапка названия и описания кнопки
for index, value in ipairs(emotionsList) do
    if index == currentEmotion then -- Помечаем выбранный пункт более ярким цветом
        manageEmotionTitle = manageEmotionTitle .. "\n §f" .. value[1]
    else -- Остальные более тусклым
        manageEmotionTitle = manageEmotionTitle .. "\n §3" .. value[1]
    end
end

-- Создание начального названия и описания кнопки выбора плаща
local manageCapeTitle = "Плащ: Без плаща\n §7Прокручивание вниз: Следующий плащ\n Прокручивание вверх: Предыдущий плащ\n\n Список плащей:\n" -- Шапка названия и описания кнопки
for index, value in ipairs(capesList) do -- Перечисление пунктов
    if index == currentCape then -- Помечаем выбранный пункт более ярким цветом
        manageCapeTitle = manageCapeTitle .. "\n §f" .. value[1]
    else -- Остальные более тусклым
        manageCapeTitle = manageCapeTitle .. "\n §3" .. value[1]
    end
end

-- Создание начального названия и описания кнопки выбора наряда
local manageOutfitTitle = "Наряд: Классический\n §7Прокручивание вниз: Следующий наряд\n Прокручивание вверх: Предыдущий наряд\n\n Список нарядов:\n" -- Шапка названия и описания кнопки
for index, value in ipairs(outfitsList) do -- Перечисление пунктов
    if index == currentOutfit then -- Помечаем выбранный пункт более ярким цветом
        manageOutfitTitle = manageOutfitTitle .. "\n §f" .. value[1]
    else -- Остальные более тусклым
        manageOutfitTitle = manageOutfitTitle .. "\n §3" .. value[1]
    end
end



--[[
    Кнопки главной страницы
]]--
goToSettingsPage = mainPage:newAction() -- При нажатии ведёт на страницу настроек
    :title("Настройки")
    :item("minecraft:command_block")
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onLeftClick(function()
        action_wheel:setPage(settingsPage)
        sounds:playSound("item.axe.strip", player:getPos())
    end)
manageCape = mainPage:newAction() -- При прокручивании переключает плащи
    :title(manageCapeTitle)
    :setTexture(capesList[currentCape][3]) -- Начальная текстура кнопки
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onScroll(function(dir)
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

        manageCapeTitle = "Плащ: " .. capesList[currentCape][1] .. "\n §7Прокручивание вниз: Следующий плащ\n Прокручивание вверх: Предыдущий плащ\n\n Список плащей:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(capesList) do -- Перечисление пунктов
            if index == currentCape then -- Помечаем выбранный пункт более ярким цветом
                manageCapeTitle = manageCapeTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageCapeTitle = manageCapeTitle .. "\n §3" .. value[1]
            end
        end

        manageCape:title(manageCapeTitle) -- Задаём новый титул кнопки
        manageCape:setTexture(capesList[currentCape][3]) -- Задаём новую текстуру кнопки

        pings.setCape(capesList[currentCape][2]) -- Меняем плащ на заданный

        sounds:playSound("block.calcite.place", player:getPos())
    end)
manageOutfit = mainPage:newAction()  -- При прокручивании переключает наряды
    :setTitle(manageOutfitTitle)
    :setTexture(outfitsList[currentOutfit][6]) -- Начальная текстура кнопки
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onScroll(function(dir)
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

        manageOutfitTitle = "Наряд: " .. outfitsList[currentOutfit][1] .. "\n §7Прокручивание вниз: Следующий наряд\n Прокручивание вверх: Предыдущий наряд\n\n Список нарядов:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(outfitsList) do -- Перечисление пунктов
            if index == currentOutfit then -- Помечаем выбранный пункт более ярким цветом
                manageOutfitTitle = manageOutfitTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageOutfitTitle = manageOutfitTitle .. "\n §3" .. value[1]
            end
        end

        manageOutfit:title(manageOutfitTitle) -- Задаём новый титул кнопки
        manageOutfit:setTexture(outfitsList[currentOutfit][6]) -- Задаём новую текстуру кнопки

        pings.setOutfit(outfitsList[currentOutfit][2], outfitsList[currentOutfit][3], outfitsList[currentOutfit][4], outfitsList[currentOutfit][5]) -- Меняем наряд на заданный

        sounds:playSound("block.calcite.place", player:getPos())
    end)
manageAction = mainPage:newAction() -- При прокручивании выбирает дейсвие, при нажатии ЛКМ воспроизводит действие
    :title(manageActionTitle)
    :item("minecraft:light")
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onLeftClick(function()
        activeAction = actionsList[currentAction]
        if activeAction[2] ~= nil then
            pings.act(true, currentAction)
        else
            if activeAction[1] == "Указать на место" then
                pings.pointUp()
            elseif activeAction[1] == 'Жест "Дай пять"' then
                pings.highFive()
            end
        end

        manageActionTitle = "Действие: " .. activeAction[1] .. "\n §7Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(actionsList) do
            if index == currentAction then -- Помечаем выбранный пункт более ярким цветом
                manageActionTitle = manageActionTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageActionTitle = manageActionTitle .. "\n §3" .. value[1]
            end
        end

        manageAction:title(manageActionTitle) -- Задаём новый титул кнопки
    end)
    :onRightClick(function ()
        if activeAction[2] ~= nil then
            pings.act(false, currentAction)
        end
        
        pings.stopSpclActs()

        manageActionTitle = "Действие: Нет\n §7Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(actionsList) do
            if index == currentAction then -- Помечаем выбранный пункт более ярким цветом
                manageActionTitle = manageActionTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageActionTitle = manageActionTitle .. "\n §3" .. value[1]
            end
        end

        manageAction:title(manageActionTitle) -- Задаём новый титул кнопки

        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onScroll(function(dir)
        if dir < 0 then -- При прокручивании вверх
            if currentAction ~= #actionsList then
                currentAction = currentAction + 1
            else -- Переход в конец списка если выбор в начале списка
                currentAction = 1
            end
        else -- При прокручивании вниз
            if currentAction ~= 1 then
                currentAction = currentAction - 1
            else -- Переход в начало списка если выбор в конце списка
                currentAction = #actionsList
            end
        end

        manageActionTitle = "Действие: " .. activeAction[1] .. "\n §7Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(actionsList) do
            if index == currentAction then -- Помечаем выбранный пункт более ярким цветом
                manageActionTitle = manageActionTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageActionTitle = manageActionTitle .. "\n §3" .. value[1]
            end
        end

        manageAction:title(manageActionTitle) -- Задаём новый титул кнопки

        sounds:playSound("block.calcite.place", player:getPos())
    end)
manageEmotion = mainPage:newAction() -- При прокручивании выбирает эмоцию, при нажатии ЛКМ воспроизводит эмоцию
    :title(manageEmotionTitle)
    :item("minecraft:axolotl_bucket")
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onLeftClick(function()
        activeEmotion = emotionsList[currentEmotion]
        pings.emotion(true, currentEmotion)

        manageEmotionTitle = "Эмоция: " .. activeEmotion[1] .. "\n §7Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(emotionsList) do
            if index == currentEmotion then -- Помечаем выбранный пункт более ярким цветом
                manageEmotionTitle = manageEmotionTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageEmotionTitle = manageEmotionTitle .. "\n §3" .. value[1]
            end
        end

        manageEmotion:title(manageEmotionTitle) -- Задаём новый титул кнопки
    end)
    :onRightClick(function ()
        pings.emotion(false, currentEmotion)

        manageEmotionTitle = "Эмоция: Нет\n §7Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(emotionsList) do
            if index == currentEmotion then -- Помечаем выбранный пункт более ярким цветом
                manageEmotionTitle = manageEmotionTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageEmotionTitle = manageEmotionTitle .. "\n §3" .. value[1]
            end
        end

        manageEmotion:title(manageEmotionTitle) -- Задаём новый титул кнопки

        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onScroll(function(dir)
        if dir < 0 then -- При прокручивании вверх
            if currentEmotion ~= #emotionsList then
                currentEmotion = currentEmotion + 1
            else -- Переход в конец списка если выбор в начале списка
                currentEmotion = 1
            end
        else -- При прокручивании вниз
            if currentEmotion ~= 1 then
                currentEmotion = currentEmotion - 1
            else -- Переход в начало списка если выбор в конце списка
                currentEmotion = #emotionsList
            end
        end

        manageEmotionTitle = "Эмоция: " .. activeEmotion[1] .. "\n §7Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n" -- Шапка названия и описания кнопки
        for index, value in ipairs(emotionsList) do
            if index == currentEmotion then -- Помечаем выбранный пункт более ярким цветом
                manageEmotionTitle = manageEmotionTitle .. "\n §f" .. value[1]
            else -- Остальные более тусклым
                manageEmotionTitle = manageEmotionTitle .. "\n §3" .. value[1]
            end
        end

        manageEmotion:title(manageEmotionTitle) -- Задаём новый титул кнопки

        sounds:playSound("block.calcite.place", player:getPos())
    end)



--[[
    Кнопки страницы настроек
]]--
actionGoBack = settingsPage:newAction() -- При нажатии ведёт на главную страницу
    :title("Вернуться назад")
    :item("minecraft:spectral_arrow")
    :hoverColor(1, 1, 1)
    :color(0.75, 0.75, 0.75)
    :onLeftClick(function()
        action_wheel:setPage(mainPage)
        sounds:playSound("item.axe.strip", player:getPos())
    end)
settingToggleNameplateVisibility = settingsPage:newAction() -- При нажатии переключает видимость никнейма
    :title("Сделать никнейм видимым")
    :toggleTitle("Сделать никнейм невидимым")
    :color(0.75, 0, 0)
    :toggleColor(0, 0.75, 0)
    :hoverColor(1, 1, 1)
    :item("minecraft:book")
    :toggleItem("minecraft:enchanted_book")
    :onToggle(function()
        pings.nameplateVisibility(settingToggleNameplateVisibility:isToggled())
        if settingToggleNameplateVisibility:isToggled() then
            sounds:playSound("block.beacon.activate", player:getPos())
        else
            sounds:playSound("block.beacon.deactivate", player:getPos())
        end
    end)
settingToggleArmorVisibility = settingsPage:newAction() -- При нажатии переключает видимость брони
    :title("Сделать броню видимой")
    :toggleTitle("Сделать броню невидимой")
    :color(0.75, 0, 0)
    :toggleColor(0, 0.75, 0)
    :hoverColor(1, 1, 1)
    :item("minecraft:chainmail_chestplate")
    :toggleItem("minecraft:netherite_chestplate")
    :toggled(true)
    :onToggle(function()
        pings.armorVisibility(settingToggleArmorVisibility:isToggled())
        if settingToggleArmorVisibility:isToggled() then
            sounds:playSound("block.beacon.activate", player:getPos())
        else
            sounds:playSound("block.beacon.deactivate", player:getPos())
        end
    end)
settingCameraShouldBeOnShoulder = settingsPage:newAction() -- При нажатии переключает перенос камеры от третьего лица на плечо
    :title("Поместить камеру на плечо")
    :toggleTitle("Снять камеру с плеча")
    :color(0.75, 0, 0)
    :toggleColor(0, 0.75, 0)
    :hoverColor(1, 1, 1)
    :item("minecraft:spyglass")
    :toggled(true)
    :onToggle(function()
        if settingCameraShouldBeOnShoulder:isToggled() then
            sounds:playSound("block.beacon.activate", player:getPos())
        else
            sounds:playSound("block.beacon.deactivate", player:getPos())
        end
    end)
