extends Node

var items = []

var in_game = false
var debug = false

func DEBUG_LOG(MESSAGE):
	if debug:
		print(MESSAGE, Time.get_date_string_from_system(true))
