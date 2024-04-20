ITEM.name = "Циталофрам HX Mk.2"
ITEM.model = Model("models/willardnetworks/skills/pill_bottle.mdl")
ITEM.skin = 0
ITEM.description = "Насильно улучшенные таблетки созданные 'заставлять' граждан радоваться, употребляя их в качестве обычного анти-депресанта, но теперь в сочетании со здоровой дозой подсознательных мысленных образов и нейронных связей."
ITEM.category = "Medical"
ITEM.price = 35

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