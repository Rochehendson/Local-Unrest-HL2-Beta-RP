
FACTION.name = "Гражданский Инфекционный Контроль"
FACTION.description = "Гражданский Инфекционный Контроль занимается тем, чем обычный гражданин не займется даже если его заставят.."
FACTION.color = Color(255, 255, 0, 255)
FACTION.models = {
	"models/industrial_uniforms/industrial_uniform2.mdl",
	"models/industrial_uniforms/industrial_uniform.mdl",
	"models/hlvr/characters/worker/npc/worker_citizen.mdl",
	"models/hlvr/characters/hazmat_worker/npc/hazmat_worker_citizen.mdl"
}
FACTION.isDefault = false
FACTION.includeNeeds = true

function FACTION:OnCharacterCreated(client, character)
	local id = Schema:ZeroNumber(math.random(1, 99999), 5)
	local inventory = character:GetInventory()

	character:SetData("cid", id)

end

FACTION_CIC = FACTION.index
