extends RayCast3D
@onready var investigate = $"../../Investigate"
@onready var character = $".."
# Called when the node enters the scene tree for the first time.

func _process(delta):
	if is_colliding():
		character.move_speed = 0
	elif  !is_colliding()&&!investigate.stop_move:
		character.move_speed = 6
