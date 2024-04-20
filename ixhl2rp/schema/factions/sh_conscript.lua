
FACTION.name = "Призывная Армия"
FACTION.description = "Добровольная Армия Альянса. Раньше, тут служили солдаты Армии США, теперь, тут чаще встретишь гражданских, которые пошли служить по контракту."
FACTION.color = Color(84, 83, 32, 255)
FACTION.weapons = {"ix_stunstick", "rappel_gear"}
FACTION.isDefault = false
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
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}
FACTION.includeNeeds = true

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

	inventory:Add("cid", 1, {
		name = character:GetName(),
		id = id
	})
end

FACTION_CONSCRIPT = FACTION.index
