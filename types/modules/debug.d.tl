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