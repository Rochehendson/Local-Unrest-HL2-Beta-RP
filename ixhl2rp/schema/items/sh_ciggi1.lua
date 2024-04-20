ITEM.name = "Пачка сигарет"
ITEM.model = Model("models/willardnetworks/cigarettes/cigarette_pack.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "Простая белая упаковка с логотипом Альянса на ней, внутри находятся готовые к употреблению сигареты."
ITEM.category = "Consumables"
ITEM.permit = "consumables"

ITEM.functions.Smoke = {
    OnRun = function(itemTable)
        local client = itemTable.player

        client:SetHealth(math.min(client:Health() + 5, 100))

        return true
    end,
}