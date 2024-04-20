AddCSLuaFile()
ENT.Base = "base_anim"
ENT.Type = "anim"
ENT.PrintName = "Ration"
ENT.Category = "Ration Production"
ENT.Spawnable = false
ENT.AdminOnly = true
ENT.bNoPersist = true

function ENT:PostEntityPaste(ply, ent, tab)
    ent:Remove()
end

function ENT:SetupDataTables()
    self:NetworkVar("Bool", 0, "Painted")
    self:NetworkVar("Bool", 1, "Ready")
end

function ENT:Initialize()
    if (CLIENT) then return end
    self:SetModel("models/willardnetworks/rations/wn_new_ration.mdl")
    self:SetSolid(SOLID_VPHYSICS)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetUseType(SIMPLE_USE)
    local phys = self:GetPhysicsObject()

    if (phys and phys:IsValid()) then
        phys:Wake()
    end
end

if (CLIENT) then
    ENT.PopulateEntityInfo = true

    function ENT:OnPopulateEntityInfo(ration)

        local statusTitle = "Белый пакет"
        local statusDescription = "Стоит вставить этот пакет в покрасчик"

        if (self:GetPainted()) then
            statusTitle = "Крашеный рацион"
            statusDescription = "Похоже его надо упаковать"
        elseif (self:GetReady()) then
            statusTitle = "Упакованый рацион"
            statusDescription = "Рационник с заблокированной соской, его можно отправить на склад."
        end
        
        local title = ration:AddRow("name")
        title:SetFont("ixSmallTitleFont")
        title:SetText(statusTitle)
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()
        
        local description = ration:AddRow("description")
        description:SetText(statusDescription)
        description:SizeToContents()
    end
    
end