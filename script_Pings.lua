--[[
    Пинги для смены текстур
]]--
function pings.changeMouth(texture) -- Смена текстуры рта на заданную
        models.model.root.Body.Head.Face.Mouth:setPrimaryTexture("Custom", textures["assets.mouth." .. texture])
end
function pings.changeSkin(textureName) -- Смена текстуры кожи на заданную
    models.model.root.Body.Body:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.Head.Head:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.Head.HeadSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.Head.Face:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.LeftArm.LeftArmTop:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.LeftArm.LeftABottom.LeftArmBottom:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.RightArm.RightArmTop:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.RightArm.RightABottom.RightArmBottom:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.LeftLeg.LeftLegTop:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.LeftLeg.LeftLBottom.LeftLegBottom:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.RightLeg.RightLegTop:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.RightLeg.RightLBottom.RightLegBottom:setPrimaryTexture("Custom", textures[textureName])

    models.model.root.Body.Head.Face.Mouth:setPrimaryTexture("Custom", textures["assets.mouth." .. currentMouth])
end
function pings.setOutfit(textureName, offset12, offset3, HeadSecond) -- Смена текстур наряда на заданную, регулировка высоты шляпы, переключение видимости второя слова головы
    models.model.root.Body.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.RightArm.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.RightArm.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.RightArm.RightABottom.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.RightArm.RightABottom.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.LeftArm.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.LeftArm.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.LeftArm.LeftABottom.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.LeftArm.LeftABottom.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.RightLeg.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.RightLeg.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.RightLeg.RightLBottom.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.RightLeg.RightLBottom.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.LeftLeg.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.LeftLeg.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.LeftLeg.LeftLBottom.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.LeftLeg.LeftLBottom.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.Head.Outfit:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.Head.OutfitSecond:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.Head.OutfitThird:setPrimaryTexture("Custom", textures[textureName])
    models.model.root.Body.Head.Outfit:setPos(0, offset12, 0)
    models.model.root.Body.Head.OutfitSecond:setPos(0, offset12, 0)
    models.model.root.Body.Head.OutfitThird:setPos(0, offset3, 0)

    models.model.root.Body.Head.HeadSecond:setVisible(HeadSecond)
end
function pings.setCape(textureName) -- Смена текстур плаща и элитр на заданные
    models.model.root.Body.Cape:setPrimaryTexture("Custom", textures["assets.capes." .. textureName])
    models.model.root.Body.Elytra:setPrimaryTexture("Custom", textures["assets.capes." .. textureName])
end



--[[
    Пинги для действий
]]--
function pings.stopSpclActs()
    pointUpShouldPlay = false
    stopHighFive = true
end
function pings.act(state, currentAct)
    if not host:isHost() then
        activeAction = actionsList[currentAct]
    end

    for _, value in ipairs(actionsList) do
        if value[2] ~= nil then
            value[2]:stop()
        end
    end

    if activeAction[2] ~= nil then
        activeAction[2]:setPlaying(state)
    end

    if state then
        function events.tick() -- Условие для преждевременной остановки анимации
            if
            animations.model.sprinting:isPlaying() or
            animations.model.crouchwalk:isPlaying() or
            animations.model.crouching:isPlaying() or
            animations.model.crouchwalkback:isPlaying() or
            animations.model.attackR:isPlaying() or
            animations.model.attackL:isPlaying() or
            animations.model.elytra:isPlaying() or
            animations.model.crawling:isPlaying() or
            animations.model.swimming:isPlaying() or
            animations.model.sleeping:isPlaying() or
            animations.model.spearL:isPlaying() or
            animations.model.spearR:isPlaying() or
            animations.model.crossL:isPlaying() or
            animations.model.crossR:isPlaying() or
            animations.model.bowL:isPlaying() or
            animations.model.bowR:isPlaying() or
            animations.model.spyglassR:isPlaying() or
            animations.model.spyglassL:isPlaying() or
            animations.model.mineR:isPlaying() or
            animations.model.mineL:isPlaying() then
                if activeAction[2] ~= nil then
                    activeAction[2]:stop()
                end
            end
        end
    end
end
function pings.emotion(state, currentEmo)
    if not host:isHost() then
        activeEmotion = emotionsList[currentEmo]
    end

    for _, value in ipairs(emotionsList) do
        value[2]:stop()
    end

    activeEmotion[2]:setPlaying(state)
end
function pings.pointUp() -- Направляет руку игрока в сторону его взгляда
    pointUpShouldPlay = true
    animations.model.actionPointUp:play()
    function events.render()
        if pointUpShouldPlay and not animations.model.sprinting:isPlaying() and not animations.model.crouching:isPlaying() then
            local headrotation = (vanilla_model.HEAD:getOriginRot() + 180) % 360 - 180
            models.model.root.Body.RightArm:setRot(headrotation)
        else 
            models.model.root.Body.RightArm:setRot(0, 0, 0)
            animations.model.actionPointUp:stop()
            pointUpShouldPlay = false
        end
    end
end
function pings.highFive() -- Действие "Дай пять!"
    stopHighFive = false
    animations.model.actionHighFiveBegin:play()
    handParticle = particles["sonic_boom"]
    handParticle:spawn()
    handParticle:setScale(1)
    local highFiveCheck = false
    function events.render(delta, context) -- 123yeah_boi321 - Author of that code. Dude, you cool!
        if not player:isLoaded() then return end
        local hand_pos = models.model.root.Body.RightArm.RightABottom.RightItemPivot:partToWorldMatrix():apply()
        handParticle:setPos(hand_pos)
        for _, player in pairs(world:getPlayers()) do
            local pos = player:getPos(delta) + vec(0, player:getEyeHeight(delta), 0)
            local dist = (hand_pos - pos):length()
            pos = pos + player:getLookDir(delta)*dist
            if player:isSwingingArm() and (hand_pos - pos):length() <= 0.2 and not stopHighFive then
                highFiveCheck = true
            else
                if not handParticle:isAlive() then
                    if not stopHighFive then
                        handParticle = particles["sonic_boom"]
                        handParticle:setScale(1)
                        handParticle:spawn()
                    end
                end
            end
        end
        if highFiveCheck == true then
            animations.model.actionHighFiveBegin:stop()
            animations.model.actionHighFiveEnd:play()
            sounds:playSound("block.froglight.step", player:getPos())
            highFiveCheck = false -- Для прекращения анимации после того как дали пять
            stopHighFive = true
        end
        if player:isSprinting() or player:isCrouching() or player:isSwingingArm() then
            stopHighFive = true
            animations.model.actionHighFiveBegin:stop()
            animations.model.actionHighFiveEnd:stop()
        end
    end
end



--[[
    Остальное
]]--
function pings.armorVisibility(value) -- Устанавливает видимость брони
    vanilla_model.ARMOR:setVisible(value)
end
function pings.nameplateVisibility(value) -- Устанавливает видимость брони
    nameplate.Entity:setVisible(value)
end
