local PLUGIN = PLUGIN

PLUGIN.name = "Spawn Notifications"
PLUGIN.description = "A notification which tells the player their status on loading the character."
PLUGIN.author = "Riggs Mackay"
PLUGIN.schema = "Any"
PLUGIN.license = [[
Copyright 2022 Riggs Mackay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

-- Feel free to change any of these messages.
local wakeupmessages = {
    "Зеленые молнии сверкают в небе, звух хора вортигонтов заставляет тебя проснутся.",
    "Звуки стрельбы и эхо Семи-Часовой войны напоминают о себе из прошлого. Ты просыпаешься в поту.",
    "Звуки громкого марша заставляют тебя встать. Ты просыпаешься сонным.",
    "Звук грозы и яркий зеленый свет заставляет тебя открыть свои глаза.",
    "У тебя был кошмар, ты просыпаешься от того, что тебя преследовала тварь из Зена.",
    "Ты слышишь шепот, после чего слышишь громкий топот солдат, который удалялся от тебя, ты просыпаешься в испуге.",
    "Зеленая молния летит по небу, пока ты смотришь на проглядывающие порталы в облаках.",
    "Ты услышал свою семью и увидел как все стало хорошо.. Но потом ты открыл глаза.",
    "Ты просыпаешься от шумного вертолета, который пролетал над городом.",
    "Ты слышишь рычание и просыпаешься, испугавшись.",
    "Ты услышал громкую сирену, которая разбудила тебя.",
    "Звуки артиллерии и паники солдат из прошлого, заставляют тебя проснутся.",
    "Звук гудка корабля приближался к тебе и будит тебя, ты вспотел.",
    "Тебе приснилась сирена красного кода, ты проснулся в испуге.",
    "Тебе ничего не приснилось, ты выпался, впервые за этот месяц.",
    "Ты встаешь от неожиданного звука очередного Зен-портала.",
    "Тебе послышался звук от собаки с тремя ногами, ты проснулся.",
}

function PLUGIN:PlayerSpawn(ply)
    if not ( ply:IsValid() or ply:Alive() or ply:GetCharacter() ) then return end

    ply:ConCommand("play ambient/levels/city/citadel_cloudhit3.wav")
    ply:ScreenFade(SCREENFADE.IN, color_black, 3, 2)
    ply:ChatPrint(table.Random(wakeupmessages))
end
