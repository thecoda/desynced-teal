table.insert(data.techs.t_robot_tech_basic.unlocks, "f_building_silo")

data.visuals.v_silo = {
    mesh = "StaticMesh'/Game/Meshes/RobotBuildings/Building_1x1_B.Building_1x1_B'",
    placement = "Max",
    tile_size = { 1, 1},
    sockets = {
        { "Large1", "Large"   },
        { "",       "Internal" },
        { "",       "Internal" },
    },
    destroy_effect = "fx_digital",
    place_effect = "fx_digital_in",
}

Frame:RegisterFrame("f_building_silo", {
    name = "Silo",
    desc = "Stores a large quantity of any raw resource.",
    minimap_color = { 0.8, 0.8, 0.8 },
    visibility_range = 10,
    health_points = 100,
    race = "robot",
    slots = { storage = 4, },
    size = "Large",
    construction_recipe = CreateConstructionRecipe({ metalbar = 20 }, 15),
    texture = "Main/textures/icons/frame/building_1x1_f.png",
    trigger_channels = "building",
    visual = "v_silo",
    components = {
        { "c_silo", "auto" },
    }
})
