extends Node3D

var move_speed = 8
var rotation_speed =1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("forward"):
		direction.z -= 1
	if Input.is_action_pressed("back"):
		direction.z += 1
	
	# Normalize the move direction to ensure consistent speed
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
		# Move the node
		position += direction * move_speed * delta
		
		
