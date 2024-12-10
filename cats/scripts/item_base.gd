extends Node2D

class_name ItemBase

enum MODIFIER_TYPE {
	NONE = -1,
	DAMAGE = 1,
	HEALTH = 2,
	SPEED = 3,
	ATTACK_SPEED = 4,
	MONEY = 5,
	RADIANCE = 6
}

var modifier = -1
var price = 0

var icon: Sprite2D
var upgrade_count = 0

var modifier_diff = 1

@onready var buy_button = get_tree().root.get_child(0).get_node("itemshop/menu/buy")

@onready var cat = get_tree().root.get_child(0).get_node("cat")

var money_temp = 0
var scene_path = ""

var wear_position: Vector2 

var selected_item_index: int

var items = []

func on_item_button_pressed(selected_index) -> void:
	buy_button.set_visible(1)
	selected_item_index = selected_index - 1
	
	
func buy() -> void:
	var item = items[selected_item_index]
	var item_scene = load(item.scene_path)
	var item_instance = item_scene.instantiate()
	money_temp -= price
	cat.wear(item_instance, wear_position)
	

func constructor(m_icon: Sprite2D, m_price: int, m_modifier_type: int, m_modifier_diff:
	 float, m_wear_position: Vector2, m_scene_path: String):
	icon = m_icon
	price = m_price
	modifier = m_modifier_type
	modifier_diff = m_modifier_diff
	scene_path = m_scene_path
	wear_position = m_wear_position
	items.append(self)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#call constructor here
