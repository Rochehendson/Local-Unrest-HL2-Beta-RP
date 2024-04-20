
FACTION.name = "Вортигонты"
FACTION.description = "Мудрые и скрытные твари из Зена, которые могут крайне пригодится, когда будут освобождены от оков."
FACTION.color = Color(28, 148, 104, 255)
FACTION.models = {"models/willardnetworks/vortigaunt.mdl"}
FACTION.weapons = {"swep_vortigaunt_beam_edit", "swep_vortigaunt_heal"}
FACTION.isDefault = false
FACTION.isGloballyRecognized = false

function FACTION:OnTransfered(client)
	local character = client:GetCharacter()

	character:SetModel(self.models[1])
end

FACTION_FREEVORT = FACTION.index
