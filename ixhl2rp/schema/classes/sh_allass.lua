CLASS.name = "Синтет Ассасин"
CLASS.faction = FACTION_SYNTH
CLASS.isDefault = false
CLASS.weapons = {"swep_assaslek"}

function CLASS:OnSet(client)
    self:Setup(client)
end

function CLASS:OnSpawn(client)
    self:Setup(client)
end

function CLASS:Setup(client)
    local character = client:GetCharacter()
    if character then
        character:SetModel("models/assaslek/player/assaslek.mdl")
    end
end

CLASS_ALASS = CLASS.index
