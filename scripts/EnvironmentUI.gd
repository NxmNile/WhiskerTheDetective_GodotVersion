extends Control
@export var FootPrint: String
@export var CCTV2: String
@export var LockPoliceStation : String 
@export var scene_name : String
@onready var arrow = $Arrow
@onready var character = $"../../Character"
@onready var investigate = $"../../Investigate"
var object_name :String
# Called when the node enters the scene tree for the first time.
func _ready():
	if Keepdata.language == "en":
		TranslationServer.set_locale("en")
	else:
		TranslationServer.set_locale("jp")
	$NumberofClues2.text = ": "+str(Keepdata.clue_num)+" / 8"
	if scene_name== "Environment2":
		display_arrow(arrow)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func change_to_en():
	TranslationServer.set_locale("en")
	$DesctiptionPanel/descriptionLabel.text = tr(object_name)
	
func change_to_jp():
	TranslationServer.set_locale("jp")
	$DesctiptionPanel/descriptionLabel.text = tr(object_name)
func _on_setting_button_pressed():
	$SettingPanel.visible = true
	pass # Replace with function body.

func display_clue(name):
	object_name = name
	$Panel2.visible = true
	$DesctiptionPanel.visible = true
	if name == "Camera":
		$DesctiptionPanel/descriptionLabel.text = CCTV2
		$DesctiptionPanel/Rabbit.visible = true
	elif name =="Footprint":
		$DesctiptionPanel/descriptionLabel.text = FootPrint
		$DesctiptionPanel/FootPrint.visible = true
	elif name =="LockPoliceStation":
		$DesctiptionPanel/descriptionLabel.text = LockPoliceStation
	$DesctiptionPanel/descriptionLabel.text = tr(name)
	pass


func _on_close_button_pressed():
	character.move_speed = 6
	character.rotation_speed = 20
	$Panel2.visible = false
	$DesctiptionPanel.visible = false
	$DesctiptionPanel/Rabbit.visible = false
	$DesctiptionPanel/FootPrint.visible = false
	investigate.is_in_collider = false
	pass # Replace with function body.
func display_arrow(arrow):
	for i in range(5):
		arrow.visible = true
		await get_tree().create_timer(0.5).timeout
		arrow.visible = false
		await get_tree().create_timer(0.5).timeout
