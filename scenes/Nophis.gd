extends Area3D

var move_speed = 6
var rotation_speed = 10

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
		
		# Calculate the target rotation to look towards the movement direction
		var target_rotation = atan2(direction.x, direction.z)
		
		# Smoothly interpolate the current rotation towards the target rotation
		var current_rotation = global_transform.basis.get_euler()
		var current_quat = Quaternion(Vector3.UP, current_rotation.y)
		var target_quat = Quaternion(Vector3.UP, target_rotation)
		var interpolated_quat = current_quat.slerp(target_quat, rotation_speed * delta)
		
		# Apply the interpolated rotation to the node
		global_transform.basis = Basis(interpolated_quat)

