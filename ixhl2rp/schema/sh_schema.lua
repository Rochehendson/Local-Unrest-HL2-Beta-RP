
Schema.name = "Local Unrest | Half Life 2 Beta"
Schema.author = "Roche Hendson"
Schema.description = "Истинный гражданин знает что работа, это противоположность рабству."

-- Include netstream
ix.util.Include("libs/thirdparty/sh_netstream2.lua")

ix.util.Include("sh_configs.lua")
ix.util.Include("sh_commands.lua")

ix.util.Include("cl_schema.lua")
ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sh_voices.lua")
ix.util.Include("sv_schema.lua")
ix.util.Include("sv_hooks.lua")

ix.util.Include("meta/sh_player.lua")
ix.util.Include("meta/sv_player.lua")
ix.util.Include("meta/sh_character.lua")

ix.flag.Add("v", "Access to light blackmarket goods.")
ix.flag.Add("V", "Access to heavy blackmarket goods.")

ix.anim.SetModelClass("models/cppackredux/groundunits/betaunit_lead.mdl", "metrocop")
ix.anim.SetModelClass("models/cppackredux/groundunits/betaunit_sentinel.mdl", "metrocop")
ix.anim.SetModelClass("models/cppackredux/groundunits/betaunit_shockjock.mdl", "metrocop")
ix.anim.SetModelClass("models/cppackredux/groundunits/betaunit_standard.mdl", "metrocop")
ix.anim.SetModelClass("models/cppackredux/trenchcoatunits/betatrenchcoat_old.mdl", "metrocop")
ix.anim.SetModelClass("models/cppackredux/trenchcoatunits/concept_unit.mdl", "metrocop")
ix.anim.SetModelClass("models/cppackredux/trenchcoatunits/trench_sentinel.mdl", "metrocop")
ix.anim.SetModelClass("models/cppackredux/trenchcoatunits/trench_shockjock.mdl", "metrocop")

ix.anim.SetModelClass("models/synth/elite_brown.mdl", "overwatch")
ix.anim.SetModelClass("models/synth/elite_green.mdl", "overwatch")
ix.anim.SetModelClass("models/npc/airex_combine/combine_airex.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_betaelite.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_betagunner.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_betagunner2.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_betasoldier.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_betasoldier2.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_guardelite.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_guardgunner.mdl", "overwatch")
ix.anim.SetModelClass("models/cppackredux/overwatch/combine_guardsoldier.mdl", "overwatch")
ix.anim.SetModelClass("models/schwarzkruppzo/player/assassin.mdl", "player")
ix.anim.SetModelClass("models/assaslek/player/assaslek.mdl", "player")
ix.anim.SetModelClass("models/willardnetworks/vortigaunt.mdl", "vortigaunt")

ALWAYS_RAISED["swep_assaslek"] = true

function Schema:ZeroNumber(number, length)
	local amount = math.max(0, length - string.len(number))
	return string.rep("0", amount)..tostring(number)
end

function Schema:IsCombineRank(text, rank)
	return string.find(text, "[%D+]"..rank.."[%D+]")
end

do
	local CLASS = {}
	CLASS.color = Color(150, 100, 100)
	CLASS.format = "Звуки цитадели произносят \"%s\""

	function CLASS:CanSay(speaker, text)
		if (!speaker:IsDispatch()) then
			speaker:NotifyLocalized("notAllowed")

			return false
		end
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, text))
	end

	ix.chat.Register("dispatch", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(75, 150, 50)
	CLASS.format = "%s передает \"%s\""

	function CLASS:CanHear(speaker, listener)
		local character = listener:GetCharacter()
		local inventory = character:GetInventory()
		local bHasRadio = false

		for k, v in pairs(inventory:GetItemsByUniqueID("handheld_radio", true)) do
			if (v:GetData("enabled", false) and speaker:GetCharacter():GetData("frequency") == character:GetData("frequency")) then
				bHasRadio = true
				break
			end
		end

		return bHasRadio
	end

	function CLASS:OnChatAdd(speaker, text)
		text = speaker:IsCombine() and string.format("<:: %s ::>", text) or text
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("radio", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(255, 255, 175)
	CLASS.format = "%s передает \"%s\""

	function CLASS:GetColor(speaker, text)
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			return Color(175, 255, 175)
		end

		return self.color
	end

	function CLASS:CanHear(speaker, listener)
		if (ix.chat.classes.radio:CanHear(speaker, listener)) then
			return false
		end

		local chatRange = ix.config.Get("chatRange", 280)

		return (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange)
	end

	function CLASS:OnChatAdd(speaker, text)
		text = speaker:IsCombine() and string.format("<:: %s ::>", text) or text
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("radio_eavesdrop", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(175, 125, 100)
	CLASS.format = "%s запрашивает \"%s\""

	function CLASS:CanHear(speaker, listener)
		return listener:IsCombine() or speaker:Team() == FACTION_ADMIN
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("request", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(175, 125, 100)
	CLASS.format = "%s запрашивает \"%s\""

	function CLASS:CanHear(speaker, listener)
		if (ix.chat.classes.request:CanHear(speaker, listener)) then
			return false
		end

		local chatRange = ix.config.Get("chatRange", 280)

		return (speaker:Team() == FACTION_CITIZEN and listener:Team() == FACTION_CITIZEN)
		and (speaker:GetPos() - listener:GetPos()):LengthSqr() <= (chatRange * chatRange)
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("request_eavesdrop", CLASS)
end

do
	local CLASS = {}
	CLASS.color = Color(150, 125, 175)
	CLASS.format = "%s объявляет \"%s\""

	function CLASS:CanSay(speaker, text)
		if (speaker:Team() != FACTION_ADMIN) then
			speaker:NotifyLocalized("notAllowed")

			return false
		end
	end

	function CLASS:OnChatAdd(speaker, text)
		chat.AddText(self.color, string.format(self.format, speaker:Name(), text))
	end

	ix.chat.Register("broadcast", CLASS)
end
