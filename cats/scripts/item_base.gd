extends Node2D

class_name ItemBase

enum MODIFIER_TYPE {
	NONE = -1,
	DAMAGE = 0,
	HEALTH = 1,
	SPEED = 2,
	ATTACK_SPEED = 3,
	MONEY = 4,
	RADIANCE = 5,
	SIZE = 6,
	ENEMY_DAMAGE = 7
}

var modifier = -1
var price = 0

var wearable = true

var icon: Sprite2D
var upgrade_count = 0

var modifier_diff = 1

var description = ""

@onready var buy_button = get_tree().root.get_child(1).get_node("itemshop/menu/buy")

@onready var cat = get_tree().root.get_child(1).get_node("cat")

@onready var money = get_tree().root.get_child(1).get_node("itemshop").money

@onready var manager = get_tree().root.get_child(1).get_node("manager")


var scene_path = ""

var wear_position: Vector2 

var selected_item_index: int

var items = []


func on_item_button_pressed(selected_index) -> void:
	buy_button.set_visible(1)
	selected_item_index = selected_index - 1
	get_parent().get_node("menu/description").text = Globals.items[selected_item_index].description

	
func buy() -> void:
	money = get_tree().root.get_child(1).get_node("itemshop").money
	var item = Globals.items[selected_item_index]
	Globals.DEBUG_LOG(Globals.items)
	var item_scene = load(item.scene_path)
	var item_instance = item_scene.instantiate()
	Globals.DEBUG_LOG(money)
	#if money >= item.price:
	if true: #debug
		get_tree().root.get_child(1).get_node("itemshop").money -= item.price
		Globals.DEBUG_LOG(get_tree().root.get_child(1).get_node("itemshop").money)
		if wearable:
			cat.wear(item_instance, wear_position)
		manager.modifier_calc(item.modifier, item.modifier_diff)

func constructor(m_icon: Sprite2D, m_price: int, m_modifier_type: int, m_modifier_diff:
	 float, m_wear_position: Vector2, m_scene_path: String, m_wearable: bool, m_description: String):
	icon = m_icon
	price = m_price
	modifier = m_modifier_type
	modifier_diff = m_modifier_diff
	scene_path = m_scene_path
	wear_position = m_wear_position
	wearable = m_wearable
	description = m_description
	Globals.items.append(self)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#call constructor here
