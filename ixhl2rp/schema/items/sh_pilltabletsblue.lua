ITEM.name = "Пироналкин Кальциума HG-1"
ITEM.model = Model("models/willardnetworks/skills/pills5.mdl")
ITEM.skin = 0
ITEM.description = "Эта усовершенствованная таблетка специально разработана для противодействия воздействию нервно-паралитических веществ, используемых в футуристических войнах или конфликтах. При приеме внутрь она быстро нейтрализует токсическое действие нервно-паралитических веществ, стабилизирует нервную систему жертвы и восстанавливает нормальные функции организма, обеспечивая быстрое и точное лечение в чрезвычайных ситуациях. Это жизненно важный инструмент для военнослужащих и служб экстренного реагирования в мире, где нервно-паралитические вещества представляют значительную угрозу."
ITEM.category = "Medical"
ITEM.price = 25

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