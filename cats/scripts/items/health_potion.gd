extends ItemBase

class_name HealthPotion

@onready var lefteye = get_tree().root.get_child(1).get_node("cat/lefteye")


func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 50, MODIFIER_TYPE.HEALTH, 0, Vector2(-9999, -9999), "res://items/health_potion.tscn", false)
	#manager.global_modifiers[]
	cat.health += 50
	if cat.health > 100:
		cat.health = 100
		
	
	
	print("health: ", cat.health)
	
#check if useful
func buy():
	money = get_tree().root.get_child(1).get_node("itemshop").money
	if money >= price:
		var item = items[selected_item_index]
		var item_scene = load(item.scene_path)
		var item_instance = item_scene.instantiate()
		money -= price
		cat.wear(item_instance, wear_position)
