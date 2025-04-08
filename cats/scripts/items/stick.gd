extends ItemBase

class_name Stick

@onready var nose = get_tree().root.get_child(1).get_node("cat/nose")

var _description = "Teach them how to fly!"

func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 200, MODIFIER_TYPE.NONE, 0.0, nose.position, "res://items/stick.tscn", true, _description)
	
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		#attack()
		swing()
	

func swing():
	var i = 0
	print(rotation_degrees)
	if rotation_degrees >= 0 or rotation_degrees > -55:
			while i >= -5:
				i -= 5
				rotation_degrees += i
		
	if rotation_degrees <= -55:
			while i < 5:
				i += 5
				rotation_degrees += i
		
		#else:
			#rotation_degrees -= i

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
