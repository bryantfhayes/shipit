extends Node2D

var texture_straight = preload("res://assets/tile_straight.png")
var texture_camera = preload("res://assets/tile_camera.png")
var texture_tshape = preload("res://assets/tile_tshape.png")
var texture_cross = preload("res://assets/tile_cross.png")
var texture_leftturn = preload("res://assets/tile_leftturn.png")
var texture_rightturn = preload("res://assets/tile_rightturn.png")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func configure(tile_type):
	if tile_type == Constants.TileTypes.Camera:
		$Sprite.set_texture(texture_camera)
	elif tile_type == Constants.TileTypes.TShape:
		$Sprite.set_texture(texture_tshape)
	elif tile_type == Constants.TileTypes.LeftTurn:
		$Sprite.set_texture(texture_leftturn)
	elif tile_type == Constants.TileTypes.Straight:
		$Sprite.set_texture(texture_straight)
	elif tile_type == Constants.TileTypes.RightTurn:
		$Sprite.set_texture(texture_rightturn)
	elif tile_type == Constants.TileTypes.Cross:
		$Sprite.set_texture(texture_cross)
	else:
		pass
