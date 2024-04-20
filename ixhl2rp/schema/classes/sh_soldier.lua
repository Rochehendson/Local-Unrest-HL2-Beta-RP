CLASS.name = "Синтетический Солдат"
CLASS.faction = FACTION_SYNTH
CLASS.isDefault = false
CLASS.weapons = {"weapon_crappy_beta_spear"}

function CLASS:OnSet(client)
    self:Setup(client)
end

function CLASS:OnSpawn(client)
    self:Setup(client)
end

function CLASS:Setup(client)
    local scale = 1.1
    client:SetModelScale(scale, 0)
    client:SetMaxHealth(250)
    client:SetMaxArmor(250)
    client:SetHealth(250)
    client:SetArmor(250)

    local character = client:GetCharacter()
    if character then
        character:SetModel("models/synth/elite_brown.mdl")
    end
end

CLASS_SLD = CLASS.index
