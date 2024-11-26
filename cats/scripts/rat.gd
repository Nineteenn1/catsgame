extends CharacterBody2D


const SPEED = 200.0

var health = 100
var name_index = 1

@onready var cat_node = get_parent().get_node("cat")

@onready var cat_position = cat_node.get("position")
@onready var cat_velocity = cat_node.get("velocity")

var money = 0


func attack(entity, damage: int):
		if entity in $Area2D.get_overlapping_bodies() or entity in $Area2D.get_overlapping_areas():
			entity.takeDamage(damage)
			print("cat ded!!!")


func takeDamage(damage: int):
	health -= damage
	$CanvasLayer/TextureProgressBar.value = health





#func _ready():
		#$CanvasLayer/TextureProgressBar.value = health

#func removeEntities():
#	for i in entities:
	#	entities[i].queue_free()
	#	entities[i].get_parent().remove_child(self)
		#entities.erase(entities[i])



func die():
	# particle animation
	#await get_tree().create_timer(1).timeout
	
	get_parent().get_node("itemshop").money += 10
	print(get_parent().get_node("itemshop").money)
	
	
	queue_free()
	get_parent().remove_child(self)
	
	
	pass

func _process(delta: float) -> void:
	cat_position = cat_node.get("position")
	cat_velocity = cat_node.get("velocity")

	$CanvasLayer/TextureProgressBar.position = Vector2(position.x - 65, position.y - 150)

	attack(cat_node, 10)
	
	#removeEntities()

	if health == 0:
		die()

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(cat_position) * SPEED
	
	
	#if not (position == cat_position):
	move_and_slide()


#func _on_area_2d_body_entered(body: Node2D) -> void:



func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.name == "Area2D") or (area.name == "@CharacterBody2D@" + str(name_index)):
		takeDamage(20)
		$CanvasLayer/TextureProgressBar.value = health
		area.visible = false
		#await get_tree().create_timer(1).timeout
		area.queue_free()
		name_index += 1
