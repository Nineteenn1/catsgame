extends ItemBase

@onready var ear2 = get_tree().root.get_child(0).get_node("cat/ear2")

func _ready() -> void:
	constructor(get_node("."), 250, MODIFIER_TYPE.DAMAGE, 2.00, ear2.position, "res://items/ribbon.tscn")
	
func buy():
	super()
