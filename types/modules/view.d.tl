
local record XYZ
    x: number
    y: number
    z: number
end

global record ViewSingleton
    GetHoveredTilePosition: function(): {integer,integer}
    GetHoveredEntity: function(): Entity|nil
    ResetCamera: function(also_reset_zoom_level: boolean|nil)
    MoveCamera: function(x_coord: integer, y_coord: integer, also_reset_zoom_level: boolean|nil)
    JumpCameraToEntities: function(entities: {Entity})
    JumpCameraToEntities: function(...: Entity)
    GetCameraZoom: function(): integer
    FollowEntity: function(entity: Entity)
    GetFollowEntity: function(): Entity|nil
    ShowEntityPaths: function(value: boolean)
    ShowEntityStores: function(value: boolean)
    GetSelectedEntities: function(): {Entity}
    GetSelectedEntity: function(): Entity|nil
    IsSelectedEntity: function(entity: Entity): boolean
    SelectEntities: function(entities: {Entity})
    SelectEntities: function(...: Entity)
    HighlightEntity: function(entity: Entity)
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
    PlayEffect: function(effect_id: string, entity: Entity, socket_name: string|nil, target_entity: Entity, entity_instance_number: integer|nil, params: table): integer
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