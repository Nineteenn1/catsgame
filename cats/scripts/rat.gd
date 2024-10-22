extends CharacterBody2D


const SPEED = 200.0

var health = 100

@onready var cat_node = get_parent().get_node("cat")

@onready var cat_position = cat_node.get("position")
@onready var cat_velocity = cat_node.get("velocity")

func takeDamage(damage: int):
	health -= damage
	$CanvasLayer/TextureProgressBar.value = health


func _ready():
		$CanvasLayer/TextureProgressBar.value = health


func die():
	# particle animation
	queue_free()
	get_parent().remove_child(self)
	pass

func _process(delta: float) -> void:
	cat_position = cat_node.get("position")
	cat_velocity = cat_node.get("velocity")

	$CanvasLayer/TextureProgressBar.position = Vector2(position.x - 65, position.y - 150)
	

	if health == 0:
		die()

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(cat_position) * SPEED
	
	
	#if not (position == cat_position):
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
#	if body.name == "Bullet":
	takeDamage(20)
	print(health)
	$CanvasLayer/TextureProgressBar.value = health
