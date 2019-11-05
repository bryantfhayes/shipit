extends "res://scripts/TileObject.gd"


func _ready():
	# Gets added BEFORE the grid _ready() function runs
	MAX_SPEED = 600
	grid = get_parent()
	type = grid.ENTITY_TYPES.SELECTOR