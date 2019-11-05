extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var grid

# Called when the node enters the scene tree for the first time.
func _ready():
	grid = get_parent()
	set_process_input(true)

func add_tile(tile_type):
	grid.update_tile_at_selector(tile_type)

func _input(event):
	var just_pressed = event.is_pressed() and not event.is_echo()
	if Input.is_key_pressed(KEY_1) and just_pressed:
		add_tile(Constants.TileTypes.Camera)
	elif Input.is_key_pressed(KEY_2) and just_pressed:
		add_tile(Constants.TileTypes.TShape)
	elif Input.is_key_pressed(KEY_3) and just_pressed:
		add_tile(Constants.TileTypes.LeftTurn)
	elif Input.is_key_pressed(KEY_4) and just_pressed:
		add_tile(Constants.TileTypes.Straight)
	elif Input.is_key_pressed(KEY_5) and just_pressed:
		add_tile(Constants.TileTypes.RightTurn)
	elif Input.is_key_pressed(KEY_6) and just_pressed:
		add_tile(Constants.TileTypes.Cross)
	elif Input.is_key_pressed(KEY_7) and just_pressed:
		add_tile(Constants.TileTypes.Empty)

func _on_Btn_1_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
        print("Clicked Button #1")


func _on_Btn_2_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
        print("Clicked Button #2")


func _on_Btn_3_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
        print("Clicked Button #3")


func _on_Btn_4_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
        print("Clicked Button #4")


func _on_Btn_5_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
        print("Clicked Button #5")


func _on_Btn_6_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
        print("Clicked Button #6")


func _on_Btn_7_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
        print("Clicked Button #7")
