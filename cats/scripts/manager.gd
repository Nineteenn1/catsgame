extends Node2D


class_name ModifierManager

var damage_modifier = 1
var health_modifier = 1
var speed_modifier = 1
var attack_speed_modifier = 1
var money_modifier = 1
var radiance_modifier = 1
var size_modifier = 1
var enemy_damage_modifier = 1

func modifier_calc(TYPE: int, modifier):
	global_modifiers[TYPE] += modifier
	print(global_modifiers[TYPE])


var global_modifiers = [damage_modifier, health_modifier, 
speed_modifier, attack_speed_modifier, money_modifier, radiance_modifier, size_modifier, enemy_damage_modifier]
