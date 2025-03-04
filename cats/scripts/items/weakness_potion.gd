extends ItemBase

class_name WeaknessPotion

@onready var lefteye = get_tree().root.get_child(1).get_node("cat/lefteye")


func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 0, MODIFIER_TYPE.ENEMY_DAMAGE, 0.75, Vector2(-9999, -9999), "res://items/weakness_potion.tscn", false)

	$Timer.start()
	print("start")
	
func _process(delta: float) -> void:
	#print($Timer.time_left)
	if $Timer.time_left > 0:
		manager.enemy_damage_modifier = 0.75
	
	else:
		manager.enemy_damage_modifier = 1
	
#check if useful
func buy():
	money = get_tree().root.get_child(1).get_node("itemshop").money
	if money >= price:
		var item = items[selected_item_index]
		var item_scene = load(item.scene_path)
		var item_instance = item_scene.instantiate()
		money -= price
		cat.wear(item_instance, wear_position)
