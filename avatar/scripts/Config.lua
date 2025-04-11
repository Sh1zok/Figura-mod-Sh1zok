squapi = require("scripts.libraries.SquAPI") -- Подключение SquAPI
squapi.smoothHead:new({models.model.root.Body, models.model.root.Body.Neck, models.model.root.Body.Neck.Head}, {0.25, 0.25, 0.25}, nil, 1, false) -- Гладкий поворот головы
squapi.eye:new(models.model.root.Body.Neck.Head.Face.Pupils.LeftPupil, 0.125, 0.175, 0.25, 0.25) -- Настройка левого глаза
squapi.eye:new(models.model.root.Body.Neck.Head.Face.Pupils.RightPupil, 0.175, 0.125, 0.25, 0.25) -- Настройка правого глаза
squapi.randimation:new(animations.model.randBlink, 60, true) -- Настройка анимации моргания



-- Настройка анимаций
animations.model.spearR:setPriority(2)
animations.model.spearL:setPriority(2)
animations.model.bowR:setPriority(2)
animations.model.bowL:setPriority(2)
animations.model.crossR:setPriority(2)
animations.model.crossL:setPriority(2)
animations.model.mineR:setPriority(2)
animations.model.mineL:setPriority(2)
animations.model.randBlink:setPriority(3)
animations.model.spyglassR:setPriority(4)
animations.model.spyglassL:setPriority(4)
animations.model.gliding:setPriority(5)



require("scripts.libraries.SASys")
stopingAnimsList = {
    animations.model.attackR,
    animations.model.attackL,
    animations.model.spearL,
    animations.model.spearR,
    animations.model.crossL,
    animations.model.crossR,
    animations.model.bowL,
    animations.model.bowR,
    animations.model.spyglassR,
    animations.model.spyglassL,
    animations.model.mineR,
    animations.model.mineL,
    animations.model.crouchwalk,
    animations.model.crouching,
    animations.model.crouchwalkback,
    animations.model.elytra,
    animations.model.crawling,
    animations.model.swimming,
    animations.model.sleeping,
    animations.model.sprinting,
    animations.model.gliding
}
actionsList = {
    {"Приветствие", animations.model.actionWave, 3, false},
    {"Указать на место", animations.model.actionPointUp, 3, true},
    {'Жест "Дай пять"', animations.model.actionHighFiveBegin, 3, false},
    {"Скрестить руки", animations.model.actionCrossArms, 3, false},
    {"Руки за спиной", animations.model.actionHandsBehindBack, 3, false},
    {"Руки на поясе", animations.model.actionBeltHands, 3, false},
    {'Танец "Удар казачка"', animations.model.actionKazotskyKick, 3, true},
    {"Задумался", animations.model.actionThinking, 3, false},
    {"Снять шляпу", animations.model.actionTakeOffHat, 0, true}
}
actionButtonCommonColor = "§3"
actionButtonAccentColor = "§f"
actionButtonTitle = "Действие"
actionButtonDescription = "Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n"
actionsListDescriptionSize = 5
blendActionAnimations(7.5)



require("scripts.libraries.SESys")
emotionsList = {
    {"Интерес", animations.model.emotionInterested},
    {"Задумался", animations.model.emotionThinking},
    {"Скептик", animations.model.emotionSceptic},
    {"Печаль", animations.model.emotionSad},
    {"Сумасшедший", animations.model.emotionCrazy},
}
emotionButtonCommonColor = "§3"
emotionButtonAccentColor = "§f"
emotionButtonTitle = "Эмоция"
emotionButtonDescription = "Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n"
blendEmotionAnimations(2.5)



require("scripts.libraries.SOSys")
outfitsList = {
    {"Классический", "textures.Outfits.classic", "textures.Icons.classicOutfitIcon", 0, 1, "textures.Misc.hatDefault"},
    {"Зимний", "textures.Outfits.winter", "textures.Icons.winterOutfitIcon", 1, 1, "textures.Misc.hatDefault"},
    {"Оффициальный белый", "textures.Outfits.officialWhite", "textures.Icons.officialWhiteOutfitIcon", 0, 1, "textures.Misc.hatDefault"},
    {"Оффициальный чёрный", "textures.Outfits.officialBlack", "textures.Icons.officialBlackOutfitIcon", 0, 1, "textures.Misc.hatDefault"},
    {"Садовый", "textures.Outfits.gardenGreen", "textures.Icons.gardenGreenOutfitIcon", 0, 1, "textures.Misc.hatGardenGreen"},
    {"Мафия", "textures.Outfits.mafia", "textures.Icons.mafiaOutfitIcon", 0.5, 0, "textures.Misc.hatMafia"}
}
outfitModelParts = {
    models.model.root.Body.Body,
    models.model.root.Body.Jacket,
    models.model.root.Body.Neck.Neck,
    models.model.root.Body.Neck.Head.Head,
    models.model.root.Body.Neck.Head.Hat,
    models.model.root.Body.Neck.Head.Face.FaceMask,
    models.model.root.Body.Neck.Head.Face.Brows,
    models.model.root.Body.Neck.Head.Face.Eyelids,
    models.model.root.Body.Neck.Head.Face.Pupils,
    models.model.root.Body.LeftArm,
    models.model.root.Body.RightArm,
    models.model.root.LeftLeg,
    models.model.root.RightLeg
}
hatModelPart = models.model.root.Body.Neck.Head.Hat
headSecondLayerModelPart = models.model.root.Body.Neck.Head.Hairs
outfitButtonCommonColor = "§3"
outfitButtonAccentColor = "§f"
outfitButtonTitle = "Наряд"
outfitButtonDescription = "Прокручивание вниз: Следующий наряд\n Прокручивание вверх: Предыдущий наряд\n\n Список нарядов:\n"
pings.setOutfit(config:load("SOSys_outfit"))



--[[
    Специальные действия, переменные
]]--
local highFiveCheck = false



--[[
    Специальные действия
]]--
function events.render()
    if activeAction[1] == "Указать на место" then
        models.model.root.Body.LeftArm:setRot((vanilla_model.HEAD:getOriginRot() + 180) % 360 - 1800)
        models.model.root.Body.LeftArm:setRot(models.model.root.Body.LeftArm:getRot().x, -1 * models.model.root.Body.LeftArm:getRot().y, models.model.root.Body.LeftArm:getRot().z)
    else
        models.model.root.Body.LeftArm:setRot(0, 0, 0)
    end

    if activeAction[1] == 'Жест "Дай пять"' then
        local hand_pos = models.model.root.Body.RightArm.RA_BottomPart.RightItemPivot:partToWorldMatrix():apply()
        for _, player in pairs(world:getPlayers()) do
            local pos = player:getPos(delta) + vec(0, player:getEyeHeight(delta), 0)
            local dist = (hand_pos - pos):length()
            pos = pos + player:getLookDir(delta)*dist
            if player:isSwingingArm() and (hand_pos - pos):length() <= 0.3 then
                highFiveCheck = true
            end
        end
        if highFiveCheck then
            animations.model.actionHighFiveBegin:stop()
            animations.model.actionHighFiveEnd:play()
            sounds:playSound("block.froglight.step", player:getPos())

            highFiveCheck = false
        end
    end
end

--[[
    Горячие клавиши
]]--
keybinds:newKeybind("Предыдущий наряд", "key.keyboard.up"):onPress(function ()
    outfitButtonSelect(1)
    outfits:title(updateOutfitButtonTitle())
    outfits:setTexture(updateOutfitButtonTexture())
end)
keybinds:newKeybind("Следующий наряд", "key.keyboard.down"):onPress(function ()
    outfitButtonSelect(-1)
    outfits:title(updateOutfitButtonTitle())
    outfits:setTexture(updateOutfitButtonTexture())
end)
keybinds:newKeybind("Остановить действие/эмоции", "key.keyboard.keypad.0"):onPress(function ()
    pings.stopAction()
    pings.stopEmotion()
end)
keybinds:newKeybind(actionsList[1][1], "key.keyboard.keypad.1"):onPress(function ()
    pings.playAction(1)
end)
keybinds:newKeybind(actionsList[2][1], "key.keyboard.keypad.2"):onPress(function ()
    pings.playAction(2)
end)
keybinds:newKeybind(actionsList[5][1], "key.keyboard.keypad.3"):onPress(function ()
    pings.playAction(4)
end)
keybinds:newKeybind(actionsList[5][1], "key.keyboard.keypad.4"):onPress(function ()
    pings.playAction(5)
end)
keybinds:newKeybind(actionsList[6][1], "key.keyboard.keypad.5"):onPress(function ()
    pings.playAction(6)
end)
keybinds:newKeybind(actionsList[9][1], "key.keyboard.keypad.8"):onPress(function ()
    pings.playAction(9)
end)
keybinds:newKeybind(actionsList[7][1], "key.keyboard.keypad.9"):onPress(function ()
    pings.playAction(7)
end)
