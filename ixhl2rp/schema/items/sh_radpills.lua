ITEM.name = "Антирад-капсулы GH-3"
ITEM.model = Model("models/willardnetworks/skills/radx.mdl")
ITEM.description = "Эти усовершенствованные капсулы предназначены для защиты людей от вредного воздействия радиации в суровых условиях. При приеме внутрь они высвобождают уникальную смесь наноматериалов и антиоксидантов, которые связываются с радиоактивными частицами, уменьшая их воздействие на организм. Они также содержат радиозащитные соединения, которые помогают восстанавливать вызванные радиацией повреждения на клеточном уровне. Эти капсулы являются жизненно важной защитой от смертельного воздействия радиации в мире, где радиация представляет постоянную угрозу."

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
