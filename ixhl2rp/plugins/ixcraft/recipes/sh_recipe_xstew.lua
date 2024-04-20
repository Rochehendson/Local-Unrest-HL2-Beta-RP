RECIPE.name = "Ягодный суп"
RECIPE.description = "Приготовить суп вортигонтов."
RECIPE.model = "models/willardnetworks/food/xen_stew.mdl"
RECIPE.category = "Кухня"
RECIPE.requirements = {
    ["berryx"] = 1
}    
RECIPE.results = {
    ["xenstew"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_stove")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "Тебе надо быть у плиты."
end)