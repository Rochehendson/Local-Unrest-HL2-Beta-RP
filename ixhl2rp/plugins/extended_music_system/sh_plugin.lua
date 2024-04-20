local PLUGIN = PLUGIN

PLUGIN.name = "Extended Music System"
PLUGIN.description = "An extended music system ported from CC with some tweaks"
PLUGIN.author = "Ceryx"

ix.lang.AddTable("english", {
	ambient_music = "Ambient Music",

	optMusicVol = "Music Volume",
	optdMusicVol = "Choose your preferred volume of the ambient music"
})

CAMI.RegisterPrivilege({
	Name = "Helix - Music Player",
	MinAccess = "admin"
})

ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_hooks.lua")

ix.option.Add("musicVol", ix.type.number, 50, {
	category = "ambient_music",
	min = 0,
	max = 100,
	decimals = 0,
	OnChanged = function(oldValue, value)
		if (Schema.MusicPatch) then
			if (value == 0) then
				Schema:FadeOutMusic()
			else
				Schema.MusicPatch:ChangeVolume(value / 100)
			end
		end
	end
})

MUSIC_NOPLAY = 0
MUSIC_MENU = 1
MUSIC_AMBIENT = 2
MUSIC_COMBAT = 3
MUSIC_STINGER = 4

ix.Music = {

	{ "courragateddawn/startup/hl2_e3_trailer_music_p1.wav", 50, MUSIC_MENU, "M1" },
	{ "courragateddawn/startup/hl2_e3_trailer_music_p2.wav", 50, MUSIC_MENU, "M2" },
	{ "music/hl1_song11.mp3", 70, MUSIC_NOPLAY, "Hazardous Environments" },
	{ "music/hl2_song23_suitsong3.mp3", 70, MUSIC_NOPLAY, "Triage At Dawn" },
	{ "courragateddawn/music_hlop/half-life01.ogg", 30, MUSIC_AMBIENT, "A1" },
	{ "courragateddawn/music_hlop/half-life03.ogg", 30, MUSIC_AMBIENT, "A2" },
	{ "courragateddawn/music_hlop/half-life12.ogg", 30, MUSIC_AMBIENT, "A3" },
	{ "courragateddawn/music_hlop/half-life15.ogg", 30, MUSIC_AMBIENT, "A5" },
	{ "courragateddawn/music_hlop/half-life16.ogg", 30, MUSIC_AMBIENT, "A4" },
	{ "courragateddawn/xtra/music/vance/vance_02.ogg", 30, MUSIC_AMBIENT, "A6" },
	{ "courragateddawn/xtra/music/vance/vance_03.ogg", 30, MUSIC_AMBIENT, "A7" },
	{ "	courragateddawn/xtra/music/vance/vance_04.ogg", 30, MUSIC_AMBIENT, "A8" },
	{ "courragateddawn/music_hlop/half-life02.ogg", 30, MUSIC_COMBAT, "C1" },
	{ "courragateddawn/music_hlop/half-life05.ogg", 30, MUSIC_COMBAT, "C2" },
	{ "courragateddawn/music_hlop/half-life07.ogg", 30, MUSIC_COMBAT, "C3" },
	{ "courragateddawn/xtra/music/vance/vance_01.ogg", 30, MUSIC_COMBAT, "C4" },
	{ "courragateddawn/xtra/music/vance/vance_05.ogg", 30, MUSIC_COMBAT, "C4" },
	{ "courragateddawn/music_hlop/prospero01.ogg", 30, MUSIC_STINGER, "S1" },
	{ "courragateddawn/music_hlop/prospero02.ogg", 30, MUSIC_STINGER, "S2" }

}

function Schema:GetSongDuration(path)
	for _, v in pairs(ix.Music) do
		if (string.lower(v[1]) == string.lower(path)) then return v[2] end
	end

	return 0
end

function Schema:GetSongList(e)
	local tab = {}

	for _, v in pairs(ix.Music) do
		if (v[3] == e) then
			table.insert(tab, v[1])
		end
	end

	return tab
end

function Schema:GetSongName(e)
	for _, v in pairs(ix.Music) do
		if (v[1] == e) then return v[4] end
	end
end

function Schema:GetSongLength(e)
	for _, v in pairs(ix.Music) do
		if (v[1] == e) then return v[2] end
	end
end