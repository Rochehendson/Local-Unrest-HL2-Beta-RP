local PLUGIN = PLUGIN

PLUGIN.name = "Hint System"
PLUGIN.description = "Adds hints which might help you every now and then."
PLUGIN.author = "Riggs Mackay"
PLUGIN.schema = "Any"
PLUGIN.license = [[
Copyright 2022 Riggs Mackay

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
]]

ix.lang.AddTable("english", {
    optHints = "Toggle hints",
    optHintsSound = "Toggle hints Sound",
    optHintsDelay = "Hints delay",
    optdHints = "Wether or not hints should be shown.",
    optdHintsSound = "Wether or not hints should play a sound.",
    optdHintsDelay = "The delay between hints.",
})

ix.option.Add("hints", ix.type.bool, true, {
    category = "Hint System",
    default = true,
})

ix.option.Add("hintsSound", ix.type.bool, true, {
    category = "Hint System",
    default = true,
})

ix.option.Add("hintsDelay", ix.type.number, 300, {
    category = "Hint System",
    min = 30,
    max = 1800,
    decimals = 1,
    default = 300,
})

ix.hints = ix.hints or {}
ix.hints.stored = ix.hints.stored or {}

function ix.hints.Register(message)
    table.insert(ix.hints.stored, message)
end

ix.hints.Register("Пейте воду, вода - залог здоровья.")
ix.hints.Register("Скучно? Попробуй заговорить с кем-то или что-то спланировать!")
ix.hints.Register("Администрация тут чтобы помочь вам. Будьте уважительны и содействуйте им.")
ix.hints.Register("Бегать, прыгать и другие анти-социальные проступки могут повлечь за собой неприятные последствия.")
ix.hints.Register("Вас всегда подслушивают, говорите шепотом.")
ix.hints.Register("Жизнь блеклая без компании. Заведите себе знакомства.")
ix.hints.Register("Помни, ты играешь за персонажа, а не за себя.")
ix.hints.Register("У стен в городе есть глаза и уши.")
ix.hints.Register("Не докучайте Вселенскому Союзу, он захватил эту планету за 7 часов.")
ix.hints.Register("Частые нарушения могут повлечь голодовку или еще чего хуже.")
ix.hints.Register("Твое место на инспекционной фазе, это твоя комната, не забудь!")
ix.hints.Register("Если не можешь найти то место, куда тебе надо, попробуй спросить у кого-нибудь.")
ix.hints.Register("Доносите на своих друзей, чтобы получить уважение и социальный кредит.")
ix.hints.Register("Напиши // перед сообщением, чтобы сказать что-то в глобальный чат.")
ix.hints.Register("Подчиняйся Альянсу, это тебе пригодится.")
ix.hints.Register("Полиция охраняет цивилизованное общество, а не тебя.")
ix.hints.Register("Почему бы тебе не попробовать приготовить что-нибудь?")

if ( CLIENT ) then
    surface.CreateFont("HintFont", {
        font = "Arial",
        size = 20,
        weight = 500,
        blursize = 0.5,
        shadow = true,
    })
    
    local nextHint = 0
    local hintEndRender = 0
    local bInHint = false
    local hint = nil
    local hintShow = false
    local hintAlpha = 0
    function PLUGIN:HUDPaint()
        if not ( ix.option.Get("hints", true) ) then return end

        if ( nextHint < CurTime() ) then
            hint = ix.hints.stored[math.random(#ix.hints.stored)]
            nextHint = CurTime() + ( ix.option.Get("hintsDelay") or math.random(60,360) )
            hintShow = true
            hintEndRender = CurTime() + 15

            if ( ix.option.Get("hintsSound", true) ) then
                LocalPlayer():EmitSound("ui/hint.wav", 40, 100, 0.1)
            end
        end
    
        if not ( hint ) then return end
    
        if ( hintEndRender < CurTime() ) then
            hintShow = false
        end
    
        if ( hintShow == true ) then
            hintAlpha = Lerp(0.01, hintAlpha, 255)
        else
            hintAlpha = Lerp(0.01, hintAlpha, 0)
        end
        
        draw.DrawText(hint, "HintFont", ScrW() / 2, 0, ColorAlpha(color_white, hintAlpha), TEXT_ALIGN_CENTER)
    end
end