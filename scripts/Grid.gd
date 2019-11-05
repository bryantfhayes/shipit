extends TileMap

var tile_size = get_cell_size()
var half_tile_size = tile_size / 2

var grid_size = Vector2(16, 8)
var grid = []

enum ENTITY_TYPES {PLAYER, OBSTACLE, COLLECTIBLE, SELECTOR, NONE, TILE}

onready var Obstacle = preload("res://scenes/Obstacle.tscn") 
onready var Tile = preload("res://scenes/Tile.tscn") 

func _ready():
	# 1. Create grid array
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			grid[x].append(null)
			
	# 2. Create obstacles
	var positions = []
	for n in range(5):
		var grid_pos = Vector2(randi() % int(grid_size.x), randi() % int(grid_size.y))
		if not grid_pos in positions:
			positions.append(grid_pos)
	
	for pos in positions:
		var new_obstacle = Obstacle.instance()
		new_obstacle.position = map_to_world(pos) + half_tile_size
		grid[pos.x][pos.y] = ENTITY_TYPES.OBSTACLE
		add_child(new_obstacle)
		
	var Selector = get_node("Selector")
	var start_pos = update_child_pos(Selector)
	Selector.position = start_pos
		
	
func is_cell_vacant(pos, direction):
	var grid_pos = world_to_map(pos) + direction
	if grid_pos.x < grid_size.x and grid_pos.x >= 0:
		if grid_pos.y < grid_size.y and grid_pos.y >= 0:
			return true if grid[grid_pos.x][grid_pos.y] == null else false
	return false
	
func update_child_pos(child):
	var grid_pos = world_to_map(child.position)
	print(grid_pos)
	
	# Remove old position
	grid[grid_pos.x][grid_pos.y] = null
	
	# Get new position in grid
	var new_grid_pos = grid_pos + child.direction
	grid[new_grid_pos.x][new_grid_pos.y] = child.type
	
	# Return new position
	var target_pos = map_to_world(new_grid_pos) + half_tile_size
	return target_pos
	
func update_tile_at_selector(tile_type):
	# Get coordinates of selector
	var selector = get_node("Selector")
	var selector_grid_pos = world_to_map(selector.position)
	
	var new_tile = Tile.instance()
	new_tile.configure(tile_type)
	new_tile.position = map_to_world(selector_grid_pos) + half_tile_size
	grid[selector_grid_pos.x][selector_grid_pos.y] = ENTITY_TYPES.TILE
	add_child(new_tile)
	
	
	