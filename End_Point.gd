extends Node2D

signal changed()


func _input(event):
	if event is InputEventMouseButton:
		if event.button_mask == BUTTON_MASK_LEFT && !event.is_echo():
			var mouse_position = get_global_mouse_position()
			global_position = mouse_position
			emit_signal("changed")