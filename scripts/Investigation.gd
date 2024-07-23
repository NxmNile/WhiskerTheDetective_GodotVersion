extends Area3D
var object_name : String
var target : Area3D
var is_in_collider : bool
var start_owl_house = 0
@onready var UI = $"../Camera3D/Control"
@onready var character = $"../Character"
const murder_room = preload("res://scenes/murder_case.tscn")
const environment = preload("res://scenes/Environment.tscn")
var close_button : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	target = $"../Character"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = target.transform
	if Input.is_action_pressed("F")&&is_in_collider&&object_name!="Door3":
		character.move_speed = 0
		character.rotation_speed = 0
		$"../Camera3D/Control/Panel2".visible = true
		$"../Camera3D/Control/Panel".visible = true
		close_button = true
		UI.display_description(object_name)
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/InvestigatePanel7".visible = false
	if Input.is_action_pressed("F")&&is_in_collider&&object_name=="Door3":
		Keepdata.scene_name = "Environment"
		murder_room.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_packed(environment)
		pass
	if close_button == true && Input.is_action_pressed("ESC"):
		UI._on_close_button_pressed()




func _on_area_entered(area):
	#print(area.name)
	object_name = area.name
	is_in_collider = true
	if area.name == "Weapon":
		$"../Camera3D/Control/InvestigatePanel2".visible = true
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/InvestigatePanel7".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "BankRecord":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = true
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/InvestigatePanel7".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "Letter":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = true
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/InvestigatePanel7".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif  area.name == "Window":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = true
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/InvestigatePanel7".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "Diary":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = true
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/InvestigatePanel7".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "PhoneRecord":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = true
		$"../Camera3D/Control/InvestigatePanel7".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "Jade":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/InvestigatePanel7".visible = true
		$"../Camera3D/Control/ExitPane".visible = false
	elif  area.name == "Door3":
		if start_owl_house == 0:
			is_in_collider = false
			start_owl_house+=1
		else :
			$"../Camera3D/Control/InvestigatePanel2".visible = false
			$"../Camera3D/Control/InvestigatePanel6".visible = false
			$"../Camera3D/Control/InvestigatePanel5".visible = false
			$"../Camera3D/Control/InvestigatePanel".visible = false
			$"../Camera3D/Control/InvestigatePanel4".visible = false
			$"../Camera3D/Control/InvestigatePanel3".visible = false
			$"../Camera3D/Control/InvestigatePanel7".visible = false
			$"../Camera3D/Control/ExitPane".visible = true



func _on_area_exited(area):
	if area.name == "Weapon":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
	elif area.name == "BankRecord":
		$"../Camera3D/Control/InvestigatePanel6".visible = false
	elif area.name == "Letter":
		$"../Camera3D/Control/InvestigatePanel5".visible = false
	elif  area.name == "Window":
		$"../Camera3D/Control/InvestigatePanel".visible = false
	elif area.name == "Diary":
		$"../Camera3D/Control/InvestigatePanel4".visible = false
	elif area.name == "Phone":
		$"../Camera3D/Control/InvestigatePanel3".visible = false
	elif  area.name == "Door3":
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "Jade":
		$"../Camera3D/Control/InvestigatePanel7".visible = false
