
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