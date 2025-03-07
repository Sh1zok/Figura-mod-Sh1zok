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
    Остальное
]]--
function pings.armorVisibility(value) -- Устанавливает видимость брони
    vanilla_model.ARMOR:setVisible(value)
end
function pings.nameplateVisibility(value) -- Устанавливает видимость брони
    nameplate.Entity:setVisible(value)
end
