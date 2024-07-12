extends Area3D
var move_speed = 6
var rotation_speed = 20
var has_rotated_90_degrees = false
var rotation_threshold = deg_to_rad(90)  # 90 degrees in radians
var initial_rotation_y = 0
var has_collided = false
@onready var character_root = $catDetective
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
	if has_collided&&!has_rotated_90_degrees:
		# Calculate the current y-axis rotation
		var current_rotation_y = global_transform.basis.get_euler().y

		# Calculate the absolute difference in rotation from the initial rotation
		var rotation_difference = abs(current_rotation_y - initial_rotation_y)

		# Normalize the rotation difference to be within the range [0, PI]
		rotation_difference = wrapf(rotation_difference, 0, PI)

		# Check if the rotation difference equals the threshold and hasn't been flagged yet
		if rotation_difference >= rotation_threshold and not has_rotated_90_degrees:
			print("rotate")
			has_rotated_90_degrees = true  # Set flag to true to avoid repeated prints
	if has_rotated_90_degrees:
		move_speed=6


func Collide():
	initial_rotation_y = global_transform.basis.get_euler().y
	has_collided =true

func _on_area_entered(area):
	print(area.name)
	pass # Replace with function body.
func stop_move():
	character_root.move=false
	move_speed=0
	rotation_speed=0
func can_move():
	character_root.move = true
	move_speed = 6
	rotation_speed=20
