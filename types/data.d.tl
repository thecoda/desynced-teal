
require("types.simple")
require("types.visual")
require("types.core")

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


