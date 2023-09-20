
global type ConstructionRecipe = record
    ingredients: {string:integer}
    ticks: integer
end

global type ProductionRecipe = record
    ingredients: {string:integer}
    producers: {string:integer}
    amount: integer
end

global type MiningRecipe = {{string : integer}}

global CreateConstructionRecipe: function({string : integer}, integer): ConstructionRecipe
global CreateProductionRecipe: function({string : integer}, {string : integer}, integer): ProductionRecipe
global CreateMiningRecipe: function(recipe: MiningRecipe): MiningRecipe