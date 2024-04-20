ITEM.name = "Парацетамол"
ITEM.model = Model("models/willardnetworks/skills/medjar.mdl")
ITEM.description = "Парацетамол, также известный как ацетаминофен, является широко используемым лекарством, отпускаемым без рецепта. Это анальгетик (обезболивающее средство) и жаропонижающее средство, которое помогает облегчить боль и снизить температуру. Он обычно используется при головных болях, мышечных болях и болях легкой и умеренной степени тяжести."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(25)
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
		return true
	end,
}
