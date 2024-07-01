extends Node3D

var speed = 6

func _ready():
	pass
"""
func _physics_process(delta):
	var direction = Vector3.ZERO
	#move_direction.x = Input.get_action_strength("left") - Input.get_action_strength("right")
	#move_direction.z = Input.get_action_strength("forward") - Input.get_action_strength("back")
	#move_direction = move_direction.normalized()
	# Move the node
	#translate_object_local(move_direction * speed * delta)
	if Input.is_action_pressed("forward"):
		direction.z +=1
	if Input.is_action_pressed("back"):
		direction.z-=1
	if Input.is_action_pressed("right"):
		direction.x+=1
	if Input.is_action_pressed("left"):
		direction.x-=1
		
	if direction!= Vector3.ZERO:
		direction = direction.normalized()
		$Posi
		
"""	
