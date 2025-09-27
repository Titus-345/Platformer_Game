extends Node2D
@onready var Level: TileMapLayer = get_node("../Level")
@export var enemy: PackedScene
var Tiles
var spawnTiles := {}
var world_coords
var y_shift = Vector2(0,-90)


func _ready() -> void:
	world_coords = get_node("../Level").world_positions
	Tiles = Level.get_used_cells_by_id(2)

	for cell in Tiles:
		var x = cell.x
		var y = cell.y

		if not spawnTiles.has(x) or y < spawnTiles[x]:
			spawnTiles[x] = y



# Called every frame. 'delta' is the elapsed time since the previous frame.
func spawn():
	var random_x = randi_range(spawnTiles.keys().min(),spawnTiles.keys().max())
	var new_enemy = enemy.instantiate()
	add_child(new_enemy)
	print("Where your foe lies:")
	print(world_coords[Vector2i(random_x,spawnTiles[random_x])]+y_shift)
	new_enemy.position = world_coords[Vector2i(random_x,spawnTiles[random_x])]+y_shift
	
