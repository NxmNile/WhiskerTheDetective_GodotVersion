extends Node3D
@export var camera1: Camera3D
@export var camera2: Camera3D
# Called when the node enters the scene tree for the first time.
func _ready():
	set_active_camera("camera1")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func set_active_camera(camera):
	if camera == "camera1":
		camera1.current = true
		camera2.current = false
	else:
		camera1.current = false
		camera2.current = true
