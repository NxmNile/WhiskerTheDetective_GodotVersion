extends Area3D
@onready var character = $"../Character"
var object_name : String
var is_in_collider = false
var is_finish = false
var close_button : bool = false
@export var police_dialog : String
@onready var camera_controller = $"../Camera Controller"
const environment2 = preload("res://scenes/Environment.tscn")
const police_intro = preload("res://scenes/police_intro.tscn")

func _ready():

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = character.transform
	if Input.is_action_pressed("F")&&is_in_collider:
		$"../Control/Talk".visible = false
		$"../Control/Exit".visible = false
		if object_name == "CatOfficer":
			character.stop_move()
			camera_controller.set_active_camera("camera2")
			$"../Control/Panel".visible = true
			await get_tree().create_timer(2).timeout
			$"../Control/Suspect".visible = true
			$"../Control/Panel2".visible = true
			close_button = true
		elif object_name=="Door"&&is_finish:
			Keepdata.scene_name = "Environment2"
			await get_tree().create_timer(1).timeout
			police_intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
			get_tree().change_scene_to_packed(environment2)
	if Input.is_action_pressed("ESC")&&close_button==true:
		_on_close_button_pressed()
	


func _on_area_entered(area):
	is_in_collider=true
	object_name=area.name
	print(area.name)
	if area.name == "CatOfficer":
		$"../Control/Talk".visible = true
	elif area.name == "Door"&&is_finish:
		$"../Control/Exit".visible = true



func _on_area_exited(area):
	is_in_collider=false
	object_name = area.name
	if area.name == "CatOfficer":
		$"../Control/Talk".visible = false
	elif area.name == "Door":
		$"../Control/Exit".visible = false

func _on_close_button_pressed():
	is_finish = true
	close_button=false
	character.can_move()
	$"../Control/Panel2".visible = false
	$"../Control/Panel".visible = false
	$"../Control/Suspect".visible = false
	camera_controller.set_active_camera("camera1")
	display_arrow()


func _on_setting_button_pressed():
	$"../Control/SettingPanel".visible = true

func display_arrow():
	for i in range(5):
		$"../Control/Arrow".visible = true
		await get_tree().create_timer(0.5).timeout
		$"../Control/Arrow".visible = false
		await get_tree().create_timer(0.5).timeout
	
