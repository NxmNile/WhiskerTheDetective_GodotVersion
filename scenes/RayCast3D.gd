extends RayCast3D
@onready var parent_node = $".."
func _process(delta):
	if is_colliding():
		parent_node.move_speed = 0
	else:
		parent_node.move_speed = 6

