extends ItemBase

class_name Stick

@onready var hold = get_tree().root.get_child(1).get_node("cat/hold")

var _description = "Teach them how to fly!"

var left = true
var right = false

var active_attack = false

#var in_game = false

func _ready() -> void:
	#fix positioning
	constructor(get_node("."), 200, MODIFIER_TYPE.NONE, 0.0, hold.position, "res://items/stick.tscn", true, _description)
	
var i = 1
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("STICK_ATTACK"):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		#if in_game:
		#attack()
		active_attack = true
		#for i in range(42):
		swing()
		print("swing", i)
		i+= 1
		
	active_attack = false
	

func swing():
	if left:
		rotation_degrees -= 7.4 * 1.5 / 2.5
		

	if right:
		rotation_degrees += 7.4  * 1.5 / 2.5
		
		
	if rotation_degrees <= -137:
		left = false
		right = true
		print("done", i)
	elif rotation_degrees >= 48:
		right = false
		left = true
		print("done", i)
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
