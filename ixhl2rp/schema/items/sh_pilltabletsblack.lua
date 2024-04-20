ITEM.name = "Капсулы с активированным углем AAc-3"
ITEM.model = Model("models/willardnetworks/skills/pills8.mdl")
ITEM.skin = 0
ITEM.description = "Эти высокотехнологичные капсулы содержат активированный уголь, полученный из передовых биоинженерных материалов. При приеме внутрь они быстро поглощают и нейтрализуют широкий спектр токсинов, ядов и вредных веществ. В дополнение к детоксикации, эти капсулы обладают уникальной способностью выявлять и нейтрализовывать чужеродные или неизвестные токсины, обычно встречающиеся в Пустоши и за ее пределами. Они являются важным инструментом для исследователей Запределья и поселенцев, имеющих дело с незнакомой средой и потенциальными опасностями."
ITEM.category = "Medical"
ITEM.price = 8

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
		client:SetHealth( math.Clamp( HP + 10, 0, MaxHP ) )
		return true
	end,
}