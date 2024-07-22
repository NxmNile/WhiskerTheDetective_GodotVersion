extends RayCast3D

@onready var parent_node = $".."
@onready var col = $"../../ExtraCollider"
func _process(delta):
	if is_colliding():
		parent_node.move_speed = 0
		col.raycast_collide = true
		
	


