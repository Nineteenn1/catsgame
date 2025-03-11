extends ItemBase

class_name Radiance

@onready var lefteye = get_tree().root.get_child(1).get_node("cat/lefteye")
@onready var area_ = $collider

var doDamage = false
var enemy = null
var ingame = false

var enemy_list = []

func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 0, MODIFIER_TYPE.RADIANCE, 0, Vector2(lefteye.position.x - 300, lefteye.position.y - 50), "res://items/radiance.tscn", true)

func _process(delta: float) -> void:
	var frame_time = 1000 / Engine.get_frames_per_second() 
	if doDamage:
		attack(enemy, 5)
		print("trigger")
	if $collider and $effect:
		$effect.set_visible(Globals.in_game)
		$collider.set_visible(Globals.in_game)
	
	print(Globals.items)
		
func attack(entity, damage: int):
	if area_ != null:
		if entity in area_.get_overlapping_bodies() and entity.is_inside_tree():	
			entity.takeDamage(damage)

#check if useful
func buy():
	money = get_tree().root.get_child(1).get_node("itemshop").money
	if money >= price:
		var item = items[selected_item_index]
		var item_scene = load(item.scene_path)
		var item_instance = item_scene.instantiate()
		money -= price
		cat.wear(item_instance, wear_position)


func _on_area_2d_area_entered(area: Area2D) -> void:
	print("enter")
	doDamage = true
	
	enemy_list.append(area.get_parent())

func _on_area_2d_area_exited(area: Area2D) -> void:
#	doDamage = false
	#enemy_list.remove_at(area.get_parent())
	pass
