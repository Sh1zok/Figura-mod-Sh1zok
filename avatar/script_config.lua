require("libraries.SASys")
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
    animations.model.sprinting
}
actionsList = {
    {"Приветствие", animations.model.actionWave, 3, false},
    {"Указать на место", animations.model.actionPointUp, 3, true},
    {'Жест "Дай пять"', animations.model.actionHighFiveBegin, 3, false},
    {"Осмотр предмета", animations.model.actionInspectItem, 3, false},
    {"Скрестить руки", animations.model.actionCrossArms, 3, false},
    {"Руки за спиной", animations.model.actionHandsBehindBack, 3, false},
    {"Руки на поясе", animations.model.actionBeltHands, 3, false},
    {'Танец "Руки вверх"', animations.model.actionDanceHandsUp, 3, false},
    {'Танец "Удар казачка"', animations.model.actionKazotskyKick, 3, true},
    {"Задумался", animations.model.actionThinking, 3, false},
    {"Отряхнулся", animations.model.actionShakeOff, 3, false},
    {"Развёл руки", animations.model.actionThrowsUpHands, 3, false},
    {"Пожал плечами", animations.model.actionShrug, 3, false},
    {"Снять шляпу", animations.model.actionTakeOffHat, 0, true}
}
actionButtonCommonColor = "§3"
actionButtonAccentColor = "§f"
actionButtonTitle = "Действие"
actionButtonDescription = "Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n"
actionsListDescriptionSize = 5
blendActionAnimations(7.5)



require("libraries.SESys")
emotionsList = {
    {"Интерес", animations.model.emotionInterested},
    {"Задумался", animations.model.emotionThinking},
    {"Скептик", animations.model.emotionSceptic},
    {"Улыбка", animations.model.emotionHappy},
    {"Печаль", animations.model.emotionSad},
    {"Сумасшедший", animations.model.emotionCrazy},
    {"Шок", animations.model.emotionScared}
}
emotionButtonCommonColor = "§3"
emotionButtonAccentColor = "§f"
emotionButtonTitle = "Эмоция"
emotionButtonDescription = "Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n"
blendEmotionAnimations(2.5)




require("libraries.SCSys")
capesList = {
    {"Без плаща", "assets.capes.cape_default", "assets.icons.capeDefault"},
    {"15th Anniversary", "assets.capes.15th Anniversary", "assets.icons.cape15thAnniversary"},
    {"Follower's", "assets.capes.Follower's", "assets.icons.capeFollower's"},
    {"Purple Heart", "assets.capes.Purple Heart", "assets.icons.capePurpleHeart"},
    {"MCC 15th Year", "assets.capes.MCC 15th Year", "assets.icons.capeMCC15thYear"},
    {"Mojang Studios", "assets.capes.Mojang Studios", "assets.icons.capeMojangStudios"},
    {"Mojang Office", "assets.capes.Mojang Office", "assets.icons.capeMojangOffice"},
    {"Home", "assets.capes.Home", "assets.icons.capeHome"},
    {"Menace", "assets.capes.Menace", "assets.icons.capeMenace"}
}
capeModelParts = {
    models.model.root.Body.Cape,
    models.model.root.Body.Elytra
}
capeButtonCommonColor = "§3"
capeButtonAccentColor = "§f"
capeButtonTitle = "Плащ"
capeButtonDescription = "Прокручивание вниз: Следующий плащ\n Прокручивание вверх: Предыдущий плащ\n\n Список плащей:\n"
getCapeFromConfig()



require("libraries.SOSys")
outfitsList = {
    {"Классический", "assets.outfits.classic", "assets.icons.classicOutfitIcon", 0, true},
    {"Повседневный 1", "assets.outfits.everyday1", "assets.icons.everyday1OutfitIcon", 0, true},
    {"Современный", "assets.outfits.modern", "assets.icons.modernOutfitIcon", 1, false},
    {"Пиратский", "assets.outfits.pirate", "assets.icons.pirateOutfitIcon", 1, false},
    {"Зимний", "assets.outfits.winter", "assets.icons.winterOutfitIcon", 1, false},
    {'"Детектив"', "assets.outfits.detective", "assets.icons.detectiveOutfitIcon", 0, false},
    {"Оффициальный белый", "assets.outfits.officialWhite", "assets.icons.officialWhiteOutfitIcon", 0, true},
    {"Оффициальный чёрный", "assets.outfits.officialBlack", "assets.icons.officialBlackOutfitIcon", 0, true},
    {"Садовый", "assets.outfits.gardenGreen", "assets.icons.gardenGreenOutfitIcon", 0, true},
    {"Мафия", "assets.outfits.mafia", "assets.icons.mafiaOutfitIcon", 0.5, false}
}
outfitModelParts = {
    models.model.root.Body.Body,
    models.model.root.Body.BodySecond,
    models.model.root.Body.Head.Head,
    models.model.root.Body.Head.HeadSecond,
    models.model.root.Body.Head.Hat,
    models.model.root.Body.Head.Face.FaceMask,
    models.model.root.Body.Head.Face.Brows,
    models.model.root.Body.Head.Face.Eyelids,
    models.model.root.Body.Head.Face.Pupils,
    models.model.root.Body.LeftArm,
    models.model.root.Body.RightArm,
    models.model.root.LeftLeg,
    models.model.root.RightLeg
}
hatModelParts = {
    models.model.root.Body.Head.Hat
}
headSecondLayerModelPart = models.model.root.Body.Head.HeadSecond
outfitButtonCommonColor = "§3"
outfitButtonAccentColor = "§f"
outfitButtonTitle = "Наряд"
outfitButtonDescription = "Прокручивание вниз: Следующий наряд\n Прокручивание вверх: Предыдущий наряд\n\n Список нарядов:\n"
getOutfitFromConfig()



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
        models.model.root.Body.LeftArm:setRot(0, 0, -2.5)
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

    if activeAction[1] == "Снять шляпу" then
        models.model.root.Body.Head.HeadSecond:setVisible(true)
    else
        headSecondLayerModelPart:setVisible(outfitsList[currentOutfit][5])
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
    pings.playAction(5)
end)
keybinds:newKeybind(actionsList[6][1], "key.keyboard.keypad.4"):onPress(function ()
    pings.playAction(6)
end)
keybinds:newKeybind(actionsList[14][1], "key.keyboard.keypad.8"):onPress(function ()
    pings.playAction(14)
end)
keybinds:newKeybind(actionsList[9][1], "key.keyboard.keypad.9"):onPress(function ()
    pings.playAction(9)
end)



