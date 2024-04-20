CLASS.name = "Citizen"
CLASS.faction = FACTION_CITIZEN
CLASS.isDefault = true
CLASS_CITIZEN = CLASS.index

function CLASS:OnSet(client)
    self:Setup(client)
end

function CLASS:OnSpawn(client)
    self:Setup(client)
end

function CLASS:Setup(client)
    local scale = 1
    client:SetModelScale(scale, 0)
    client:SetMaxHealth(100)
    client:SetMaxArmor(100)
    client:SetJumpPower(200)
    client:SetRunSpeed(200)
end