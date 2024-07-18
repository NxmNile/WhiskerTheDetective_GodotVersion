extends Area3D
@onready var UI = $"../Camera3D/Control"
@onready var Character = $"../Character"
var object_name : String
var is_in_collider = true
var close_button : bool = false
func _ready():
	print(Keepdata.police_station_entering)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = Character.transform
	#print(transform)
	if Input.is_action_pressed("F")&&is_in_collider:
		$"../Camera3D/Control/InvestigatePanel".visible = false
		if object_name == "Footprint":
			UI.display_clue("Footprint")
			Character.stop_moving()
			Keepdata.cluses[6]=true
			Keepdata.check_clues()
			$"../Camera3D/Control/NumberofClues2".text = ": "+str(Keepdata.clue_num)+" / 8"
			if Keepdata.clue_num==8:
				$"../Camera3D/Control/NumberofClues3".visible = true
		elif object_name == "CCTV2":
			UI.display_clue("Camera")
			Character.stop_moving()
			Keepdata.cluses[7]=true
			Keepdata.check_clues()
			$"../Camera3D/Control/NumberofClues2".text = ": "+str(Keepdata.clue_num)+" / 8"
			if Keepdata.clue_num==8:
				$"../Camera3D/Control/NumberofClues3".visible = true
		elif  object_name == "Door2"&&Keepdata.house_entering>0:
			preload("res://scenes/Environment.tscn").instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
			get_tree().change_scene_to_packed(preload("res://scenes/murder_case.tscn"))
			pass
		elif object_name == "PoliceStation2":
			if Keepdata.police_station_entering>0:
				if Keepdata.clue_num <8:
					UI.display_clue("LockPoliceStation")
				else :
					Keepdata.scene_name = "PoliceStation"
					preload("res://scenes/Environment.tscn").instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
					get_tree().change_scene_to_packed(preload("res://scenes/police_interia.tscn"))
	if close_button==true && Input.is_action_pressed("ESC"):
		UI._on_close_button_pressed()
func _on_area_entered(area):
	print(area.name)
	object_name = area.name
	if object_name == "PoliceStation2"&&Keepdata.police_station_entering==0:
		Keepdata.police_station_entering+=1
		print(Keepdata.police_station_entering)

	else:
		is_in_collider = true
		$"../Camera3D/Control/InvestigatePanel".visible = true
		if object_name=="Door2"||object_name=="PoliceStation2":
			if object_name=="Door2":
				Keepdata.house_entering+=1
			$"../Camera3D/Control/InvestigatePanel/InvestigateText".text = "Enter"
		else:
			$"../Camera3D/Control/InvestigatePanel/InvestigateText".text = "Investigate"
	

func _on_area_exited(area):
	is_in_collider=false
	$"../Camera3D/Control/InvestigatePanel".visible = false
	pass # Replace with function body.
