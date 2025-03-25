extends ItemBase

class_name Glasses

@onready var lefteye = get_tree().root.get_child(1).get_node("cat/lefteye")

var _description = "Why am I so tiny?"

func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 200, MODIFIER_TYPE.SIZE, 0.5, lefteye.position, "res://items/glasses.tscn", true, _description)
	
func buy():
	money = get_tree().root.get_child(1).get_node("itemshop").money
	if money >= price:
		var item = items[selected_item_index]
		var item_scene = load(item.scene_path)
		var item_instance = item_scene.instantiate()
		money -= price
		cat.wear(item_instance, wear_position)
