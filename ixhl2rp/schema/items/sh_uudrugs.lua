ITEM.name = "Эвфороновые Добавки"
ITEM.model = Model("models/willardnetworks/skills/daytripper.mdl")
ITEM.description = "Банка среднего размера, наполненная всевозможными одобренными Альянсом лекарствами и вкусностями, включая косяки, другие психотропные средства и так далее. Никаких насильственных веществ, как и должно быть."
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
