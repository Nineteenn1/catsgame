extends CharacterBody2D


const SPEED = 200.0

@onready var cat_node = get_parent().get_node("cat")

var cat_position = Vector2(0,0) 
var cat_velocity = Vector2(0,0)

func _process(delta: float) -> void:
	cat_position = cat_node.get("position")
	cat_velocity = cat_node.get("velocity")

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(cat_position) * SPEED
		
	move_and_slide()
