extends RayCast3D

@onready var character = $".."
@onready var col = $"../../ExtraCollider"
var is_in_col = false
func _process(delta):
	if is_in_col&&is_colliding():
		character.move_speed = 0
		#col.raycast_collide = trues
	elif !is_colliding():
		
		#character.can_move()
		pass
	


