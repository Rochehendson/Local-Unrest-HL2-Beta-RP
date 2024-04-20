
FACTION.name = "Граждане"
FACTION.description = "Обычный гражданин рабочего класса."
FACTION.color = Color(150, 125, 100, 255)
FACTION.models = {
	"models/humans/pandafishizens/male_09.mdl",
	"models/humans/pandafishizens/male_08.mdl",
	"models/humans/pandafishizens/male_10.mdl",
	"models/humans/pandafishizens/male_07.mdl",
	"models/humans/pandafishizens/male_06.mdl",
	"models/humans/pandafishizens/male_05.mdl",
	"models/humans/pandafishizens/male_01.mdl",
	"models/humans/pandafishizens/male_02.mdl",
	"models/humans/pandafishizens/male_03.mdl",
	"models/humans/pandafishizens/male_04.mdl",
	"models/humans/pandafishizens/female_01.mdl",
	"models/humans/pandafishizens/female_02.mdl",
	"models/humans/pandafishizens/female_03.mdl",
	"models/humans/pandafishizens/female_04.mdl",
	"models/humans/pandafishizens/female_06.mdl",
    "models/humans/pandafishizens/female_17.mdl",
    "models/humans/pandafishizens/female_24.mdl"
}
FACTION.isDefault = true
FACTION.includeNeeds = true

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

	inventory:Add("suitcase", 1)
    inventory:Add("respirator", 1)
end
FACTION.includeNeeds = true
FACTION_CITIZEN = FACTION.index
