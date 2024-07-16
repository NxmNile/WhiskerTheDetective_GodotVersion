extends Control
@export var Letter: String
@export var Phone: String
@export var Diary: String
@export var Bank: String
@export var WindowB : String
@export var Weapon : String
@onready var character = $"../../Character"
@onready var investigate = $"../../InteractionCol"

var imageIndex = 0
var description =[[Bank,"BankRecord"],[Diary,"Diary"],[Weapon,"Weapon"],[Letter,"Letter"],[Phone,"PhoneRecord"],[WindowB,"Window"]]
var descriptionText
var object_name
# Called when the node enters the scene tree for the first time.
func _ready():
	if Keepdata.language =="en":
		TranslationServer.set_locale("en")
	else:
		TranslationServer.set_locale("jp")
	Keepdata.scene_name = "OwlHouse"
	Keepdata.check_clues()
	$NumberofClues2.text = ": "+str(Keepdata.clue_num)+" / 8"
	#$NumberofClues.text = tr("Clues")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func display_description(name):
	object_name = name
	if name == "BankRecord":
		descriptionText = Bank
		Keepdata.cluses[0] = true
		$Panel/Bank.visible = true
	elif name == "Diary":
		descriptionText = Diary
		Keepdata.cluses[1] = true
		$Panel/Diary.visible = true
	elif name == "Weapon":
		descriptionText = Weapon
		Keepdata.cluses[2] = true
		$Panel/Weapon.visible = true
	elif  name == "Letter":
		descriptionText = Letter
		Keepdata.cluses[3] = true
		$Panel/Letter.visible = true
	elif name == "PhoneRecord":
		descriptionText = Phone
		Keepdata.cluses[4] = true
		$Panel/Phone.visible = true
	elif name == "Window":
		Keepdata.cluses[5] = true
		descriptionText=WindowB
		$Panel/Window.visible = true
	$Panel/descriptionLabel.text = descriptionText
	$Panel/descriptionLabel.text = tr(object_name)
	Keepdata.check_clues()
	$NumberofClues2.text = ": "+str(Keepdata.clue_num)+" / 8"
	pass
func change_to_eng():
	TranslationServer.set_locale("en")
	$ExitPane/Exit.text = tr("ExitButton")
	if(object_name!=null):
		$Panel/descriptionLabel.text = tr(object_name)
	pass
func change_to_jp():
	TranslationServer.set_locale("jp")
	$ExitPane/Exit.text = tr("ExitButton")
	if(object_name!=null):
		$Panel/descriptionLabel.text = tr(object_name)
	pass


func _on_close_button_pressed():
	$Panel/Diary.visible = false
	$Panel/Weapon.visible = false
	$Panel/Letter.visible = false
	$Panel/Phone.visible = false
	$Panel/Bank.visible = false
	$Panel/Window.visible = false
	$Panel2.visible = false
	$Panel.visible = false
	character.move_speed = 6
	character.rotation_speed = 20
	investigate.is_in_collider = false
	pass # Replace with function body.


func _on_setting_button_pressed():
	$SettingPanel.visible = true
	pass # Replace with function body.
