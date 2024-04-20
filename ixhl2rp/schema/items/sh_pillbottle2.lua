ITEM.name = "Ибупрофен"
ITEM.model = Model("models/willardnetworks/skills/medjar1.mdl")
ITEM.description = "Ибупрофен - это нестероидный противовоспалительный препарат (НПВП), который помогает облегчить боль, уменьшить воспаление и небольшую жару. Он эффективен при ряде состояний, включая головные боли, артрит и менструальные спазмы."
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
