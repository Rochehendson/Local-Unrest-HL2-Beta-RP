ITEM.name = "Хлеб"
ITEM.model = "models/bioshockinfinite/dread_loaf.mdl"
ITEM.category = "Consumables"
ITEM.description = "Буханка хлеба, приготовленная из синтезированной муки и прочих ингредиентов, не включаемых в состав. Его лучше нарезать."
ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav"
ITEM.RestoreSaturation = 0
ITEM.RestoreSatiety =  60
ITEM.returnItems = {}
ITEM.remaining = 6

function ITEM:OnInstanced(invID, x, y, item)
	if item then
		item:SetData("remaining", item.RemainingDefault)
	end
end

if (CLIENT) then
	function ITEM:PopulateTooltip(tooltip)
		local panel = tooltip:AddRowAfter( "name", "remaining" )
		panel:SetBackgroundColor( Color(75, 50, 50) )
		panel:SetText( "Осталось частей: " .. self:GetData("remaining", 2) )
		panel:SetFont("BudgetLabel")
		panel:SizeToContents()
	end
end

ITEM.functions.Consume = {
	name = "Съесть",
	tip = "useTip",
	icon = "icon16/arrow_right.png",
	OnRun = function( item )
		local client = item.player
		local char = client:GetCharacter()

		if istable( item.useSound ) then
			ix.util.EmitQueuedSounds( client, item.useSound, 0, 0.1, 70, 100)
		else
			client:EmitSound( item.useSound, 70 )
		end

		if istable( item.returnItems ) then
			for _, v in ipairs( item.returnItems ) do
				char:GetInventory():Add( v )
			end
		else
			char:GetInventory():Add( item.returnItems )
		end

		if (item.RestoreSaturation) then
			char:RestoreSaturation( item.RestoreSaturation/item:GetData("remaining", 2) )
        end

        if (item.RestoreSatiety) then
			char:RestoreSatiety( item.RestoreSatiety/item:GetData("remaining", 2) )
        end

		item:SetData("remaining", item:GetData("remaining", 2) - 1)

		if item:GetData("remaining", 2) <= 0 then
			return true
		end

		return false
	end,
	OnCanRun = function(item)
		local factionTable = ix.faction.indices[item.player:Team()] or {}
		return (factionTable.includeNeeds or false)
	end
}