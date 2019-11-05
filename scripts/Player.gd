extends KinematicBody2D

const MAX_SPEED = 400

var direction  = Vector2()
var speed = 0
var velocity = 0

var type
var grid

var is_moving = false
var target_pos = Vector2()
var target_dir = Vector2()

func _ready():
	# Gets added BEFORE the grid _ready() function runs
	grid = get_parent()
	type = grid.ENTITY_TYPES.PLAYER
	
func _physics_process(delta):
	direction = Vector2()

	if Input.is_action_pressed("ui_up"):
		direction.y = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
	
	if not is_moving and direction != Vector2():
		target_dir = direction
		if grid.is_cell_vacant(position, target_dir):
			print("empty")
			target_pos = grid.update_child_pos(self)
			is_moving = true
	elif is_moving:
		speed = MAX_SPEED
		velocity = speed * target_dir * delta
		print(velocity)
		
		var distance_to_taget = Vector2(abs(target_pos.x - position.x), abs(target_pos.y - position.y))
		if abs(velocity.x) > distance_to_taget.x:
			velocity.x = distance_to_taget.x * target_dir.x
			is_moving = false
			
		if abs(velocity.y) > distance_to_taget.y:
			velocity.y = distance_to_taget.y * target_dir.y
			is_moving = false
			
		move_and_collide(velocity)
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			