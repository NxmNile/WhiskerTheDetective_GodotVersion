extends RayCast3D

@onready var character = $".."
# Called when the node enters the scene tree for the first time.

func _process(delta):
	if is_colliding():
		character.move_speed = 0
	else:
		character.move_speed = 6
