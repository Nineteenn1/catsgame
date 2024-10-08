extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@onready var rat_node = get_parent().get_node("rat")

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
		


func _input(InputEvent) -> void:
	if Input.is_action_just_pressed("SHOOT"):
		if rat_node:
			rat_node.takeDamage(50)
			print(rat_node.health)
		

	move_and_slide()
