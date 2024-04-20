ITEM.name = "Ключ"
ITEM.description = "Ключ для дверей."
ITEM.model = "models/willardnetworks/misc/idcard.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.base = nil -- https://github.com/NebulousCloud/helix/blob/master/gamemode/core/libs/sh_item.lua#L181-L198

-- function ITEM:OnInstanced(invID, x, y, item)
-- 	item:SetData("HouseName", "Unknown House")
-- 	item:SetData("PropertyID", -1)
-- end

function ITEM:GetName()
    return "Ключ для ".. self:GetData("HouseName", "какой-то двери")
end
