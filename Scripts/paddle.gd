extends KinematicBody2D

func _physics_process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	position = Vector2(mouse_x, position.y)