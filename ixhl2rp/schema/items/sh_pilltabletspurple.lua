ITEM.name = "Таблетки для нейролиза CM-3"
ITEM.model = Model("models/willardnetworks/skills/pills6.mdl")
ITEM.skin = 0
ITEM.description = "Эти редкие таблетки могут стимулировать мозговую активность у умерших, если их ввести через несколько мгновений после смерти. Используются редко, но мощно и эффективно используются Гражданской Обороной в зловещих целях."
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