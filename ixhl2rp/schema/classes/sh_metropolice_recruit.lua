CLASS.name = "Кадет полиции"
CLASS.faction = FACTION_MPF
CLASS.isDefault = true

function CLASS:CanSwitchTo(client)
	return Schema:IsCombineRank(client:Name(), "Cadet G-2")
end

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
    client:SetRunSpeed(235)

end

CLASS_MPR = CLASS.index