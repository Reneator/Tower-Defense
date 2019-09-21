extends Node

var start_position
var target_position

onready var laser = $Laser

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	laser.clear_points()
	laser.add_point(start_position)
	laser.add_point(target_position)
	$CPUParticles2D.global_position = target_position
	$AnimationPlayer.play("laser")
