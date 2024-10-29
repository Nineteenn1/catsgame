extends CharacterBody2D


var mouse_position = Vector2(0, 0)
var direction = Vector2(0 ,0)
const SPEED = 400

#func _process(delta: float) -> void:


	

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(mouse_position) * SPEED
	
	if position == mouse_position or velocity == Vector2(0, 0):
		get_parent().remove_child(self)
		queue_free()

	
	move_and_slide()
