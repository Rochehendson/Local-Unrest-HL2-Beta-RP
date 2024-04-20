FACTION.name = "Синтеты"
FACTION.description = "Это - бесчуственные машины на органической основе."
FACTION.color = Color(140, 102, 98)
FACTION.models = {"models/icarus_anon.mdl"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false
FACTION.canSeeWaypoints = true
FACTION.canAddWaypoints = true
FACTION.canRemoveWaypoints = true
FACTION.canUpdateWaypoints = true

function FACTION:OnTransferred(character)
	
character:SetModel(self.models[1])
end

function FACTION:OnNameChanged(client, oldValue, value)
	local character = client:GetCharacter()
end

FACTION_SYNTH = FACTION.index