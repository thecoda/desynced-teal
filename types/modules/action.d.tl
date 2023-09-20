require("types.core")

global type ActionSingleton = record
    SendForLocalFaction: function(action_id: string, additional_data: table|nil)
    SendForEntity: function(action_id: string, target_entity: Entity<any>, additional_data: table|nil)
    SendForSelectedEntities: function(action_id: string, additional_data: table|nil)
    SendForEntities: function(action_id: string, targets: {Entity<any>}, additional_data: table|nil)
    SendForConstruction: function(action_id: string, target_entity: Entity<any>, additional_data: table|nil)
    SendFromPlayer: function(action_id: string, additional_data: table|nil)
    RunUI: function(lua_func: function(any), passed_values: any|nil)
    RunUI: function(message_name: string, passed_values: any|nil)
    SwitchFaction: function(faction_id: string)
    SetPlayerReady: function(state: boolean|nil)
    IsReplayPlayback: function(): boolean
    GetReplayProgress: function(days_not_ticks: boolean|nil): integer
    GetReplayDuration: function(days_not_ticks: boolean|nil): integer
    SetReplaySpeed: function(replay_speed: integer)
    RestartReplay: function()
    ReplayPlayFromHere: function()
end
