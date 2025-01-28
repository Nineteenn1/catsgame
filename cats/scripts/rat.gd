extends CharacterBody2D


const SPEED = 200.0

var health = 100
var name_index = 1

const xmin = 40
const xmax = 1000
const ymin = 387
const ymax = 990

#IF ERROR= (FIX ERROR)

@onready var area = get_node("Area2D")

@onready var cat_node = get_parent().get_node("cat")

@onready var cat_position = cat_node.get("position")
@onready var cat_velocity = cat_node.get("velocity")


@onready var manager = get_parent().get_node("manager")
@onready var item_base = get_parent().get_node("itemshop/itemBase")


var money = 0

var attack_timeout = true

func attack(entity, damage: int):
	if area != null:
		if entity in area.get_overlapping_bodies() and entity.is_inside_tree():	
			if 	attack_timeout == true: #timer.time_left == 0 // so that the cat is not dead in a millisecond after the rat getting close
				entity.takeDamage(damage)
				print("cat ded!!!")
				$Timer.start()
				attack_timeout = false

func takeDamage(damage: int):
	print("damage", damage)
	print("modif. damage", damage * manager.global_modifiers[item_base.MODIFIER_TYPE.DAMAGE])
	health -= damage * manager.global_modifiers[item_base.MODIFIER_TYPE.DAMAGE]
	$CanvasLayer/TextureProgressBar.value = health





func _ready():
	var newPos = Vector2(randi_range(xmin, xmax), randi_range(ymin, ymax))
	if abs(newPos.x - cat_node.position.x) > 50 and abs(newPos.y - cat_node.position.y) > 50:
		position = newPos
	else: 
		newPos = Vector2(randi_range(xmin, xmax), randi_range(ymin, ymax))
		position = newPos
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
	
	
	#queue_free()
	get_parent().remove_child(self)
	
	
	pass

func _process(delta: float) -> void:
	cat_position = cat_node.get("position")
	cat_velocity = cat_node.get("velocity")

	$CanvasLayer/TextureProgressBar.position = Vector2(position.x - 65, position.y - 150)

	attack(cat_node, 20)
	
	#removeEntities()

	if health <= 0:
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


func _on_timer_timeout() -> void:
	attack_timeout = true
