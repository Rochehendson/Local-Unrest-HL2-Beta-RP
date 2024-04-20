ITEM.name = "Хирургический набор"
ITEM.model = Model("models/willardnetworks/skills/surgicalkit.mdl")
ITEM.skin = 0
ITEM.description = "В этом наборе сочетаются традиционные хирургические инструменты и технологии Альянса. В него входят модифицированный лазерный резак, кровоостанавливающие губки, гибридные швы и памятка для врача."
ITEM.category = "Medical"
ITEM.price = 85

ITEM.width = 1
ITEM.height = 1
ITEM.useTime = 2
--ITEM.useSound = "LiteNetwork/hl2rp/eat.ogg"

ITEM.functions.Take = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(15)
		client:SetHealth( math.Clamp( HP + 100, 0, MaxHP ) )
		return true
	end,
}