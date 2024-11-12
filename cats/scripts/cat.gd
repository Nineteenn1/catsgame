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
		
	$Sprite2D.flip_h = not velocity.x > 0			
	move_and_slide()


	#$Line2D.set_point_position(0, Vector2(100,100))
	#draw_line(position, line_point, Color(1, 1, 1), 1, false)


func _input(e: InputEvent) -> void:
	if Input.is_action_just_pressed("SHOOT"):
		bullet = bullet_scene.instantiate()
		print($global_timer.time_left)
		if not bullet.shoot and $global_timer.time_left <=0: 
			bullet.shoot = true
			get_parent().add_child(bullet)
			bullet.position = position
			print("start")
			$global_timer.start()
		# on collision
		# health bar

			
		#bullet cooldown!!
			
	if e is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", e.position)
		bullet.mouse_position = e.position #+ abs(e.position - position)
		#play anim then q free


		#bullet.mouse_position += Vector2(sqrt(bullet.mouse_position.x * bullet.mouse_position.x),
		#sqrt(bullet.mouse_position.y * bullet.mouse_position.y))

		#var bullet.mouse_position 
	#	bullet.direction.x = 
		#bullet.direction.y = 
