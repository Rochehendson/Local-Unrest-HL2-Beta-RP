
FACTION.name = "Спецназ"
FACTION.description = "Крайне модифицированные солдаты столичного спецназа. Элитные бойцы."
FACTION.color = Color(150, 50, 50, 255)
FACTION.weapons = {"rappel_gear"}
FACTION.models = {"models/combine_soldier.mdl"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = true
FACTION.runSounds = {[0] = "NPC_CombineS.RunFootstepLeft", [1] = "NPC_CombineS.RunFootstepRight"}
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true
function FACTION:GetDefaultName(client)
	return "MpSF Trooper Unit G-3 - " .. Schema:ZeroNumber(math.random(1, 999), 3), true
end

function FACTION:OnTransferred(character)
	character:SetName(self:GetDefaultName())
	character:SetModel(self.models[1])
end

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()

	if (!Schema:IsCombineRank(oldValue, "Trooper Unit G-3") and Schema:IsCombineRank(value, "Trooper Unit G-3")) then
		character:JoinClass(CLASS_OWS)
	elseif (!Schema:IsCombineRank(oldValue, "MpSF Commander Unit ") and Schema:IsCombineRank(value, "MpSF Commander Unit")) then
		character:JoinClass(CLASS_EOW)
	end
end

FACTION_OTA = FACTION.index
