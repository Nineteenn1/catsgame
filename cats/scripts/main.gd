extends Node2D

func _ready() -> void:
	play_music()
	
func play_music() -> void:
	$AudioStreamPlayer2D.play()
