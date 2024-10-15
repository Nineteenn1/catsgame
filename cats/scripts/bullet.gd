extends CharacterBody2D


var mouse_position = Vector2(0, 0)
const SPEED = 300

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(mouse_position) * SPEED
	
	move_and_slide()
