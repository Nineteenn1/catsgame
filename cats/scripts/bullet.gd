extends CharacterBody2D


var mouse_position = Vector2(0, 0)
var direction = Vector2(0 ,0)
const SPEED = 400
var shoot = false


#func _process(delta: float) -> void:


	
func _on_timer_timeout() -> void:
	print("signal")
	queue_free()

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(mouse_position) * SPEED
	
	if position == mouse_position or velocity == Vector2(0, 0) : #use timer here to make it work on close ditance
		#area2d for collision detection with walls and stuff
		#play anim and q free
		get_parent().remove_child(self)
		queue_free()

	
	move_and_slide()
