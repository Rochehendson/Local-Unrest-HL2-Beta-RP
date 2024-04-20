ITEM.name = "Таблетки Пазорантина P-49"
ITEM.model = Model("models/willardnetworks/skills/pills4.mdl")
ITEM.skin = 0
ITEM.description = "Эти редкие, невидимые таблетки являются мощными нанитовыми ускорителями, используемыми в чрезвычайных ситуациях, их всего несколько партий когда-либо поставлялось в город, и обычно они предназначены для ГСР, Лоялистов или Гражданской Обороны."
ITEM.category = "Medical"
ITEM.price = 280

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
		client:SetHealth( math.Clamp( HP + 200, 0, MaxHP ) )
		return true
	end,
}