extends TileMapLayer


var world_positions := {}  # Dictionary: { Vector2i(x, y): Vector2(global_x, global_y) }

func _ready():
	var tile_cells = get_used_cells()

	for cell in tile_cells:
		var local_pos = map_to_local(cell)
		var global_pos = to_global(local_pos)

		world_positions[cell] = global_pos
