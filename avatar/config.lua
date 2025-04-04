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
    animations.model.sleeping
}
actionsList = {
    {"Приветствие", animations.model.actionWave},
    {"Указать на место", animations.model.actionPointUp},
    {"Скрестить руки", animations.model.actionCrossArms},
    {'Жест "Дай пять"', animations.model.actionHighFiveBegin},
    {'Танец "Руки вверх"', animations.model.actionDanceHandsUp},
    {'Танец "Удар казачка"', animations.model.actionKazotskyKick},
    {"Задумался", animations.model.actionThinking},
    {"Отряхнулся", animations.model.actionShakeOff},
    {"Руки на поясе", animations.model.actionBeltHands},
    {"Развёл руки", animations.model.actionThrowsUpHands},
    {"Пожал плечами", animations.model.actionShrug},
    {"Осмотр предмета", animations.model.actionInspectItem},
    {"Руки за спиной", animations.model.actionHandsBehindBack}
}
actionButtonCommonColor = "§3"
actionButtonAccentColor = "§f"
actionButtonTitle = "Действие"
actionButtonDescription = "Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n"
actionsListDescriptionSize = 5
prioritizeActionAnimations(3)
blendActionAnimations(7.5)



require("libraries.SESys")
emotionsList = {
    {"Улыбка", animations.model.emotionHappy},
    {"Скептик", animations.model.emotionSceptic},
    {"Задумался", animations.model.emotionThinking},
    {"Печаль", animations.model.emotionSad},
    {"Интерес", animations.model.emotionInterested},
    {"Сумасшедший", animations.model.emotionCrazy},
    {"Шок", animations.model.emotionScared},
    {"Рассматривает", animations.model.emotionCloserLook}
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
    {"Современный 1", "assets.outfits.sh1zok", "assets.icons.sh1zokOutfitIcon", 0, true},
    {"Современный 2", "assets.outfits.modern", "assets.icons.modernOutfitIcon", 1, false},
    {"Пиратский", "assets.outfits.pirate", "assets.icons.pirateOutfitIcon", 1, false},
    {"Зимний", "assets.outfits.winter", "assets.icons.winterOutfitIcon", 1, false},
    {'"Детектив"', "assets.outfits.detective", "assets.icons.detectiveOutfitIcon", 0, false},
    {"Оффициальный белый", "assets.outfits.officialWhite", "assets.icons.officialWhiteOutfitIcon", 0, true},
    {"Оффициальный чёрный", "assets.outfits.officialBlack", "assets.icons.officialBlackOutfitIcon", 0, true},
    {"Садовый", "assets.outfits.gardenGreen", "assets.icons.gardenGreenOutfitIcon", 0, true},
    {"Мафия", "assets.outfits.mafia", "assets.icons.mafiaOutfitIcon", 0.5, false}
}
outfitModelParts = {
    models.model.root.Body.Outfit,
    models.model.root.Body.OutfitSecond,
    models.model.root.Body.Head.Outfit,
    models.model.root.Body.Head.OutfitSecond,
    models.model.root.Body.Head.OutfitThird,
    models.model.root.Body.LeftArm.Outfit,
    models.model.root.Body.LeftArm.OutfitSecond,
    models.model.root.Body.LeftArm.LeftABottom.Outfit,
    models.model.root.Body.LeftArm.LeftABottom.OutfitSecond,
    models.model.root.Body.RightArm.Outfit,
    models.model.root.Body.RightArm.OutfitSecond,
    models.model.root.Body.RightArm.RightABottom.Outfit,
    models.model.root.Body.RightArm.RightABottom.OutfitSecond,
    models.model.root.LeftLeg.Outfit,
    models.model.root.LeftLeg.OutfitSecond,
    models.model.root.LeftLeg.LeftLBottom.Outfit,
    models.model.root.LeftLeg.LeftLBottom.OutfitSecond,
    models.model.root.RightLeg.Outfit,
    models.model.root.RightLeg.OutfitSecond,
    models.model.root.RightLeg.RightLBottom.Outfit,
    models.model.root.RightLeg.RightLBottom.OutfitSecond
}
hatModelParts = {
    models.model.root.Body.Head.Outfit,
    models.model.root.Body.Head.OutfitSecond,
    models.model.root.Body.Head.OutfitThird
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
    Специальные действия, функции
]]--
function events.render()
    if activeAction[1] == "Указать на место" then
        models.model.root.Body.RightArm:setRot((vanilla_model.HEAD:getOriginRot() + 180) % 360 - 180)
    else
        models.model.root.Body.RightArm:setRot(0, 0, 0)
    end
end

function events.render(delta)
    if activeAction[1] == 'Жест "Дай пять"' then
        local hand_pos = models.model.root.Body.RightArm.RightABottom.RightItemPivot:partToWorldMatrix():apply()
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
keybinds:newKeybind("Остановить действие/эмоции", "key.keyboard.keypad.0", false):onPress(function ()
    pings.stopAction()
end)
keybinds:newKeybind(actionsList[1][1], "key.keyboard.keypad.1", false):onPress(function ()
    pings.playAction(1)
end)
keybinds:newKeybind(actionsList[2][1], "key.keyboard.keypad.2", false):onPress(function ()
    pings.playAction(2)
end)
keybinds:newKeybind(actionsList[3][1], "key.keyboard.keypad.3", false):onPress(function ()
    pings.playAction(3)
end)
