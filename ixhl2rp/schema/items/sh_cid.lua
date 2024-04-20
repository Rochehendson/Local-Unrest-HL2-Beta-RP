
ITEM.name = "CID-карта"
ITEM.model = Model("models/gibs/metal_gib4.mdl")
ITEM.description = "Гражданская идентификационная карта с номером #%s, принадлежащая %s."

function ITEM:GetDescription()
	return string.format(self.description, self:GetData("id", "00000"), self:GetData("name", "nobody"))
end
