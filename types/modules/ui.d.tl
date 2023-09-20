
require("types.widget")

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

