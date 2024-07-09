extends Area3D
var move_speed = 6
var rotation_speed = 20
var velocity = Vector3()
func _process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1	
	# Normalize the move direction to ensure consistent speed
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		# Move the node
		position += direction * move_speed * delta
		var target_rotation = Vector3()
		target_rotation.y = atan2(direction.x, direction.z)

		# Interpolate between current rotation and target rotation
		rotation.y = lerp_angle(rotation.y, target_rotation.y, rotation_speed * delta)

		# Apply movement
		velocity.x = direction.x * move_speed
	
func stop_moving():
	move_speed=0
	rotation_speed=0
func continue_moving():
	move_speed=6
	rotation_speed=20
