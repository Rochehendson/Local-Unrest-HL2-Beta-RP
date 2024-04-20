ITEM.name = "Аспирин"
ITEM.model = Model("models/willardnetworks/skills/medjar2.mdl")
ITEM.description = "Аспирин является обезболивающим, противовоспалительным средством и разжижителем крови. Он используется для облегчения боли и уменьшения воспаления, а также может помочь предотвратить образование тромбов, что делает его ценным для людей с риском сердечных заболеваний."
ITEM.category = "Medical"
ITEM.price = 20

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(150)
		client:SetHealth( math.Clamp( HP + 5, 0, MaxHP ) )
		return true
	end,
}
