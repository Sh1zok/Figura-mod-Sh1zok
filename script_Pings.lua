--[[
    Пинги для смены текстур
]]--
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



--[[
    Остальное
]]--
function pings.armorVisibility(value) -- Устанавливает видимость брони
    vanilla_model.ARMOR:setVisible(value)
end
function pings.nameplateVisibility(value) -- Устанавливает видимость брони
    nameplate.Entity:setVisible(value)
end
