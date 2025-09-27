extends CharacterBody2D
@export var Bullet: PackedScene

const SPEED = 300.0
const JUMP_VELOCITY = -1200.0
const GRAVITY = Vector2(0,3000) 
var Facing = 0
var to_bullet_position = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func _process(delta: float) -> void:
	if  Input.is_action_pressed("Left"):
		position.x -= 10
		Facing = -1
	elif Input.is_action_pressed("Right"):
		position.x+= 10
		Facing = 1
	else:
		position.x += 0
	if Input.is_action_just_pressed("Fire"):
		var new_Bullet = Bullet.instantiate()
		add_sibling(new_Bullet)
	to_bullet_position = position






	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("Left", "Right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
