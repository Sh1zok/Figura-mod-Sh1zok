require("libraries.SASys")
require("libraries.SESys")

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
    {"Руки на поясе", animations.model.actionBeltHands},
    {"Отдыхает", animations.model.actionChill}
}
emotionsList = {
    {"Улыбка", animations.model.emotionHappy},
    {"Скептицизм", animations.model.emotionSceptic},
    {"Задумался", animations.model.emotionThinking},
    {"Опечаленный", animations.model.emotionSad},
    {"Заинтересован", animations.model.emotionInterested},
    {"Ебанулся", animations.model.emotionCrazy}
}

actionButtonCommonColor = "§3"
actionButtonAccentColor = "§f"
emotionButtonCommonColor = "§3"
emotionButtonAccentColor = "§f"
actionButtonTitle = "Действие"
actionButtonDescription = "Прокручивание вниз: Следующее действие\n Прокручивание вверх: Предыдущее действие\n ЛКМ: Выбрать действие\n ПКМ: Остановить действие\n\n Список действий:\n"
emotionButtonTitle = "Эмоция"
emotionButtonDescription = "Прокручивание вниз: Следующая эмоция\n Прокручивание вверх: Предыдущая эмоция\n ЛКМ: Выбрать эмоцию\n ПКМ: Остановить эмоцию\n\n Список эмоций:\n"