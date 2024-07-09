extends Area3D
@onready var UI = $"../Camera3D/Control"
@onready var Character = $"../Character"
var object_name : String
var is_in_collider = true
var stop_move : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = Character.transform
	if Input.is_action_pressed("F")&&is_in_collider:
		stop_move = true
		if object_name == "Footprint":
			UI.display_clue("Footprint")
			Character.stop_moving()
			Keepdata.cluses[6]=true
			Keepdata.check_clues()
			$"../Camera3D/Control/NumberofClues2".text = ": "+str(Keepdata.clue_num)+" / 8"
		elif object_name == "CCTV2":
			UI.display_clue("Camera")
			Character.stop_moving()
			Keepdata.cluses[7]=true
			Keepdata.check_clues()
			$"../Camera3D/Control/NumberofClues2".text = ": "+str(Keepdata.clue_num)+" / 8"
		elif  object_name == "Door":
			pass
		elif object_name == "PoliceStation2":
			UI.display_clue("LockPoliceStation")
			
			pass
	pass


func _on_area_entered(area):
	print(area.name)
	object_name = area.name
	is_in_collider = true
	$"../Camera3D/Control/InvestigatePanel".visible = true
	if object_name=="Door"||object_name=="PoliceStation2":
		$"../Camera3D/Control/InvestigatePanel/InvestigateText".text = "Enter"
	else:
		$"../Camera3D/Control/InvestigatePanel/InvestigateText".text = "Investigate"
	pass # Replace with function body.


func _on_area_exited(area):
	is_in_collider=false
	$"../Camera3D/Control/InvestigatePanel".visible = false
	pass # Replace with function body.
