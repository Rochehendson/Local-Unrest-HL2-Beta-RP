ITEM.name = "Таблетки замены памяти Tz8111"
ITEM.model = Model("models/willardnetworks/skills/radxbos.mdl")
ITEM.description = "Удаляет и заменяет воспоминания о последних нескольких часах или днях из памяти граждан. Чем больше таблеток, тем больше стирается. Превышение верхнего порога употребления поместит пациента в вегетативное состояние."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 1, 0, MaxHP ) )
		return true
	end,
}
