ITEM.name = "Инъектор морфина"
ITEM.model = Model("models/willardnetworks/skills/medx.mdl")
ITEM.skin = 0
ITEM.description = "Инъектор морфина, улучшенный технологиями Альянса, так что теперь это еще более мощный наркотик!"
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
		client:SetHealth( math.Clamp( HP + 30, 0, MaxHP ) )
		return true
	end,
}