extends Area2D
var Direction = 0
var Speed = 100
var Player_Position = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var Player_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var Direction = get_node("/root/Main/Player").Facing
	var Player_Position = get_node("/root/Main/Player").position
func spawn():
	self.position = Player_Position
	var Width = get_viewport_rect().size.x
	if position.x > 0 or position.x < Width:
		position.x += Speed*Direction
	else:
		pass
