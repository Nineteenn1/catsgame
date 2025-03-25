extends ItemBase

class_name Stick

@onready var lefteye = get_tree().root.get_child(1).get_node("cat/lefteye")

var _description = "Teach them how to fly!"

func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 200, MODIFIER_TYPE.NONE, 0.0, lefteye.position, "res://items/glasses.tscn", true, _description)
	
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_BACKSLASH):
		#attack()
		pass

func swing():
	pass
	#start at right and move to left creating an angle like look
	#create such a collider immediately, if something is in it, deal damage
	# remove it after half a second and reset the item.
	# damage should take modifier into account
	# if enemy in range, knockback and deal damage
	#right click

func attack(entity, damage, knockback):
	# step 1 find angle of enemy or attack
	# step 2 find the maximal path at that angle, pathfind
	# step 3 add to the velocity in such a way that a knockback effect is achieved
	# step 4 bounce off the wall cause its just cool
	# step 5 add an animation mb
	entity.takeDamage(damage)
	for i in range(-1, -4):
		entity.velocity *= -i
	
	#make a more universal system later
