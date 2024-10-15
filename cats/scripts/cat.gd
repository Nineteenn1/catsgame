extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var line_point = 0

@onready var rat_node = get_parent().get_node("rat")
@onready var bullet_scene = load("res://scenes/bullet.tscn")

var bullet = null

var bullet_direction = Vector2(0,0)

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("LEFT", "RIGHT")
	var directionY := Input.get_axis("UP", "DOWN")
	
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()


	#$Line2D.set_point_position(0, Vector2(100,100))
	#draw_line(position, line_point, Color(1, 1, 1), 1, false)


func _input(e: InputEvent) -> void:
	if Input.is_action_just_pressed("SHOOT"):
		bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		bullet.position = position
		
		# on collision
		# health bar

			
		#bullet cooldown!!
			
	if e is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", e.position)
		bullet.mouse_position = e.position #+ abs(e.position - position)
		
