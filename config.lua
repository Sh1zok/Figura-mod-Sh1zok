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
    animations.model.sprinting,
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
    {"Указать на место", nil},
    {"Осмотр предмета", animations.model.actionInspectItem},
    {'Жест "Дай пять"', nil},
    {'Танец "Руки вверх"', animations.model.actionDanceHandsUp},
    {"Скрестить руки", animations.model.actionCrossArms},
    {"Задумался", animations.model.actionThinking},
    {"Отряхнулся", animations.model.actionShakeOff},
    {"Руки на поясе", animations.model.actionBeltHands}
}
actionButtonCommonColor = "§3"
actionButtonAccentColor = "§f"
actionButtonTitle = "Действие"
actionButtonDescription = "Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n"



require("libraries.SESys")
emotionsList = {
    {"Улыбка", animations.model.emotionHappy},
    {"Скептицизм", animations.model.emotionSceptic},
    {"Задумался", animations.model.emotionThinking},
    {"Опечаленный", animations.model.emotionSad},
    {"Заинтересован", animations.model.emotionInterested},
    {"Ебанулся", animations.model.emotionCrazy}
}
emotionButtonCommonColor = "§3"
emotionButtonAccentColor = "§f"
emotionButtonTitle = "Эмоция"
emotionButtonDescription = "Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n"



require("libraries.SCSys")
capesList = {
    {"Без плаща", "assets.capes.cape_default", "assets.icons.capeDefault"},
    {"15th Anniversary", "assets.capes.15th Anniversary", "assets.icons.cape15thAnniversary"},
    {"Follower's", "assets.capes.Follower's", "assets.icons.capeFollower's"},
    {"Purple Heart", "assets.capes.Purple Heart", "assets.icons.capePurpleHeart"},
    {"MCC 15th Year", "assets.capes.MCC 15th Year", "assets.icons.capeMCC15thYear"},
    {"Mojang Studios", "assets.capes.Mojang Studios", "assets.icons.capeMojangStudios"},
    {"Mojang Office", "assets.capes.Mojang Office", "assets.icons.capeMojangOffice"}
}
capeModelParts = {
    models.model.root.Body.Cape,
    models.model.root.Body.Elytra
}
capeButtonCommonColor = "§3"
capeButtonAccentColor = "§f"
capeButtonTitle = "Плащ"
capeButtonDescription = "Прокручивание вниз: Следующий плащ\n Прокручивание вверх: Предыдущий плащ\n\n Список плащей:\n"



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
    {"Оффициальный чёрный", "assets.outfits.officialBlack", "assets.icons.officialBlackOutfitIcon", 0, true}
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