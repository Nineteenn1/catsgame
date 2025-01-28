extends ItemBase

class_name Radiance

@onready var lefteye = get_tree().root.get_child(1).get_node("cat/lefteye")


func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 50, MODIFIER_TYPE.HEALTH, 0, Vector2(-500, -500), "res://items/health_potion.tscn", true)

	
#check if useful
func buy():
	money = get_tree().root.get_child(1).get_node("itemshop").money
	if money >= price:
		var item = items[selected_item_index]
		var item_scene = load(item.scene_path)
		var item_instance = item_scene.instantiate()
		money -= price
		cat.wear(item_instance, wear_position)
