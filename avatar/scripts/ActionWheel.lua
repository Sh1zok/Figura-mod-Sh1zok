-- Создание страниц колеса действий
mainPage = action_wheel:newPage()
settingsPage = action_wheel:newPage()
action_wheel:setPage(mainPage) -- Задание активной страницы

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
outfits = mainPage:newAction()  -- При прокручивании переключает наряды
    :setTitle(updateOutfitButtonTitle())
    :setTexture(updateOutfitButtonTexture()) -- Начальная текстура кнопки
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onScroll(function(dir)
        outfitButtonSelect(dir)
        outfits:title(updateOutfitButtonTitle())
        outfits:setTexture(updateOutfitButtonTexture())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
actions = mainPage:newAction()
    :title(updateActionButtonTitle())
    :item("minecraft:light")
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onLeftClick(function()
        actionButtonPlay()
        actions:title(updateActionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onRightClick(function()
        actionButtonStop()
        actions:title(updateActionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onScroll(function(dir)
        actionButtonSelect(dir)
        actions:title(updateActionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
emotions = mainPage:newAction()
    :title(updateEmotionButtonTitle())
    :item("minecraft:axolotl_bucket")
    :hoverColor(0, 1, 1)
    :color(0, 0.75, 0.75)
    :onLeftClick(function()
        emotionButtonPlay()
        emotions:title(updateEmotionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onRightClick(function()
        emotionButtonStop()
        emotions:title(updateEmotionButtonTitle())
        sounds:playSound("block.calcite.place", player:getPos())
    end)
    :onScroll(function(dir)
        emotionButtonSelect(dir)
        emotions:title(updateEmotionButtonTitle())
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
    :toggled(config:load("nameplateVisibility"))
    :onToggle(function()
        config:save("nameplateVisibility", settingToggleNameplateVisibility:isToggled())
        pings.setNameplateVisibility(settingToggleNameplateVisibility:isToggled())

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
    :toggled(config:load("armorVisibility"))
    :onToggle(function()
        config:save("armorVisibility", settingToggleArmorVisibility:isToggled())
        pings.setArmorVisibility(settingToggleArmorVisibility:isToggled())

        if settingToggleArmorVisibility:isToggled() then
            sounds:playSound("block.beacon.activate", player:getPos())
        else
            sounds:playSound("block.beacon.deactivate", player:getPos())
        end
    end)
