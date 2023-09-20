
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
