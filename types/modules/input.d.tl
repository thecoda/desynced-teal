
global type KeyEvent = enum
    "Pressed"
    "Released"
    "Repeat"
    "DoubleClick"
    "Axis"
end

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