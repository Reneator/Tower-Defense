extends Sprite


export (NodePath) var start_point
export (NodePath) var end_point
export (int) var speed = 200

var start
var end

var hp = 100

var moving = false


func _ready():
	start = get_node(start_point)
	end = get_node(end_point)
	end.connect("changed", self, "set_moving")
	set_to_start_position()
	set_moving()
	
func set_moving():
	moving = true

func set_to_start_position():
	var _position = start.global_position
	global_position = _position


func _process(delta):
	if !moving:
		return
	move_towards_target(delta)


func move_towards_target(delta):
	var distance = speed * delta
	var direction = end.global_position - global_position
	var normalized_direction = direction.normalized()
	var movement = distance * normalized_direction
	
	if movement.length() > direction.length():
		global_position += direction
		moving = false
	else:
		global_position += movement