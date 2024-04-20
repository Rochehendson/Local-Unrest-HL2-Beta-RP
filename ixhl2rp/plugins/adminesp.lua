PLUGIN.name = "Miscellaneous"
PLUGIN.author = "ZeMysticalTaco"
PLUGIN.description = "Cool things such as auto-grenade callouts."
PLUGIN.SaveEnts = PLUGIN.SaveEnts or {}
--skinny bars are disgusting

--[[-------------------------------------------------------------------------
	BETTER ADMIN ESP
---------------------------------------------------------------------------]]
local dimDistance = -1
	local aimLength = 128
ix.option.Add("itemESP", ix.type.bool, true)

	function PLUGIN:HUDPaint()
		local client = LocalPlayer()

		if (client:IsAdmin() and client:GetMoveType() == MOVETYPE_NOCLIP and not client:InVehicle() and ix.option.Get("observerESP", true)) then
			local scrW, scrH = ScrW(), ScrH()

			if ix.option.Get("itemESP") then
				for k, v in pairs(ents.GetAll()) do
					if v:GetClass() == "ix_item" then
						local espcol = Color(255,255,255,255)
						local screenPosition = v:GetPos():ToScreen()
						local marginX, marginY = scrH * .1, scrH * .1
						local x2, y2 = math.Clamp(screenPosition.x, marginX, scrW - marginX), math.Clamp(screenPosition.y, marginY, scrH - marginY)
						local distance = client:GetPos():Distance(v:GetPos())
						local factor = 1 - math.Clamp(distance / dimDistance, 0, 1)
						local size2 = math.max(10, 32 * factor)
						local alpha2 = math.max(255 * factor, 80)
						local itemTable = v:GetItemTable()
						local espcols = {
							["Weapons"] = Color(255,50,50),
							["Ammunition"] = Color(155,50,50),
							["Food"] = Color(100,255,100),
							["Crafting"] = Color(150,200,50),
							["Clothes"] = Color(65,200,150),
							["Attachments"] = Color(50,255,175),
							["Survival"] = Color(50,255,175)

						}

						for k2, v2 in pairs(espcols) do
							if itemTable.category == k2 then
								espcol = v2
							end
						end
						ix.util.DrawText(itemTable.name, x2, y2 - size2, espcol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha2)
						--ix.util.DrawText(itemTable.category, x2, y2 - size2 + 15, espcol, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha2)
					end
				end
			end

			for _, v in ipairs(player.GetAll()) do
				if (v == client or not v:GetCharacter()) then continue end
				local screenPosition = v:GetPos():ToScreen()
				local marginX, marginY = scrH * .1, scrH * .1
				local x, y = math.Clamp(screenPosition.x, marginX, scrW - marginX), math.Clamp(screenPosition.y, marginY, scrH - marginY)
				local teamColor = team.GetColor(v:Team())
				local distance = client:GetPos():Distance(v:GetPos())
				local factor = 1 - math.Clamp(distance / dimDistance, 0, 1)
				local size = math.max(10, 32 * factor)
				local alpha = math.max(255 * factor, 80)
				surface.SetDrawColor(teamColor.r, teamColor.g, teamColor.b, alpha)
				surface.SetFont("ixGenericFont")
				local text = v:Name()

				--tables are for faggots.
				if not v.status then
					v.status = "user"
				elseif v:IsUserGroup("superadmin") then
					v.status = "SA"
				elseif v:IsUserGroup("admin") then
					v.status = "A"
				elseif v:IsUserGroup("operator") then
					v.status = "O"
				elseif v:IsUserGroup("user") then
					v.status = "user"
				elseif v:IsUserGroup("producer") then
					v.status = "producer"
				else
					v.status = v:GetUserGroup()
				end

				local text2 = v:SteamName() .. "[" .. v.status .. "]"
				local text3 = "H: " .. v:Health() .. " A: " .. v:Armor()
				local text4 = v:GetActiveWeapon().PrintName
				surface.SetDrawColor(teamColor.r * 1.6, teamColor.g * 1.6, teamColor.b * 1.6, alpha)
				local col = Color(255, 255, 255, 255)

				if v:IsWepRaised() then
					col = Color(255, 100, 100, 255)
				end

				ix.util.DrawText(text, x, y - size, ColorAlpha(teamColor, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
				ix.util.DrawText(text2, x, y - size + 20, Color(200, 200, 200, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
				ix.util.DrawText(text3, x, y - size + 40, Color(200, 200, 200, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
				ix.util.DrawText(text4, x, y - size + 60, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
			end
		end
	end

local playerMeta = FindMetaTable("Player")

--[[-------------------------------------------------------------------------
	playerMeta:GetItemWeapon()

	Purpose: Checks the player's currently equipped weapon and returns the item and weapon.
	Syntax: player:GetItemWeapon()
	Returns: @weapon, @item
---------------------------------------------------------------------------]]

function playerMeta:GetItemWeapon()
	local char = self:GetCharacter()
	local inv = char:GetInventory()
	local items = inv:GetItems()
	local weapon = self:GetActiveWeapon()

	for k, v in pairs(items) do
		if v.class then
			if v.class == weapon:GetClass() then
				if v:GetData("equip", false) then
					return weapon, v
				else
					return false
				end
			end
		end
	end
end

function playerMeta:IsCombineCommand()
	return Schema:IsCombineRank(self:Name(), "CL") or Schema:IsCombineRank(self:Name(), "RL")
end

function PLUGIN:ScalePlayerDamage(player, hitGroup, damageInfo)
	--no instakill melee weapons pls
	if string.find(damageInfo:GetAttacker():GetActiveWeapon():GetClass(), "hl2") then
		damageInfo:SetDamageType(DMG_CRUSH)
	end
	if (not damageInfo:IsFallDamage() and not damageInfo:IsDamageType(DMG_CRUSH) and damageInfo:IsBulletDamage()) then
		if (hitGroup == HITGROUP_HEAD) then
			damageInfo:ScaleDamage(5)
		elseif (hitGroup == HITGROUP_CHEST or hitGroup == HITGROUP_GENERIC) then
			damageInfo:ScaleDamage(1)
		elseif (hitGroup == HITGROUP_LEFTARM or hitGroup == HITGROUP_RIGHTARM or hitGroup == HITGROUP_LEFTLEG or hitGroup == HITGROUP_RIGHTLEG or hitGroup == HITGROUP_GEAR) then
			damageInfo:ScaleDamage(3)
		end
	end
end
