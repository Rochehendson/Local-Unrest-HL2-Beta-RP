RECIPE.name = "Приготовленный кусок мяса"
RECIPE.description = "Пожарить сырой кусок мяса."
RECIPE.model = "models/willardnetworks/food/meat3.mdlmodels/willardnetworks/food/meat3.mdl"
RECIPE.category = "Кухня"
RECIPE.requirements = {
    ["meat"] = 1
}    
RECIPE.results = {
    ["meatc"] = 1
}

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)
    for _, v in pairs(ents.FindByClass("ix_station_stove")) do
        if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
            return true
        end
    end

    return false, "Тебе надо быть у плиты."
end)