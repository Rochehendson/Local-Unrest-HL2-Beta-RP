CLASS.name = "Ассасин Солдат"
CLASS.faction = FACTION_OTA
CLASS.isDefault = false

function CLASS:OnSet(client)
    self:Setup(client)
end

function CLASS:OnSpawn(client)
    self:Setup(client)
end

function CLASS:Setup(client)
    local scale = 1
    client:SetModelScale(scale, 0)
    client:SetMaxHealth(75)
    client:SetMaxArmor(50)
    client:SetHealth(75)
    client:SetArmor(50)
	client:SetJumpPower(320)
	client:SetRunSpeed(305)
    local character = client:GetCharacter()
    if character then
        character:SetModel("models/thespectator/atsushi8.mdl")
    end
end

CLASS_ASS = CLASS.index
