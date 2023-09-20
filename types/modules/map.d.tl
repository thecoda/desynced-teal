---@meta Map
---The map module contains global functions affecting the game state
---[Official Documentation](https://modding.desyncedgame.com/syntax.html#map)
global type MapSingleton = record
    SetGameSpeed: function(speed: integer)
    GetGameSpeed: function(): integer
    IsSimulation: function(): boolean
    IsFrontEnd: function(): boolean
    GetSettings: function(): table
    ModifySettings: function(settings_key: string, new_value: any)
    GetSeed: function(): integer
    GetSave: function(mod_id: string|nil): table
    Run: function(message_name: string, params: any|nil)
    GetTick: function(): integer
    GetExecutedActionCount: function(): integer
    CreateEntity: function(faction: Faction|string, frame_id: string, visual_id: string|nil, as_part_of_map_gen: boolean|nil): Entity|nil
    DropItemAt: function(area: any, item_id: string, amount: integer|nil, extra_data: table|nil, frame_id: string|nil, visual_id: string|nil)
    GetFaction: function(faction_id: string): Faction|string|nil
    CreateFaction: function(faction_id: string): boolean
    GetFactions: function(): {Faction}
    GetPlayerFactionCount: function(): integer
    GetTotalDays: function(): number
    GetSunlightIntensity: function(): number
    GetSunlightAmount: function(): number
    GetSunlightDirection: function(): {number,number}
    GetSunriseAndSunset: function(threshold: number|nil): integer
    GetUndiscoveredLocation: function(nth: integer|nil): {integer,integer}
    SpawnChunks: function(area: any): integer
    GetBlightness: function(area: any, return_smallest: boolean|nil): number
    GetElevation: function(area: any, return_smallest: boolean|nil): number
    GetRichness: function(area: any, return_smallest: boolean|nil): number
    GetVariation: function(area: any, return_smallest: boolean|nil): table
    GetHeight: function(area: any, return_smallest: boolean|nil): number
    GetPlateauHeight: function(): number
    GetWaterHeight: function(): number
    GetTileData: function(x_coord: integer, y_coord: integer): table
    Defer: function(lua_func: function)
    Delay: function(func_name: string, delay_ticks: integer, params: table)
    StartTerraforming: function(entity: Entity<any>, range: integer, change_per_tick: integer): integer
    StopTerraforming: function(terraforming_instance_id: integer)
    GetEntityAt: function(x_coord: integer, y_coord: integer): Entity|nil
    GetFoundationEntityAt: function(x_coord: integer, y_coord: integer): Entity|nil
    GetEntitiesAt: function(x_coord: integer, y_coord: integer): {Entity<any>}
    FindClosestEntity: function(area: any, search_radium: integer, filter_frame_type: FrameType|nil, callback: function(Entity<any>): boolean): Entity
    ThrowItemEffect: function(source_entity: Entity<any>, target_entity: Entity<any>, item_id: string, entity_instance_num: integer|nil)
end
