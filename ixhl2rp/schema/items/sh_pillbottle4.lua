ITEM.name = "Антибиотики"
ITEM.model = Model("models/willardnetworks/skills/medjar3.mdl")
ITEM.description = "Антибиотики - это лекарства, которые убивают или подавляют рост бактерий. Они используются для лечения широкого спектра бактериальных инфекций, от инфекций мочевыводящих путей до кожных инфекций."
ITEM.category = "Medical"
ITEM.price = 10

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/medkit_pickup.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		--client:RestoreStamina(100)
		client:SetHealth( math.Clamp( HP - 5, 0, MaxHP ) )
		return true
	end,
}
