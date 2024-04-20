ITEM.name = "Пакет для переливания крови"
ITEM.model = Model("models/willardnetworks/skills/bloodbag.mdl")
ITEM.description = "Пакет с надписью 'ГЕМОГЕНИЧЕСКИЙ ПАКЕТ ГЛОБАЛЬНОЙ СОВМЕСТИМОСТИ', который был создан для безопасного и эффективного переливания крови и других жизненно важных жидкостей при неотложной медицинской помощи на поздних стадиях."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP + 25, 0, MaxHP ) )
		return true
	end,
}
