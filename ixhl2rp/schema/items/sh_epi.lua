ITEM.name = "Адреналиновый инжектор"
ITEM.model = Model("models/willardnetworks/skills/adrenaline.mdl")
ITEM.skin = 0
ITEM.description = "Этот инжкетор содержит адреналин, который быстро устраняет тяжелые аллергические реакции (анафилаксию). Это спасательное средство для людей с тяжелой аллергией на такие вещества, как арахис или укусы хедкрабов."
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
		client:SetHealth( math.Clamp( HP + 50, 0, MaxHP ) )
		return true
	end,
}