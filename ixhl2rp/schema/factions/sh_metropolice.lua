
FACTION.name = "Столичная Полиция"
FACTION.description = "Сотрудник, который через пот и кровь попал на престижную работу."
FACTION.color = Color(50, 100, 150)
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
FACTION.weapons = {"rappel_gear"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true
FACTION.runSounds = {[0] = "NPC_MetroPolice.RunFootstepLeft", [1] = "NPC_MetroPolice.RunFootstepRight"}
FACTION.includeNeeds = true
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true
function FACTION:OnCharacterCreated(client, character)
	local inventory = character:GetInventory()

	inventory:Add("stunstick", 1)
end

function FACTION:GetDefaultName(client)
	return "Metropolice Cadet G-2 - " .. Schema:ZeroNumber(math.random(1, 999), 3), true
end

function FACTION:OnTransferred(character)
	character:SetName(self:GetDefaultName())
end

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()

	if (!Schema:IsCombineRank(oldValue, "Cadet G-2") and Schema:IsCombineRank(value, "Cadet G-2")) then
		character:JoinClass(CLASS_MPR)

	elseif (!Schema:IsCombineRank(oldValue, "Metropolice Guard G-3") and Schema:IsCombineRank(value, "Metropolice Guard G-3")) then
	    character:JoinClass(CLASS_MPF)

	elseif (!Schema:IsCombineRank(oldValue, "Metropolice Officer G-2") and Schema:IsCombineRank(value, "Metropolice Officer G-2")) then
		--character:SetModel("models/policetrench.mdl")

	elseif (!Schema:IsCombineRank(oldValue, "Metropolice Officer G-1") and Schema:IsCombineRank(value, "Metropolice Officer G-1")) then
		character:JoinClass(CLASS_EMP)

		--character:SetModel("models/leet_police2.mdl")
	elseif (!Schema:IsCombineRank(oldValue, "Metropolice Dispatcher") and Schema:IsCombineRank(value, "Metropolice Dispatcher")) then
	    character:JoinClass(CLASS_DMP)
		--character:SetModel("models/eliteshockcp.mdl")

	elseif (!Schema:IsCombineRank(oldValue, "Metropolice Leader") and Schema:IsCombineRank(value, "Metropolice Leader")) then
	    character:JoinClass(CLASS_CMP)

	elseif (!Schema:IsCombineRank(oldValue, "SCN") and Schema:IsCombineRank(value, "SCN") 
	
	or !Schema:IsCombineRank(oldValue, "SHIELD") and Schema:IsCombineRank(value, "SHIELD")) then
		character:JoinClass(CLASS_MPS)
	end

end

FACTION_MPF = FACTION.index
