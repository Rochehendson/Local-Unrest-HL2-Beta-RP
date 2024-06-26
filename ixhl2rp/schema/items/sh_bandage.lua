
ITEM.name = "Бинт"
ITEM.model = Model("models/stuff/bandages.mdl")
ITEM.description = "Небольшой рулон марли, сделанный своими руками."
ITEM.category = "Medical"
ITEM.price = 18

ITEM.functions.Apply = {
	sound = "CourragatedDawn/Xtra/C_24/Ambience/bandage_use.ogg",
	OnRun = function(itemTable)
		local client = itemTable.player
		local HP = client:Health()
		local MaxHP = client:GetMaxHealth()
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
	end
}