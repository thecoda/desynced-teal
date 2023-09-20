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