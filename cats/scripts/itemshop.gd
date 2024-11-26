extends Node2D

var money = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_texture_button_pressed() -> void:
	set_visible(1)
	get_parent().get_node("open").set_visible(0)
	$money.text = "Balance: {money}$".format({"money": money})

func close_pressed() -> void:
	set_visible(0)
	get_parent().get_node("open").set_visible(1)
