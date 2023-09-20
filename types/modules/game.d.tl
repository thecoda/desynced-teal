local type VideoSettings = record
    vsync: boolean
    frame_rate_limit: integer
    power_save_mode: boolean
    hdr_output: boolean
    overall_quality: integer
    resolution_percentage: number
    view_distance_quality: integer
    fog_grid_size: integer
    shadow_quality: integer
    anti_alias_quality: integer
    bloom_quality: integer
    depth_of_field_quality: integer
    depth_of_field_strength: number
end

local type NewGameSettings = record
    seed: integer
    scenario: string
    tutorial: boolean
end

global type GameSingleton = record
    NewGame: function(settings: NewGameSettings, disable_replay: boolean|nil, session_settings: table|nil)
    RestartGame: function()
    EndGame: function()
    QuitGame: function()
    OfflinePause: function(state: boolean)
    GetModPackage: function(mod_package_path: string): ModPackage
    GetModPackages: function(): table
    GetScenarioModPackage: function(): ModPackage|nil
    GetInstalledMods: function(): {table}
    GetInstalledModPackages: function(mod_id: string): {table}
    GetInstalledModPackage: function(mod_id: string): {table}|nil
    SetModEnabled: function(mod_id: string, state: boolean): string|nil
    RefreshInstalledMods: function()
    GetNativeModManagerName: function(): string
    OpenNativeModManager: function()
    GetCommandLineArguments: function(): string
    SaveGame: function(title: string, slot_name: string|nil): string|nil
    LoadGame: function(slot_name: string, session_settings: table|nil, reset_mods: boolean|nil)
    ReplayGame: function(slot_name: string)
    DeleteGame: function(slot_name: string): boolean
    RenameGame: function(slot_name: string, new_title: string): string|nil
    GetSaveGameList: function(): table
    GetSaveGameModPackages: function(): {ModPackage}
    HaveAnySaveGame: function(): boolean
    GetAutoSaveTime: function(): integer
    SetAutoSaveTime: function(minutes: integer)
    GetMouseLock: function(): boolean
    SetMouseLock: function(state: boolean)
    GetEdgeScrolling: function(): boolean
    SetEdgeScrolling: function(state: boolean)
    GetScrollSpeed: function(): integer
    SetScrollSpeed: function(value: integer)
    GetGameDuration: function(): integer
    GetTimeSinceSave: function(): integer
    GetVersionString: function(): string
    GetLocalPlayerFaction: function(): Faction|string|nil
    GetLocalPlayerExtra: function(mod_id: string|nil): table
    GetProfile: function(mod_id: string|nil): table
    SetColorMapping: function(mode: string)
    GetMappedColor: function(any): any
    CreateOnlineSession: function(session_setting: table, callback: function(succeeded: boolean))
    FindOnlineSessions: function(callback: function(succeeded: boolean, results: table), search_lan_only: boolean|nil)
    JoinOnlineSession: function(session_number: integer, password: string|nil, callback: function(succeeded: boolean))
    JoinOnlineSession: function(hostname: string|nil, password: string|nil, callback: function(succeeded: boolean))
    EndOnlineSession: function()
    OnlineHaveLobbies: function(): boolean
    CanInviteFriend: function(): boolean
    ShowFriendInviteUI: function()
    GetNetMode: function(): NetMode
    GetAllPlayers: function(): table
    GetPlayerById: function(player_id: integer|nil): table
    GetLocalPlayer: function(): table
    GetPlayerName: function(player_id: integer|nil): string
    IsHostPlayer: function(player_id: integer|nil): boolean
    IsLocalPlayer: function(player_id: integer|nil): boolean
    KickPlayer: function(player_id: integer|nil, ban_until_restart: boolean|nil)
    GetPlayerCount: function(): integer
    GetMaxPlayerCount: function(): integer
    GetSessionVisibility: function(): SessionVisibility|nil
    GetHostSessionSettings: function(): table|nil
    GetEntitySelectedPlayerId: function(entity: Entity<any>): {integer}|nil
    GetFullscreenMode: function(): WindowMode
    SetFullscreenMode: function(mode: WindowMode)
    GetScreenResolution: function(): {integer, integer}
    SetScreenResolution: function(): {integer, integer}
    GetScreenResolutions: function(): table
    ApplyScreenModeRequired: function(): boolean
    ApplyScreenModeNeedConfirm: function(): boolean
    ConfirmScreenMode: function()
    RevertScreenMode: function()
    GetVideoSettings: function(): VideoSettings
    SetVideoSettings: function(): VideoSettings
    PowerSavingSection: function(state: boolean)
    GetVolume: function(type: VolumeType): integer
    SetVolume: function(type: VolumeType, value: integer)
    GetNewsText: function(callback: function(string))
    OpenWebsite: function(site: OpenableSite)
    ExploreFolder: function(folder: OpenableFolder)
    SendFeedback: function(
        rating: integer,
        category: string,
        text: string,
        attach_save_state: boolean,
        attach_screenshot: boolean,
        callback: function(succeeded: boolean)
    )
end