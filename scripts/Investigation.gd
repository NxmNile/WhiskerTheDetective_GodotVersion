extends Area3D
var object_name : String
var target : Area3D
var is_in_collider : bool
@onready var UI = $"../Camera3D/Control"
@onready var character = $"../Character"
# Called when the node enters the scene tree for the first time.
func _ready():
	target = $"../Character"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = target.transform
	if Input.is_action_pressed("F")&&is_in_collider&&object_name!="Door":
		character.move_speed = 0
		character.rotation_speed = 0
		$"../Camera3D/Control/Panel2".visible = true
		$"../Camera3D/Control/Panel".visible = true
		UI.display_description(object_name)
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
	if Input.is_action_pressed("F")&&is_in_collider&&object_name=="Door":
		#Load world scene
		pass




func _on_area_entered(area):
	print(area.name)
	object_name = area.name
	is_in_collider = true
	if area.name == "Weapon":
		$"../Camera3D/Control/InvestigatePanel2".visible = true
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "BankRecord":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = true
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "Letter":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = true
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif  area.name == "Window":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = true
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "Diary":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = true
		$"../Camera3D/Control/InvestigatePanel3".visible = false
		$"../Camera3D/Control/ExitPane".visible = false
	elif area.name == "PhoneRecord":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = true
		$"../Camera3D/Control/ExitPane".visible = false
	elif  area.name == "Door":
		$"../Camera3D/Control/InvestigatePanel2".visible = false
		$"../Camera3D/Control/InvestigatePanel6".visible = false
		$"../Camera3D/Control/InvestigatePanel5".visible = false
		$"../Camera3D/Control/InvestigatePanel".visible = false
		$"../Camera3D/Control/InvestigatePanel4".visible = false
		$"../Camera3D/Control/InvestigatePanel3".visible = false
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
	elif  area.name == "Door":
		$"../Camera3D/Control/ExitPane".visible = false
