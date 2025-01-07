extends ItemBase

class_name Ribbon

@onready var ear2 = get_tree().root.get_child(1).get_node("cat/ear2")

func _ready() -> void:
	constructor(get_node("."), 250, MODIFIER_TYPE.DAMAGE, 2.00, ear2.position, "res://items/ribbon.tscn")
	
func buy():
	var item = items[selected_item_index]
	var item_scene = load(item.scene_path)
	var item_instance = item_scene.instantiate()
	money_temp -= price
	cat.wear(item_instance, wear_position)
