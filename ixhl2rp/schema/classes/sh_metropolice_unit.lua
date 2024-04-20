CLASS.name = "Сотрудник полиции"
CLASS.faction = FACTION_MPF

function CLASS:CanSwitchTo(client)
	local name = client:Name()
	local bStatus = false

	for k, v in ipairs({ "Metropolice Guard G-2", "Metropolice Guard G-1", "Metropolice Officer G-2", "Metropolice Officer G-1" }) do
		if (Schema:IsCombineRank(name, v)) then
			bStatus = true

			break
		end
	end

	return bStatus
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
end

CLASS_MPU = CLASS.index