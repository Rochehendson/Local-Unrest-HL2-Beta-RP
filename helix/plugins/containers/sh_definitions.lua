--[[
	ix.container.Register(model, {
		name = "Crate",
		description = "A simple wooden create.",
		width = 4,
		height = 4,
		locksound = "",
		opensound = ""
	})
]]--

ix.container.Register("models/props_junk/wood_crate001a.mdl", {
	name = "Ящик",
	description = "Громоздкий ящик.",
	width = 6,
	height = 6,
})

ix.container.Register("models/props_c17/lockers001a.mdl", {
	name = "Шкафчики",
	description = "Белые шкафчики для одежды.",
	width = 4,
	height = 6,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001a.mdl", {
	name = "Металический шкаф",
	description = "Зеленый и огромный шкаф.",
	width = 6,
	height = 8,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001b.mdl", {
	name = "Металический шкаф",
	description = "Помятый, но все еще прочный зеленый шкаф.",
	width = 6,
	height = 8,
})

ix.container.Register("models/leak_props/props_lab/filecabinet02.mdl", {
	name = "Кабинет для документов",
	description = "В такой можно положить много бумаги... или пистолет.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_c17/furniturefridge001a.mdl", {
	name = "Холодильник",
	description = "Миниатюрный холодильник, в который мало что влезет.",
	width = 2,
	height = 4,
})

ix.container.Register("models/props_wasteland/kitchen_fridge001a.mdl", {
	name = "Огромный холодильник",
	description = "Огромный холодильник, такой редко где можно встретить.",
	width = 4,
	height = 6,
})

ix.container.Register("models/props_junk/trashbin01a.mdl", {
	name = "Мусорка",
	description = "Ты собираешься тут что-то искать?",
	width = 2,
	height = 2,
})

ix.container.Register("models/props_junk/trashdumpster01a.mdl", {
	name = "Помойка",
	description = "Воняет, изначально подразумевалась как перевалочный пункт для мусора.",
	width = 6,
	height = 3
})

ix.container.Register("models/items/ammocrate_smg1.mdl", {
	name = "Ящик для патрон",
	description = "Тут должна лежать аммуниция, но не всегда.",
	width = 5,
	height = 3,
	OnOpen = function(entity, activator)
		local closeSeq = entity:LookupSequence("Close")
		entity:ResetSequence(closeSeq)

		timer.Simple(2, function()
			if (entity and IsValid(entity)) then
				local openSeq = entity:LookupSequence("Open")
				entity:ResetSequence(openSeq)
			end
		end)
	end
})

ix.container.Register("models/props_forest/footlocker01_closed.mdl", {
	name = "Сундук",
	description = "Маленький сундук, в котором можно прятать свои пожитки.",
	width = 5,
	height = 3
})

ix.container.Register("models/Items/item_item_crate.mdl", {
	name = "Item Crate",
	description = "A crate to store some belongings in.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_c17/cashregister01a.mdl", {
	name = "Касса",
	description = "Старая механическая касса с шухлядкой внутри.",
	width = 2,
	height = 1
})
