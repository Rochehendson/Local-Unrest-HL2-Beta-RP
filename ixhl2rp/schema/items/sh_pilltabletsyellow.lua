ITEM.name = "Нанитовые таблетки CM-2"
ITEM.model = Model("models/willardnetworks/skills/pills3.mdl")
ITEM.skin = 0
ITEM.description = "Эти редкие таблетки на самом деле не таблетки, а небольшие кластеры, содержащие высокоточные наниты, которые часто используются для лечения телесных повреждений средней и тяжелой степени тяжести. Безопаснее, чем био-инъекторы. Также не вызывает рака!"
ITEM.category = "Medical"
ITEM.price = 85

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
		client:SetHealth( math.Clamp( HP + 50, 0, MaxHP ) )
		return true
	end,
}