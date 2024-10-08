extends CharacterBody2D


const SPEED = 200.0

var health = 100

@onready var cat_node = get_parent().get_node("cat")

@onready var cat_position = cat_node.get("position")
@onready var cat_velocity = cat_node.get("velocity")

func takeDamage(damage: int):
	health -= damage

func die():
	# particle animation
	queue_free()
	pass

func _process(delta: float) -> void:
	cat_position = cat_node.get("position")
	cat_velocity = cat_node.get("velocity")

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(cat_position) * SPEED
		
	print("cat pos: " + str(cat_position.x) + ", " + str(cat_position.y)) 	
	print("rat pos: " + str(position.x) + ", " + str(position.y)) 	
		
	if health == 0:
		die()
	
	#if not (position == cat_position):
	move_and_slide()
