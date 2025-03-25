extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var line_point = 0

@onready var rat_node = get_parent().get_node("rat")
@onready var bullet_scene = load("res://scenes/bullet.tscn")
@onready var rat_scene = load("res://scenes/rat.tscn")

@onready var manager = get_parent().get_node("manager")
@onready var item_base = get_parent().get_node("itemshop/itemBase")


var bullet = null

var bullet_direction = Vector2(0,0)
	
var bullet_mouse_position_copy

var health = 100

func wear(item: ItemBase, wear_position: Vector2) -> void:
	$wearables.add_child(item)
	item.position = wear_position
	if not item.wearable:
		item.set_visible(0)
func takeDamage(damage: int):
	health -= damage
	
func heal(m_health: int):
	health += m_health

func _process(delta: float) -> void:
	if health <= 0:
		die()
	
func die() -> void:
	get_tree().change_scene_to_file("res://scenes/die_screen.tscn")

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("LEFT", "RIGHT")
	var directionY := Input.get_axis("UP", "DOWN")
	
	if directionX:
		velocity.x = directionX * SPEED * manager.speed_modifier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if directionY:
		velocity.y = directionY * SPEED * manager.speed_modifier
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	$Sprite2D.flip_h = not velocity.x > 0			
	$wearables.flip_h = not velocity.x > 0
	
	$Sprite2D.scale = Vector2(1/manager.global_modifiers[item_base.MODIFIER_TYPE.SIZE], 1/manager.global_modifiers[item_base.MODIFIER_TYPE.SIZE])
	move_and_slide()

	#fix this bug, enable many wearables

	#$Line2D.set_point_position(0, Vector2(100,100))
	#draw_line(position, line_point, Color(1, 1, 1), 1, false)


func _input(e: InputEvent) -> void:
	if e is InputEventMouseButton:
		#print("Mouse Click/Unclick at: ", e.position)
		bullet_mouse_position_copy = e.position
		#play anim then q free
	if Input.is_action_just_pressed("SHOOT"):
		bullet = bullet_scene.instantiate()
		#print($global_timer.time_left)
		if not bullet.shoot and $global_timer.time_left <=0: 
			bullet.shoot = true
			get_parent().add_child(bullet)
			bullet.position = position
			#print("start")
			bullet.mouse_position = bullet_mouse_position_copy
			$global_timer.start()
		# on collision


		
			
		#bullet cooldown!!S
		#bullet.mouse_position += Vector2(sqrt(bullet.mouse_position.x * bullet.mouse_position.x),
		#sqrt(bullet.mouse_position.y * bullet.mouse_position.y))

		#var bullet.mouse_position 
	#	bullet.direction.x = 
		#bullet.direction.y = 
		
		#add manager

func radiance():
	if false:
		# play radiance animation
		#deal damage if rat in circle
		#turn rats red on hit
		pass
		


func _on_rat_spawn_timer_timeout() -> void:
	var rat = rat_scene.instantiate()
	get_parent().add_child(rat)
