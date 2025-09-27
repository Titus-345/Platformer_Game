extends Area2D
var Direction = 0
var Speed = 25
var Player_Position = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var Level = get_node("../Level")
	var Player = get_node("../Player")
	var local_to_player = self.to_local(Player.get_global_position())
	var Width = get_viewport_rect().size.x
	if abs(local_to_player.x) < 4*Width:
		position.x += Speed*Direction
	else:
		self.queue_free()
	if overlaps_body(Level):
		self.queue_free()
	
	
func spawn():
	Direction = get_node("/root/Main/Player").Facing
	Player_Position = get_node("/root/Main/Player").to_bullet_position
	self.position = Player_Position
