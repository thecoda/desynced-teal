
-----------------------
-- Tuples
--

global type RGBA = {number, number, number, number}
global type RGB = {number, number, number}

global type Point = {number, number, number}
    

-----------------------
-- Enums
--

global type Race = enum
    "robot"
    "human"
    "alien"
end

global type Direction = enum
    "UP"
    "DOWN"
    "LEFT"
    "RIGHT"
end

global type Alignment = enum
    "MIDDLE"
    "LEFT"
    "RIGHT"
    "TOP"
    "BOTTOM"
end

global type ComponentSize = enum
    "Hidden"
    "Internal"
    "Small"
    "Medium"
    "Large"
end

global type IdleMode = enum
    "IDLE"
    "STORE"
    "MOVE"
    "ORDER"
    "COMPONENT"
    "INTERACT"
    "RETURN"
end

global type AddMode = enum
  "auto"
  "hidden"
end

global type FrameSize = enum
    "Unit"
    "Small"
    "Medium"
    "Large"
    "Other"
end

global type FrameType = enum
    "Operating"
    "Decoration"
    "Foundation"
    "Wall"
    "DroppedItem"
    "Resource"
    "Construction"
end

global type SlotType = enum
    "storage"
    "garage"
    "liquid"
    "radioactive"
    "bughole"
    "drone"
    "flyer"
    "satellite"
end

global type WindowMode = enum
    "windowed"
    "borderless"
    "fullscreen"
end

global type VolumeType = enum
    "master"
    "effect"
    "music"
    "voice"
    "ui"
end

global type KeyEvent = enum
    "Pressed"
    "Released"
    "Repeat"
    "DoubleClick"
    "Axis"
end

global type OpenableSite = enum
    "STORE"
    "DISCORD"
end

global type OpenableFolder = enum
    "SAVEGAMES"
    "LOGS"
    "MODS"
end

global type TrustLevel = enum
    "ENEMY"
    "NEUTRAL"
    "ALLY"
end

global type NetMode = enum
    "offline"
    "server"
    "client"
end

global type SessionVisibility = enum
    "PUBLIC"
    "FRIENDS"
    "INVITE"
    "LAN"
end


-----------------------
-- Recipes
--

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


-----------------------
-- Records
--

local record XYZ
    x: number
    y: number
    z: number
end

global type TechCategory = record
    name: string
    discovery_tech: string
    initial_tech: string
    sub_categories: {string}
    texture: string
end

global type Tech = record
    name: string
    texture: string
    desc: string
    uplink_recipe: any
    progress_count: number
    require_tech: {string}
    unlocks: {string}
    category: string
end

global type Visual = record
    mesh: string
    -- Optional
    flags: string
    materials: {string}
    -- Only for frame visuals
    tile_size: {number, number}
    placement: string
    sockets: {{string, string}}
    scale: Point
    place_effect: string
    move_effect: string
    destroy_effect: string
    tile_pattern: {number}
    hole_pattern: {number}
    frame_class: string
    bob_speed: number
    -- Only for lights
    light_radius: integer
    light_color: RGBA
    light_offset: Point
    -- misc
    animation_speed: number
    specular_scale: number
    cull_ratio: number
    minimap_color: RGBA
    stencil: integer
    sort_order: integer
    mesh_offset: Point
end

-----------------------
-- Modules
--

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

global Action: ActionSingleton

global type DebugSingleton = record
    Assert: function(condition: boolean, message: string)
    EndTest: function()
    PrintCallStack: function()
    GetStats: function(): table
    GetMapStateHash: function(): integer
    SetMemoryTracking: function(state: boolean)
    Benchmark: function(): integer
    CrashProgram: function()
end

global Debug: DebugSingleton

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

global Game: GameSingleton


global type InputProcessor = function(key_name: string, is_down: boolean, axis: any, mouse_delta: number)

global type InputSingleton = record
    IsShiftDown: function(): boolean
    IsControlDown: function(): boolean
    IsAltDown: function(): boolean
    IsKeyDown: function(key_name: string): boolean
    BindAction: function(action_name: string, key_event: KeyEvent, lua_func: function): integer
    BindAction: function(action_name: string, key_event: KeyEvent, builtin_func: string): integer
    BindAxis: function(axis_name: string, lua_func: function)
    BindAxis: function(axis_name: string, builtin_func: string)
    RemoveActionBinding: function(action_name: string, action_handle: integer|nil)
    RemoveAxisBinding: function(axis_name: string)
    AddActionMapping: function(action_name: string, key_name: string, options: table|nil)
    AddAxisMapping: function(axis_name: string, key_name: string, scale: number|nil)
    RemoveActionMapping: function(action_name: string, key_name: string|nil)
    RemoveAxisMapping: function(axis_name: string, key_name: string|nil)
    GetBindingNames: function(): table
    SetInputProcessor: function(processor: InputProcessor, ignore_dead_zone: boolean|nil, allow_repeats: boolean|nil)
    ClearInputProcessor: function()
end

global Input: InputSingleton

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
    CreateEntity: function(faction: Faction|string, frame_id: string, visual_id: string|nil, as_part_of_map_gen: boolean|nil): Entity<any>|nil
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
    GetEntityAt: function(x_coord: integer, y_coord: integer): Entity<any>|nil
    GetFoundationEntityAt: function(x_coord: integer, y_coord: integer): Entity<any>|nil
    GetEntitiesAt: function(x_coord: integer, y_coord: integer): {Entity<any>}
    FindClosestEntity: function(area: any, search_radium: integer, filter_frame_type: FrameType|nil, callback: function(Entity<any>): boolean): Entity<any>
    ThrowItemEffect: function(source_entity: Entity<any>, target_entity: Entity<any>, item_id: string, entity_instance_num: integer|nil)
end

global Map: MapSingleton

global type ToolSingleton = record
    Hash: function(any): integer
    TableToString: function(table: table, identifier_char: string): string
    StringToTable: function(text: string, identifier_char: string): table
    SetClipboard: function(table: table, identifier_char: string)
    GetClipboard: function(identifier_char: string): table
    GetDateStr: function(format_string: string|nil): string
    GetDateStr: function(unix_timestamp: integer, format_string: string|nil): string
    GetTimeDurationStr: function(seconds: integer): string
    NewRegisterObject: function(copy_from: table|nil): Register
    NewRegisterObject: function(copy_from: Register|nil): Register
end

global Tool: ToolSingleton

global type UISingleton = record
    Register: function(tagName: string, layout: string, props: any|nil, overwrite: boolean|nil)
    IsRegistered: function(tagName: string): boolean
    New: function(layout: string, props: any): Widget|nil
    AddLayout: function(layout: WidgetDef, ordering: integer|nil): Widget
    AddLayout: function(layout: string, props: any, ordering: integer|nil): Widget
    MakeModOptionsWidget: function(modId: string): Widget|nil
    ---@returns Screen size Y
    GetScreenSize: function(): integer
    MenuPopup: function(
        widget: Widget,
        direction: Direction|nil,
        alignment: Alignment|nil,
        nextTo: Widget|nil,
        xOffset: integer,
        yOffset: integer
    ): Widget
    MenuPopup: function(
        layout: string,
        props: any,
        direction: Direction|nil,
        alignment: Alignment|nil,
        nextTo: Widget|nil,
        xOffset: integer,
        yOffset: integer
    ): Widget
    CloseMenuPopup: function(widget: Widget): boolean
    CloseTooltip: function()
    RefreshTooltip: function()
    PlaySound: function(effectId: string, volume: integer|nil, pitch: integer|nil, startTime: integer|nil)
    StopMusic: function()
    StopVoice: function()
    StopAmbienceSound: function()
    SetUIHidden: function(value: boolean): boolean
    IsUIHidden: function(): boolean
    ---@returns Screen position Y.
    EntityLocationOnScreen: function(entity: any, onlyIfOnScreen: boolean): integer
    Run: function(fn: function(), args: any|nil)
    Run: function(msgName: string, args: any|nil)
    GetLanguages: function(): {{string, string}}
    GetLanguageCode: function(): string
    SetLanguageCode: function(code: string)
    GetScale: function(): number
    SetScale: function(scale: number)
    ---@returns y position of mouse cursor
    GetMousePosition: function(relativeTo: Widget): {number, number}
    IsMouseOverUI: function(): boolean
end

global UI: UISingleton

global type ViewSingleton = record
    GetHoveredTilePosition: function(): {integer,integer}
    GetHoveredEntity: function(): Entity<any>|nil
    ResetCamera: function(also_reset_zoom_level: boolean|nil)
    MoveCamera: function(x_coord: integer, y_coord: integer, also_reset_zoom_level: boolean|nil)
    JumpCameraToEntities: function(entities: {Entity<any>})
    JumpCameraToEntities: function(...: Entity<any>)
    GetCameraZoom: function(): integer
    FollowEntity: function(entity: Entity<any>)
    GetFollowEntity: function(): Entity<any>|nil
    ShowEntityPaths: function(value: boolean)
    ShowEntityStores: function(value: boolean)
    GetSelectedEntities: function(): {Entity<any>}
    GetSelectedEntity: function(): Entity<any>|nil
    IsSelectedEntity: function(entity: Entity<any>): boolean
    SelectEntities: function(entities: {Entity<any>})
    SelectEntities: function(...: Entity<any>)
    HighlightEntity: function(entity: Entity<any>)
    StartCursorChooseLocation: function(lua_confirm_func: function, lua_abort_func: function)
    StartCursorChooseEntity: function(lua_confirm_func: function, lua_abort_func: function)
    StartCursorConstruction: function(
        frame_id: string,
        visual_id: string|nil,
        rotation: integer|nil,
        p4: function|nil,
        p5: function|nil,
        p6: function|nil,
        allow_multiple: boolean|nil
    )
    StopCursor: function()
    RotateConstructionSite: function(clockwise: boolean|nil)
    SetPostProcess: function(effect_name: string, value: any)
    PlayEffect: function(effect_id: string, x_coord: integer, y_coord: integer, only_player_faction: boolean|nil): integer
    PlayEffect: function(effect_id: string, entity: Entity<any>, socket_name: string|nil, target_entity: Entity<any>, entity_instance_number: integer|nil, params: table): integer
    SetEffectParam: function(effect_instance_id: integer, param_name: string, value: any)
    StopEffect: function(effect_instance_id: integer)
    InConstructionMode: function(): boolean
    GetVisibleEntities: function(only_ill_health: boolean|nil): table
    SetCamera3DPosition: function(look_at: XYZ, camera_position: XYZ)
    GetCamera3DPosition: function(): {XYZ, XYZ, XYZ, number}
    PanCamera3DPosition: function(x_offset: integer, y_offset: integer, z_offset: integer)
    TiltCamera3DRotation: function(yaw_degrees: integer, pitch_degrees: integer)
    LockCamera: function()
    UnlockCamera: function()
end

global View: ViewSingleton



-----------------------
-- Definition Records
--

global type WidgetDef = record
    text: string
    parent: WidgetDef|nil
    root: WidgetDef|nil
    children: {WidgetDef}
    child_count: integer
    has_children: boolean
    child_index: integer
    next_sibling: WidgetDef|nil
    previous_sibling: WidgetDef|nil
    class: any
    update: function(self: WidgetDef)
end

global type ItemDef = record
    name: string
    tag: string
    texture: string
    slot_type: SlotType
    stack_size: integer
    visual: string
    production_recipe: ProductionRecipe
    -- Recipe of resources harvested from the world
    mining_recipe: MiningRecipe
end

global type RegisterDef = record
    type: string
    tip: string
    ui_apply: string
    ui_icon: string
    filter: string
    read_only: boolean
end

global type CompDef = record
    name: string
    desc: string
    tag: string
    race: Race
    texture: string
    visual: string
    slot_type: SlotType
    stack_size: integer
    attachment_size: ComponentSize
    activation: string
    registers: {RegisterDef}
    power: number
    power_storage: integer
    drain_rate: integer
    charge_rate: integer
    bandwidth: integer
    transfer_radius: integer
    adjust_extra_power: boolean
    dumping_ground: boolean
    effect: string
    effect_socket: string
    trigger_radius: integer
    trigger_channels: string
    non_removable: boolean
    production_recipe: ProductionRecipe

    get_ui: function(self: CompDef, comp: Component): Widget
    on_add: function(self: CompDef, comp: Component)
    on_remove: function(self: CompDef, comp: Component)
    on_update: function(self: CompDef, comp: Component, cause: any)
    on_trigger: function(self: CompDef, comp: Component, otherEntity: any)
    on_take_damage: function(self: CompDef, comp: Component, amount: integer)

    RegisterComponent: function(self: CompDef, id: string, def: CompDef): CompDef
end

global Comp: CompDef

global type FrameDef = record
    name: string
    visibility_range: integer
    visual: string
    slots: {SlotType : integer}
    components: {{string, string}}
    construction_recipe: ConstructionRecipe
    desc: string
    race: Race
    size: FrameSize
    texture: string
    slot_type: SlotType
    movement_speed: integer
    flags: string
    minimap_color: RGB
    drone_range: integer
    is_tethered: boolean
    convert_to: string
    docked_visual: string
    health_points: integer
    trigger_channels: string
    start_disconnected: boolean
    start_lootable: boolean
    on_placed: function(self: FrameDef, entity: any)
    on_remove: function(self: FrameDef, entity: any)
    on_destroy: function(self: FrameDef, entity: any)
    on_interact: function(self: FrameDef, entity: any)
    can_interact: function(self: FrameDef, entity: any)
    type: FrameType

    RegisterFrame: function(self: FrameDef, id: string, toRegister: FrameDef): FrameDef
end

global Frame: FrameDef

-----------------------
-- Meta Tables
--

global type Component = record
    -- Unreal meta-methods
    owner: Entity<FrameDef>
    faction: any
    exists: boolean
    key: number
    id: string
    base_id: string
    def: CompDef
    visual_id: string
    visual_def: table
    socket_index: integer
    slot_index: integer
    slot_count: integer
    slots: {SlotType : integer}
    register_index: integer
    register_count: integer
    is_empty: boolean
    is_hidden: boolean
    is_active: boolean
    is_working: boolean
    is_sleeping: boolean
    is_updating: boolean
    has_move_control: boolean
    has_prepared_process: boolean
    progress_percent: integer
    ticker: number
    ticker_target: number
    has_extra_data: boolean
    extra_data: table
    stored_power: number
    extra_power: number
    extra_transfer_range: number
    power_relay_target: any
    power_details: any
    animation_speed: number
    light_color: RGBA
    has_active_effects: boolean
    triggering_entities: {Entity<any>}

    Destroy: function(self: Component): table
    PrepareRemoval: function(self: Component, slot_to_keep_empty: ItemSlot|nil): boolean
    GetRegister: function(self: Component, register: Register|integer): Register
    GetRegisterNum: function(self: Component, register: Register|integer): integer
    GetRegisterId: function(self: Component, register: Register|integer): string
    GetRegisterDef: function(self: Component, register: Register|integer): RegisterDef
    GetRegisterEntity: function(self: Component, register: Register|integer): Entity<any>
    GetRegisterCoord: function(self: Component, register: Register|integer): Point
    RegistersEqual: function(self: Component, register_1: Register|integer, register_2: Register|integer): boolean
    SetRegister: function(self: Component, register: Register|integer, from_def: RegisterDef, force_update_and_activate: boolean|nil)
    SetRegisterNum: function(self: Component, register: Register|integer, value: integer)
    SetRegisterId: function(self: Component, register: Register|integer, id: string, num: integer|nil)
    SetRegisterEntity: function(self: Component, register: Register|integer, entity: Entity<any>, num: integer|nil)
    SetRegisterCoord: function(self: Component, register: Register|integer, value: Point, num: integer|nil)
    FlagRegisterError: function(self: Component, register: Register|integer, set_error_state: boolean|nil)
    RegisterIsLink: function(self: Component, register: Register|integer): boolean
    RegisterIsEmpty: function(self: Component, register: Register|integer): boolean
    RegisterIsError: function(self: Component, register: Register|integer): boolean
    RegisterHasConnection: function(self: Component, register_1: Register|integer, register_2: Register|integer, reg_2_entity: Entity<any>|nil): boolean
    RegisterHasConnection: function(self: Component, register_1: Register|integer, register_2: Register|integer, reg_2_component: Component): boolean
    LinkRegisterFromRegister: function(self: Component, target_register: Register|integer, source_register: Register|integer, source_entity: Entity<any>|nil)
    LinkRegisterFromRegister: function(self: Component, target_register: Register|integer, source_register: Register|integer, source_component: Component)
    UnlinkRegisterFromRegister: function(self: Component, target_register: Register|integer, source_register: Register|integer, source_entity: Entity<any>|nil)
    UnlinkRegisterFromRegister: function(self: Component, target_register: Register|integer, source_register: Register|integer, source_component: Component)
    GetRegisterLinkSource: function(self: Component, target_register: Register|integer): Component|nil
    GetRegisterLinkSource: function(self: Component, target_register: Register|integer, source_entity: Entity<any>|nil): Component
    GetRegisterLinkSource: function(self: Component, target_register: Register|integer, source_component: Component): Component
    GetRegisterLinkTarget: function(self: Component, source_register: Register|integer, source_entity: Entity<any>|nil): integer
    GetRegisterLinkTarget: function(self: Component, source_register: Register|integer, source_component: Component): integer
    GetSlot: function(self: Component, slot_index: integer): ItemSlot
    ClearActivationChangeFlags: function(self: Component)
    PrepareProduceProcess: function(self: Component, ingredients: table, outputs: table|nil, count: integer|nil): Register
    PrepareGenerateProcess: function(self: Component, outputs: table): boolean
    PrepareConsumeProcess: function(self: Component, ingredients: table, count: integer|nil): Register|nil
    PrepareConsumeProcess: function(self: Component, ingredients: table, from_slot: ItemSlot): Register|nil
    FulfillProcess: function(self: Component)
    CancelProcess: function(self: Component)
    GetProcessConsumeSlot: function(self: Component, slot_index: integer|nil): ItemSlot|nil
    GetProcessOutputSlot: function(self: Component, slot_index: integer|nil): ItemSlot|nil
    OrderItem: function(self: Component, into_slot: ItemSlot|nil, item_id: string, amount: integer): integer
    RotateComponent: function(self: Component, target_entity: Entity<any>, rotate_parent_entity: boolean|nil)
    RotateComponent: function(self: Component, target_component: Component, rotate_parent_entity: boolean|nil)
    RotateComponent: function(self: Component, look_at_x: integer, look_at_y: integer, rotate_parent_entity: boolean|nil)
    RotateComponent: function(self: Component, look_at: Point, rotate_parent_entity: boolean|nil)
    RotateComponent: function(self: Component, offset_degrees: integer)
    RequestStateMove: function(self: Component, target_entity: Entity<any>, range: integer|nil, sleepwalk: boolean|nil): boolean
    RequestStateMove: function(self: Component, target_component: Component, range: integer|nil, sleepwalk: boolean|nil): boolean
    RequestStateMove: function(self: Component, to_x: integer, to_y: integer, range: integer|nil, sleepwalk: boolean|nil): boolean
    RequestStateMove: function(self: Component, to: Point, range: integer|nil, sleepwalk: boolean|nil): boolean
    SetStateSleep: function(self: Component, number_of_ticks: integer|nil, keep_movement: boolean|nil)
    SetStateStartWork: function(self: Component, number_of_ticks: integer|nil, periodic_refresh: boolean|nil)
    SetStateStartWork: function(self: Component, number_of_ticks: integer|nil, refresh_frequency: integer)
    NotifyWorkFailed: function(self: Component)
    SetStateContinueWork: function(self: Component)
    WaitForFirstRegisterChange: function(self: Component)
    WaitForComponentRegisterChange: function(self: Component)
    WaitForFirstItemSlotChange: function(self: Component)
    WaitForComponentItemSlotChange: function(self: Component)
    WaitForLowPower: function(self: Component)
    WaitForPowerStoredEmpty: function(self: Component)
    WaitForOtherCompFinish: function(self: Component, other: Component)
    Activate: function(self: Component)
    Shutdown: function(self: Component)
    CauseToString: function(self: Component, cause: integer)
    FindClosestTriggeringEntity: function(self: Component, callback: EntityPredicate): Entity<any>|nil
    PlayEffect: function(self: Component, effect_id: string, socket_name: string|nil, target_entity: Entity<any>|nil, target_render_instance: integer|nil): integer
    PlayWorkEffect: function(self: Component, effect_id: string, socket_name: string|nil, target_entity: Entity<any>|nil, target_render_instance: integer|nil)
    StopEffects: function(self: Component)
end


global type EntityPredicate = function(Entity<any>): boolean

global type Entity = record<DefType>
    key: integer
    id: string
    def: DefType
    visual_id: string
    visual_def: table
    components: table
    slots: {ItemSlot}
    has_extra_data: boolean
    extra_data: table
    faction: any
    visibility_range: integer
    component_boost: integer
    move_boost: integer
    max_health: integer
    health: integer
    is_damaged: boolean
    exists: boolean
    efficiency: integer
    power_grid_index: integer
    has_power: boolean
    extra_power: integer
    extra_transfer_range: integer
    power_range: integer
    power_details: table
    battery_percent: integer
    animation_speed: number
    light_color: RGBA
    location: Point
    placed_location: Point
    location_hash: number
    size: Point
    rotation: integer
    move_goal: any
    is_moving: boolean
    has_movement: boolean
    is_placed: boolean
    is_docked: boolean
    docked_garage: Entity<any>
    disconnected: boolean
    powered_down: boolean
    stealth: boolean
    lootable: boolean
    has_blight_shield: boolean
    has_landing_pad: boolean
    want_goto_callback: boolean
    logistics_channel_1: boolean
    logistics_channel_2: boolean
    logistics_channel_3: boolean
    logistics_channel_4: boolean
    logistics_supplier: boolean
    logistics_requester: boolean
    logistics_carrier: boolean
    logistics_crane_only: boolean
    logistics_transport_route: boolean
    logistics_high_priority: boolean
    has_crane: boolean
    crane_range: integer
    is_construction: boolean
    state_idle: boolean
    state_path_blocked: boolean
    state_unpowered: boolean
    state_emergency: boolean
    state_broken: boolean
    state_custom_1: boolean
    state_custom_2: boolean
    state_custom_3: boolean
    state_custom_4: boolean
    idle_mode: IdleMode
    controlling_component: table
    active_order: table
    has_component_list: boolean
    component_count: integer
    slot_count: integer
    register_count: integer
    frame_register_count: integer
    most_relevant_state: string
    all_states: {string}
    render_instances: integer
    has_active_effects: boolean
    idle_ticks: integer
    interpolated_location: Point
    interpolated_center: Point
    interpolated_rotation: number
    interpolated_direction: Point
    metamethod __tostring: function(Entity<DefType>): string
    metamethod __eq: function(Entity<DefType>, Entity<DefType>): boolean

    Place: function(self: Entity<DefType>, x: integer, y: integer, rotation: integer|nil, place_nearby_if_blocked: boolean|nil): boolean|nil
    Place: function(self: Entity<DefType>, location: Point, rotation: integer|nil, place_nearby_if_blocked: boolean|nil): boolean|nil
    Unplace: function(self: Entity<DefType>)
    Destroy: function(self: Entity<DefType>, drop_items: boolean|nil, extra_drops: table|nil, drop_target: Entity|nil)
    AddComponent: function(self: Entity<DefType>, component_id: string, add_mode: AddMode, extra_data: table): CompDef
    AddComponent: function(self: Entity<DefType>, component_id: string, socket_index: integer, extra_data: table): CompDef
    GetComponent: function(self: Entity<DefType>, socket_index: integer): CompDef
    SwapSockets: function(self: Entity<DefType>, socket_index_1: integer, socket_index_2: integer): boolean
    GetHiddenComponent: function(self: Entity<DefType>, component_number: integer): CompDef
    CountComponents: function(self: Entity<DefType>, component_id: string): integer
    FindComponent: function(self: Entity<DefType>, component_id: string, also_query_base: boolean|nil, component_number: integer|nil): CompDef
    GetFreeSocket: function(self: Entity<DefType>, component_id: string): integer|nil
    CheckSocketSize: function(self: Entity<DefType>, component_id: string, socket_index: integer): boolean
    GetRegister: function(self: Entity<DefType>, register: integer|Register): Register
    GetRegisterLinks: function(self: Entity<DefType>, also_cross_entity: boolean|nil): table
    GetRegisterNum: function(self: Entity<DefType>, register: integer|Register): integer
    GetRegisterId: function(self: Entity<DefType>, register: integer|Register): string
    GetRegisterDef: function(self: Entity<DefType>, register: integer|Register): RegisterDef
    GetRegisterEntity: function(self: Entity<DefType>, register: integer|Register): Entity
    GetRegisterCoord: function(self: Entity<DefType>, register: integer|Register): Point
    RegistersEqual: function(self: Entity<DefType>, register_1: integer|Register, register_2: integer|Register): boolean
    SetRegister: function(self: Entity<DefType>, register: integer|Register, object_value: Register, force_update: boolean|nil)
    SetRegisterNum: function(self: Entity<DefType>, register: integer|Register, value: integer)
    SetRegisterId: function(self: Entity<DefType>, register: integer|Register, id: string, num: integer|nil)
    SetRegisterEntity: function(self: Entity<DefType>, register: integer|Register, entity: Entity, num: integer|nil)
    SetRegisterCoord: function(self: Entity<DefType>, register: integer|Register, coord: Point, num: integer|nil)
    FlagRegisterError: function(self: Entity<DefType>, register: integer|Register, set_err_state: boolean|nil)
    RegisterIsLink: function(self: Entity<DefType>, register: integer|Register): boolean
    RegisterIsEmpty: function(self: Entity<DefType>, register: integer|Register): boolean
    RegisterIsError: function(self: Entity<DefType>, register: integer|Register): boolean
    RegisterHasConnection: function(self: Entity<DefType>, register_1: integer|Register, register_2: integer|Register, register_2_entity: Entity|nil): boolean
    RegisterHasConnection: function(self: Entity<DefType>, register_1: integer|Register, register_2: integer|Register, register_2_component: Component): boolean
    LinkRegisterFromRegister: function(self: Entity<DefType>, from_register: integer|Register, to_register: integer|Register, from_register_entity: Entity|nil)
    LinkRegisterFromRegister: function(self: Entity<DefType>, from_register: integer|Register, to_register: integer|Register, from_register_component: Component)
    UnlinkRegisterFromRegister: function(self: Entity<DefType>, tgt_register: integer|Register, src_register: integer|Register, src_entity: Entity|nil)
    UnlinkRegisterFromRegister: function(self: Entity<DefType>, tgt_register: integer|Register, src_register: integer|Register, src_component: Component|nil)
    GetRegisterLinkSource: function(self: Entity<DefType>, register: integer|Register): Component|nil
    GetRegisterLinkSource: function(self: Entity<DefType>, register: integer|Register, src_entity: Entity|nil): Component|nil
    GetRegisterLinkSource: function(self: Entity<DefType>, register: integer|Register, src_component: Component|nil): Component|nil
    GetRegisterLinkTarget: function(self: Entity<DefType>, src_register: integer|Register, src_entity: Entity|nil): integer|nil
    GetRegisterLinkTarget: function(self: Entity<DefType>, src_register: integer|Register, src_component: Component|nil): integer|nil
    AddItem: function(self: Entity<DefType>, item_id: string, amount: integer|nil, extra_data: table|nil): ItemSlot|nil
    CountItem: function(self: Entity<DefType>, item_id: string, count_unreserved: boolean|nil): integer
    HaveFreeSpace: function(self: Entity<DefType>, item_id: string, amount: integer|nil): boolean
    CountFreeSpace: function(self: Entity<DefType>, item_id: string): integer|nil
    GetFreeSlot: function(self: Entity<DefType>, item_id: string, amount: integer|nil): ItemSlot
    GetSlot: function(self: Entity<DefType>, slot_index: integer): ItemSlot
    FindSlot: function(self: Entity<DefType>, item_id: string, at_least_amount: integer|nil): ItemSlot
    AddSlots: function(self: Entity<DefType>, slot_type: SlotType, number_of_slots: integer|nil): ItemSlot
    AutoMergeSlots: function(self: Entity<DefType>, only_item_id: string|nil): integer
    IsWaitingForOrder: function(self: Entity<DefType>, item_id: string): boolean
    TransferFrom: function(self: Entity<DefType>, src_entity: Entity, item_id: string, amount: integer, show_visual_effect: boolean|nil): integer|nil
    DropItem: function(self: Entity<DefType>, item_id: string, amount: integer|nil, x: integer, y: integer)
    DropItem: function(self: Entity<DefType>, item_slot: ItemSlot, amount: integer|nil, x: integer, y: integer)
    DropComponent: function(self: Entity<DefType>, component: Component, x: integer, y: integer)
    OrderItem: function(self: Entity<DefType>, item_slot: ItemSlot|nil, item_id: string, amount: integer): integer
    MoveTo: function(self: Entity<DefType>, target: Entity)
    MoveTo: function(self: Entity<DefType>, x: integer, y: integer)
    MoveTo: function(self: Entity<DefType>, target: Point)
    MoveAway: function(self: Entity<DefType>, target: any)
    Cancel: function(self: Entity<DefType>)
    LookAt: function(self: Entity<DefType>, target: any)
    IsTouching: function(self: Entity<DefType>, target: any): boolean
    IsInRangeOf: function(self: Entity<DefType>, target: any, range: integer): boolean
    GetRangeTo: function(self: Entity<DefType>, target: any): integer
    GetRangeSquaredTo: function(self: Entity<DefType>, target: any): integer
    DockInto: function(self: Entity<DefType>, garage: Entity): boolean|nil
    Undock: function(self: Entity<DefType>, reserve_for_reuse: boolean|nil): boolean|nil
    RemoveEntityInstance: function(self: Entity<DefType>)
    PlayEffect: function(self: Entity<DefType>, effect_id: string, socket_name: string|nil, target: Entity|nil, entity_instance: integer|nil): integer
    StopEffects: function(self: Entity<DefType>)
    StopEffect: function(self: Entity<DefType>, effect_instance_id: integer)
    Activate: function(self: Entity<DefType>)
    Deactivate: function(self: Entity<DefType>)
    GetSizeAtRotation: function(self: Entity<DefType>, visual_id: string, rotation: integer): any
    SetVisual: function(self: Entity<DefType>, visual_id: string, rotation: integer|nil): boolean
    AddHealth: function(self: Entity<DefType>, amount: integer): integer
    RemoveHealth: function(self: Entity<DefType>, amount: integer, cause: Entity|nil): integer
end

global type EventListener = record
    Bind: function(self: EventListener, function_name: string, callback: function)
    Unbind: function(self: EventListener, function_name: string, callback: function)
    UnbindAll: function(self: EventListener, function_name: string)
end


global type Faction = record
    is_world_faction: boolean
    is_player_controlled: boolean
    default_trust: TrustLevel
    entities: {Entity<any>}
    num_entities: integer
    foundation_entities: {Entity<any>}
    all_items: {{string : integer}}
    has_extra_data: boolean
    extra_data: table 
    has_blight_shield: boolean
    id: string
    name: string 
    seed: integer
    unlocks: {string}
    unlocked_techs: {string}
    unlocked_items: {string}
    unlocked_frames: {string}
    unlocked_components: {string}
    unlocked_values: {string}
    unlocked_codex: {string}
    researchable_techs: {string}
    items_picked_up: {string}
    discovered_tiles: integer
    moods: table
    color: table
    home_location: Point
    home_entity: Entity<any>

    Unlock: function(self: Faction, id: string, show_notification: boolean|nil): boolean
    IsUnlocked: function(self: Faction, id: string)
    IsResearchable: function(self: Faction, tech_id: string): boolean
    HavePickedUpItem: function(self: Faction, item_id: string): boolean
    GetPowerGrids: function(self: Faction): table
    GetPowerGrid: function(self: Faction, grid_index: integer): table
    GetPowerGridIndexAt: function(self: Faction, location: any): integer|nil
    GetPowerHistory: function(self: Faction, resolution: integer, number_to_read: integer): table
    GetItemHistory: function(self: Faction, item_id: string, resolution: integer, number_to_read: integer): table
    GetItemAmount: function(self: Faction, item_id: string): integer
    GetItemAvailability: function(self: Faction, item_id: string): table|nil
    GetItemTotals: function(self: Faction, item_id: string): integer
    ModifyItemTotals: function(self: Faction, item_id: string, generated_offset: integer, consumed_offset: integer)
    GetActiveOrders: function(self: Faction): table
    CancelOrder: function(self: Faction, order_id: integer)
    OrderTransfer: function(self: Faction, source_entity: Entity, target_entity: Entity, item_id: string, amount: integer|nil, update_existing: boolean|nil): boolean
    OrderTransfer: function(self: Faction, source_entity: Entity, target_entity: Entity, source_slot: ItemSlot, amount: integer|nil, update_existing: boolean|nil): boolean
    OrderTransfer: function(self: Faction, source_entity: Entity, target_entity: Entity, source_component: Component): boolean
    CanPlace: function(self: Faction, frame_id: string, loc_x: integer, loc_y: integer, rotation: integer|nil, visual_id: string|nil, set_construction_flag: boolean|nil, block_on_ungenerated_map: boolean|nil): boolean
    RevealArea: function(self: Faction, area: any, visibility_range: integer)
    HideArea: function(self: Faction, area: any, visibility_range: integer)
    IsVisible: function(self: Faction, area: any, require_all: boolean|nil): boolean
    IsDiscovered: function(self: Faction, area: any, require_all: boolean|nil): boolean
    IsSeen: function(self: Faction, entity: Entity<any>): boolean
    FindClosestHiddenTile: function(self: Faction, start_x: integer, start_y: integer, stop_after: integer, skip_blight: boolean|nil): {integer, integer}
    RunUI: function<T>(self: Faction, lua_function: function(T), params: T)
    RunUI: function(self: Faction, message_id: string, params: any)
    OrderEntitiesToMoveAway: function(self: Faction, area: any, exclude_entity: Entity|nil): integer
    Respaw: function(self: Faction)
    AddMood: function(self: Faction, mood_name: integer, amount: integer)
    GetComponents: function(self: Faction, component_id: string|nil, also_query_base_ids: boolean|nil): {Component}
    GetEntitiesWithComponent: function(self: Faction, component_id: string, also_query_base_ids: boolean|nil, exclude_hidden: boolean|nil): {Entity<any>}
    ---@returns table # One array with 4 or 6 elements for each entity (entity, X, Y, distance as well as visual register and state if true was passed)
    GetVisibleEntities: function(self: Faction, only_with_vis_register_set: boolean|nil): table
    SetTrust: function(self: Faction, other: Faction|string, trust_level: TrustLevel)
    SetTrust: function(self: Faction, other_entity: Entity, trust_level: TrustLevel, reciprocate: boolean|nil)
    GetTrust: function(self: Faction, other: Faction|string): TrustLevel
    GetTrust: function(self: Faction, other_entity: Entity): TrustLevel
end


global type ItemSlot = record
    id: string|nil
    def: ItemDef|nil
    stack: integer
    max_stack: integer
    reserved_stack: integer
    unreserved_stack: integer
    reserved_space: integer
    unreserved_space: integer
    has_order: boolean
    owner: Entity<any>
    exists: boolean
    entity: Entity<any>|nil
    reserved_entity: Entity<any>|nil
    component: Component|nil
    type: SlotType
    has_extra_data: boolean
    extra_data: table
    locked: boolean

    SetItemAndStack: function(self: ItemSlot, item_id: string, amount: integer, extra_data: table|nil)
    AddStack: function(self: ItemSlot, amount: integer)
    RemoveStack: function(self: ItemSlot, amount: integer)
    Clear: function(self: ItemSlot): table
    SetLockedItem: function(self: ItemSlot, item_id: string|nil)
    Swap: function(self: ItemSlot, other: ItemSlot)
    Move: function(self: ItemSlot, target_slot: ItemSlot, limit_amount: integer|nil): boolean
    GetReserveInfo: function(self: ItemSlot): table
    CancelOrders: function(self: ItemSlot)
    GetUnreservedSpaceFor: function(self: ItemSlot, item_id: string): integer
end

global type ModPackage = record
    id: string
    name: string
    description: string
    entry: string
    type: string
    dependencies: {ModPackage}
    modes: table
    mod_id: string
    mod_name: string
    mod_version_name: string
    mod_version_code: string
    mod_author: string
    mod_homepage: string
    mod_description: string
    includes: {string}

    is_scenario: boolean
    error_missing: boolean
    error_dependencies: boolean
    error_version: boolean
    now_disabled: boolean
    now_enabled: boolean
end

global type Register = record
    num: integer
    id: string
    def: RegisterDef
    value_id: string
    item_id: string
    frame_id: string
    component_id: string
    tech_id: string
    entity: Entity<any>
    coord: Point
    coord_x: number
    coord_y: number
    raw_entity: Entity<any>
    is_link: boolean
    is_empty: boolean
    raw_is_empty: boolean
    is_error: boolean

    metamethod __tostring: function(Register): string
    metamethod __eq: function(Register, Register): boolean

    Clear: function(self: Register)
    Init: function(self: Register, reg: Register)
end  


global type Widget = record
    parent: Widget|nil
    root: Widget
    children: {Widget}
    child_count: integer
    has_children: boolean
    child_index: integer
    next_sibling: Widget
    previous_sibling: Widget
    class: table|nil

    metamethod __tostring: function(Widget): string
    metamethod __eq: function(Widget, Widget): boolean
    metamethod __index: function(Widget, any): any
    metamethod __newindex: function(Widget, any, any)
    metamethod __len: function(Widget): integer

    IsValid: function(self: Widget): boolean
    Add: function(self: Widget, p1: Widget): Widget
    Add: function(self: Widget, layout: string, props: any): Widget
    SetContent: function(self: Widget, layout: table): Widget
    SetContent: function(self: Widget, layout: WidgetDef, props: any): Widget
    Clear: function(self: Widget)
    GetChild: function(self: Widget, child_index: integer|nil): Widget
    SetChildren: function(self: Widget, children: {Widget})
    SortChildren: function(self: Widget, compare_func: function(Widget, Widget): boolean)
    RemoveFromParent: function(self: Widget)
    --returns number called
    SendEvent: function(self: Widget, propName: string, data: any): integer
    GetDesiredSize: function(self: Widget): integer
    SetPosition: function(self: Widget, x: integer, y: integer, z_order: integer|nil)
    ---@returns Y position
    GetViewportPosition: function(self: Widget, relativeTo: Widget): {number, number}
    SetIgnoreHitTest: function(self: Widget, value: boolean)
    TweenTo: function(
        self: Widget,
        param_name: string,
        target_value: integer,
        duration_in_ms: integer|nil,
        wait_in_ms: integer|nil,
        ease: string|nil,
        callback: function(Widget)|nil
    )
    TweenToFrom: function(
        self: Widget,
        param_name: string,
        start_value: integer,
        target_value: integer,
        duration_in_ms: integer|nil,
        wait_in_ms: integer|nil,
        ease: string|nil,
        callback: function(Widget)|nil
    )
    StopTween: function(self: Widget, paramName: string): boolean
    GetTweenTarget: function(self: Widget, paramName: string): integer|nil
    FindAbove: function(self: Widget, paramName: string): any
end


-----------------------
-- Globals
--

local type LogisticFlagsType = record
    flag: string
    default: boolean
    label: string
    tooltip: string
end

global type DataSettings = record
    world_faction: string
    foundation_frame: string
    dropped_item_frame: string
    dropped_item_visual: string
    dropped_item_slots: number
    dropped_item_distance: number
    inventory_item_visual: string
    inventory_component_visual: string
    click_sound_effect: string
    hover_sound_effect: string
    added_component_effect: string
    removed_component_effect: string
    record default_faction_colors 
        bugs: RGB
    end
    player_colors: {RGB}
    state_priority_list: {string}
    key_names: {string : string}
    logistics_flags: {LogisticFlagsType}
end

global type ComponentFilterFunc = function(CompDef, any): boolean

global record DataSingleton
    settings: DataSettings
    tech_categories: {TechCategory}
    techs: {string : Tech}
    update_mapping: {string : string}
    visuals: {string : Visual}
    component_register_filters: {string : ComponentFilterFunc}
    items: {string : ItemDef}
end

global data: DataSingleton
