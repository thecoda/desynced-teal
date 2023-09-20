global type RGBA = {number, number, number, number}
global type RGB = {number, number, number}

global type Point = {number, number, number}
    
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