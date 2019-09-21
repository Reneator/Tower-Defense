extends Sprite

export (NodePath) var _target_path
var _target
var Laser = preload("res://Particle_Laser.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	_target = get_node(_target_path)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var interval = 1
var current_interval = 0

func _process(delta):
	current_interval += delta
	if current_interval >= interval:
		zap(_target)
		
		current_interval = 0
#	var targets = scan_for_targets()
#	var target = get_closest_target(targets)
#	fire_at_target(target)

var old_line

func zap(target):
	
	var laser = Laser.instance()
	laser.start_position = global_position
	laser.target_position = target.global_position
	get_tree().get_root().add_child(laser)
	
#	var point1 = global_position
#	var point2 = target.global_position
#	if(old_line):
#		old_line.queue_free()
#	var line = Line2D.new()
#	line.add_point(point1)
#	line.add_point(point2)
#	old_line = line
#	get_tree().get_root().add_child(line)
	target.hp -= 1
	
func fake_predictive(target):
	## keep a line between the target and the turret and the physical projectile travels on that line
	pass
	
func true_predictive(target):
	## calculate the point at which the creep should be and fire a physical projectile towards that point
	pass

