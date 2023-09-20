
require("types.simple")

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