RECIPE.name = "Приготовленная рыба"
RECIPE.description = "Пожарить сырую рыбу."
RECIPE.model = "models/willardnetworks/food/fishgolden.mdl"
RECIPE.category = "Кухня"
RECIPE.requirements = {
    ["feesh"] = 1
}    
RECIPE.results = {
    ["feeshf"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_stove")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "Тебе надо быть у плиты."
end)