extends Node3D

var _spring_arm: SpringArm3D
var speed = 10

func _ready():
	_spring_arm = $SpringArm3D

func _physics_process(delta):
	var move_direction = Vector3.ZERO
	move_direction.x = Input.get_action_strength("left") - Input.get_action_strength("right")
	move_direction.z = Input.get_action_strength("forward") - Input.get_action_strength("back")
	
	# Rotate move_direction according to _spring_arm's rotation
	move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y)
	move_direction = move_direction.normalized()
	# Move the node
	translate_object_local(move_direction * speed * delta)
