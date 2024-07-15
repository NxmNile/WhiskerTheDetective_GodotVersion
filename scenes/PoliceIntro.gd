extends Area3D
@onready var character = $"../Character"
var object_name : String
var is_in_collider = false
@export var police_dialog : String
@onready var camera_controller = $"../Camera Controller"
# Called when the node enters the scene tree for the first time.
func _ready():
	if Keepdata.language =="en":
		change_to_en()
	else:
		change_to_jp()
	Keepdata.scene_name = "Intro"
	$"../Control/Exit/InterrogateText".text = tr("Exit")
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
			pass
		else:
			pass



func _on_area_entered(area):
	is_in_collider=true
	object_name=area.name
	print(area.name)
	if area.name == "CatOfficer":
		$"../Control/Talk".visible = true
	elif area.name == "Door":
		$"../Control/Exit".visible = true



func _on_area_exited(area):
	is_in_collider=false
	object_name = area.name
	if area.name == "CatOfficer":
		$"../Control/Talk".visible = false
	elif area.name == "Door":
		$"../Control/Exit".visible = false

func change_to_en():
	TranslationServer.set_locale("en")
	$"../Control/Exit/InterrogateText".text = tr("Exit")
	$"../Control/Panel/descriptionLabel".text = tr("Intro6")
	$"../Control/Panel2/Name".text = tr("Choice1")
	$"../Control/Panel2/Description".text = tr("RabbitRelation")
	$"../Control/Panel2/Name2".text = tr("Choice2")
	$"../Control/Panel2/Description2".text = tr("OwlRelation")
	$"../Control/Panel2/Name3".text = tr("Choice4")
	$"../Control/Panel2/Description3".text = tr("BadgerRelation")
	$"../Control/Panel2/Name4".text = tr("Choice3")
	$"../Control/Panel2/Description4".text = tr("SquirrelRelation")
func change_to_jp():
	TranslationServer.set_locale("jp")
	$"../Control/Exit/InterrogateText".text = tr("Exit")
	$"../Control/Panel/descriptionLabel".text = tr("Intro6")
	$"../Control/Panel2/Name".text = tr("Choice1")
	$"../Control/Panel2/Description".text = tr("RabbitRelation")
	$"../Control/Panel2/Name2".text = tr("Choice2")
	$"../Control/Panel2/Description2".text = tr("OwlRelation")
	$"../Control/Panel2/Name3".text = tr("Choice4")
	$"../Control/Panel2/Description3".text = tr("BadgerRelation")
	$"../Control/Panel2/Name4".text = tr("Choice3")
	$"../Control/Panel2/Description4".text = tr("SquirrelRelation")

	


func _on_close_button_pressed():
	character.can_move()
	camera_controller.set_active_camera("camera1")
	$"../Control/Suspect".visible = false
	$"../Control/Panel2".visible = false
	$"../Control/Panel".visible = false
	pass # Replace with function body.


func _on_setting_button_pressed():
	$"../Control/SettingPanel".visible = true
	pass # Replace with function body.
