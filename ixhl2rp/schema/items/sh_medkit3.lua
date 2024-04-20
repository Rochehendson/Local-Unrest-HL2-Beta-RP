ITEM.name = "Травматологический набор"
ITEM.model = Model("models/willardnetworks/skills/medkit.mdl")
ITEM.skin = 0
ITEM.description = "Высокомодифицированная медицинская аптечка, предназначенная для медицинских команд Альянса. Она включает в себя медицинский инъектор, биометрический сканер, лазерный хирургический резак , гемостатик, модуль оценки здоровья и три кровоостанавливающих бинта, воплощая эффективный и стандартизированный подход Альянса к медицинскому реагированию в своем мире."
ITEM.category = "Medical"
ITEM.price = 100

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