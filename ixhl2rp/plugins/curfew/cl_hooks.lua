local PLUGIN = PLUGIN

local sW = ScrW()
function PLUGIN:HUDPaint()
  local font = "Trebuchet24"

  -- Compatibility with one of my other plugins
    font = "BetaHud"


  if ( LocalPlayer():IsCombine() ) then
    draw.SimpleText( self:GetTimeFormatted(), font, sW/2, 5, Color(255, 153, 51, 180), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
    draw.SimpleText( "Расписание: " .. self:GetSchedule(), font, sW/2, 30,  Color(255, 153, 51, 180), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP )
  end
end

-- Don't know who would change their screen size while in game but you never know
function PLUGIN:OnScreenSizeChanged()
  sW = ScrW()
end