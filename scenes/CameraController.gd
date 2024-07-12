extends Node3D
@export var camera1: Camera3D
@export var camera2: Camera3D
@export var camera3: Camera3D
@export var camera4: Camera3D
@export var camera5: Camera3D
@export var camera6: Camera3D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_active_camera("camera1")
	pass
	
func set_active_camera(camera):
	if camera == "camera1":
		camera1.current = true
		camera2.current = false
		camera3.current = false
		camera4.current = false
		camera5.current = false
		camera6.current = false
	elif camera == "camera2":
		camera1.current = false
		camera2.current = true
		camera3.current = false
		camera4.current = false
		camera5.current = false
		camera6.current = false
	elif camera == "camera3":
		camera1.current = false
		camera2.current = false
		camera3.current = true
		camera4.current = false
		camera5.current = false
		camera6.current = false
	elif camera == "camera4":
		camera1.current = false
		camera2.current = false
		camera3.current = false
		camera4.current = true
		camera5.current = false
		camera6.current = false
	elif camera == "camera5":
		camera1.current = false
		camera2.current = false
		camera3.current = false
		camera4.current = false
		camera5.current = true
		camera6.current = false
	elif camera == "camera6":
		camera1.current = false
		camera2.current = false
		camera3.current = false
		camera4.current = false
		camera5.current = false
		camera6.current = true
	print(camera)
