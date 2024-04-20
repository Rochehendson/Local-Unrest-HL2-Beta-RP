ITEM.name = "Таблетки Хлорида Натрия"
ITEM.model = Model("models/willardnetworks/skills/pills1.mdl")
ITEM.skin = 0
ITEM.description = "Таблетки хлорида натрия являются важным и безопасным медицинским средством, которое служит различным терапевтическим целям, особенно для поддержания баланса жидкости и электролитов в организме."
ITEM.category = "Medical"
ITEM.price = 35

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
		client:SetHealth( math.Clamp( HP + 5, 0, MaxHP ) )
		return true
	end,
}