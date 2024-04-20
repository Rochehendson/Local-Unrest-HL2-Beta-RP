ITEM.name = "Антикоагулянт"
ITEM.model = Model("models/willardnetworks/skills/medjar4.mdl")
ITEM.description = "Антикоагулянты, такие как варфарин, помогают предотвратить образование тромбов, снижая риск таких заболеваний, как тромбоз глубоких вен и инсульт."
ITEM.category = "Medical"
ITEM.price = 15

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(150)
		client:SetHealth( math.Clamp( HP + 15, 0, MaxHP ) )
		return true
	end,
}
