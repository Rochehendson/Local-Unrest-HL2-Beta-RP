RECIPE.name = "Вареная пиявка"
RECIPE.description = "Сварить сырую пиявку."
RECIPE.model = "models/willardnetworks/food/cooked_leech.mdl"
RECIPE.category = "Кухня"
RECIPE.requirements = {
    ["leech"] = 1
}    
RECIPE.results = {
    ["imeat"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_stove")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "Тебе надо быть у плиты."
end)