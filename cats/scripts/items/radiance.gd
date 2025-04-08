extends ItemBase

class_name Radiance

@onready var lefteye = get_tree().root.get_child(1).get_node("cat/lefteye")
@onready var area_ = $collider

var doDamage = false
var enemy = null
var ingame = false

var enemy_list = []

var _description = "You acquire a maximal aura. No mortal stands in your way."

func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 0, MODIFIER_TYPE.RADIANCE, 0, Vector2(0, 0), "res://items/radiance.tscn", true, _description)

func _process(delta: float) -> void:
	var frame_time = 1000 / Engine.get_frames_per_second() 
	if doDamage:
		for i in range(len(enemy_list)):
			if enemy_list[i].health > 0:
				attack(enemy, 15/frame_time) # i have no enemies btw
				Globals.DEBUG_LOG("attacked %s" % enemy_list[i].name)
			else:
				enemy_list.remove_at(i)
	if $collider and $effect:
		$effect.set_visible(Globals.in_game)
		$collider.set_visible(Globals.in_game)
	
	Globals.DEBUG_LOG(Globals.items)
		
func attack(entity, damage: int):
	if area_ != null:
		if entity != null:
			if entity.is_inside_tree():
				if entity.name == "rat" or "CharacterBody2D" == str(entity.name).left(15):
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
	Globals.DEBUG_LOG("enter")
	doDamage = true
	
	if area.get_parent().name == "rat" or "CharacterBody2D" == str(area.get_parent().name).left(15):
		enemy_list.append(area.get_parent())

func _on_area_2d_area_exited(area: Area2D) -> void:
#	doDamage = false
	#enemy_list.remove_at(area.get_parent())
	pass
