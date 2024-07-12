extends Control
@onready var character = $"../Character"
@onready var interrogate = $"../InteractionCol"
@onready var camera_controller = $"../Camera Controller"
@export var Rabbit: Array
@export var Owl: Array
@export var Squirrel: Array
@export var Squirrel2: Array
@export var Badger: Array
@export var Police: Array
@export var Police2: Array
@export var Police3: Array
@export var Police4: Array
@export var type_speed: float = 0.02
var index: int = 0
var dialog_name: Array
var translate_key: String
var key_name: String
var is_typing: bool = false
var continue_typing: bool = true

signal typing_finished
func _ready():
	Keepdata.scene_name == "PoliceStation2"
	$Panel/YesNo/YesButton/Label.text = tr("Yes")
	$Panel/YesNo/NoButton/Label.text = tr("No")
	$Panel/Choice/RabbitButton/Label.text = tr("Choice1")
	$Panel/Choice/OwlButton/Label.text = tr("Choice2")
	$Panel/Choice/SquirrelButton/Label.text = tr("Choice3")
	$Panel/Choice/BadgerButton/Label.text = tr("Choice4")
	set_language(Keepdata.language)
	#choose_dialog("Rabbit")

func _process(delta):
	pass

func _on_close_button_pressed():
	clear_dialog()
	character.can_move()
	index = 0
	$Panel/CloseButton.visible = false
	$Panel.visible = false
	$Panel/YesNo.visible = false
	interrogate.is_in_collider = false
	camera_controller.set_active_camera("camera1")

func choose_dialog(name):
	interrogate.is_in_collider = false
	character.stop_move()
	if name == "Rabbit":
		Keepdata.npc[0] = true
		camera_controller.set_active_camera("camera2")
		dialog_name = Rabbit
		key_name = "Rabbit"
	elif name == "Owl":
		Keepdata.npc[1] = true
		camera_controller.set_active_camera("camera3")
		dialog_name = Owl
		key_name = "Owl"
	elif name == "Squirrel":
		Keepdata.npc[2] = true
		camera_controller.set_active_camera("camera4")
		dialog_name = Squirrel
		key_name = "Squirrel"
	elif name == "Badger":
		Keepdata.npc[3] = true
		camera_controller.set_active_camera("camera5")
		dialog_name = Badger
		key_name = "Badger"
	elif name == "CatOfficer":
		camera_controller.set_active_camera("camera6")
		Keepdata.check_interrogate()
		
		if Keepdata.npc_num ==1 :
			dialog_name = Police 
			key_name = "Police"
		else:
			$Panel/YesNo.visible = true
			dialog_name = Police2 
			key_name = "Police2"

	display_dialog(dialog_name)

func clear_dialog():
	$Panel/descriptionLabel.text = ""

func display_dialog(dialog):
	continue_typing =true
	clear_dialog()
	translate_key = key_name + str(index + 1)
	#print(translate_key)
	var display_text = dialog[index]
	display_text = tr(translate_key)
	#print(display_text)
	start_typewriter_effect(display_text)

func start_typewriter_effect(line: String) -> void:
	is_typing = true
	continue_typing = true
	var final_text = line
	var current_text = ""
	for char in line:
		if !continue_typing:
			#current_text = final_text
			break
		current_text += char
		$Panel/descriptionLabel.text = current_text
		await get_tree().create_timer(type_speed).timeout
	#$Panel/descriptionLabel.text = current_text
	is_typing = false
	_on_typing_finished()


func _on_typing_finished():
	if index < dialog_name.size() - 1:
		$Panel/NextButton.visible = true
	elif index ==4 && !(key_name =="Police4"||key_name=="Squirrel2"||key_name=="Police3"):
		$Panel/CloseButton.visible = true
	if key_name == "Police2":
		$Panel/NextButton.visible = false
	if key_name =="Police4"||key_name=="Squirrel2"||key_name=="Police3":
		$Panel/CloseButton.visible = false
func _on_next_button_pressed():
	$Panel/NextButton.visible = false
	clear_dialog()
	index += 1
	display_dialog(dialog_name)

func set_language(language: String):
	Keepdata.language = language
	TranslationServer.set_locale(language)
	# Optionally update the current dialog to reflect the language change
	if dialog_name:
		clear_dialog()
		index = 0
		display_dialog(dialog_name)

func change_to_en():
	TranslationServer.set_locale("en")
	$Panel/YesNo/YesButton/Label.text = tr("Yes")
	$Panel/YesNo/NoButton/Label.text = tr("No")
	$Panel/Choice/RabbitButton/Label.text = tr("Choice1")
	$Panel/Choice/OwlButton/Label.text = tr("Choice2")
	$Panel/Choice/SquirrelButton/Label.text = tr("Choice3")
	$Panel/Choice/BadgerButton/Label.text = tr("Choice4")
	if continue_typing:
		change_language()
func change_to_jp():
	TranslationServer.set_locale("jp")
	$Panel/YesNo/YesButton/Label.text = tr("Yes")
	$Panel/YesNo/NoButton/Label.text = tr("No")
	$Panel/Choice/RabbitButton/Label.text = tr("Choice1")
	$Panel/Choice/OwlButton/Label.text = tr("Choice2")
	$Panel/Choice/SquirrelButton/Label.text = tr("Choice3")
	$Panel/Choice/BadgerButton/Label.text = tr("Choice4")
	if continue_typing:
		change_language()
	

func change_language():
	continue_typing = false
	display_dialog(dialog_name)
	pass

func _on_yes_button_pressed():
	$Panel/Choice.visible = true
	$Panel/YesNo.visible = false
	index+=1
	display_dialog(dialog_name)
	pass # Replace with function body.


func _on_no_button_pressed():
	$Panel/YesNo.visible = false
	character.can_move()
	$Panel.visible = false
	pass # Replace with function body.


func _on_setting_button_pressed():
	$SettingPanel.visible = true
	pass # Replace with function body.

func choose_the_murderer(choice):
	$Panel/Choice.visible = false
	index=0
	if choice == false:
		key_name = "Police3"
		dialog_name = Police3 
		display_dialog(dialog_name)
		await get_tree().create_timer(4).timeout
		$Failed.visible = true
	elif choice == true:
		key_name = "Police4"
		dialog_name = Police4
		display_dialog(dialog_name)
		await get_tree().create_timer(3).timeout
		camera_controller.set_active_camera("camera4")
		dialog_name = Squirrel2
		key_name = "Squirrel2"
		display_dialog(dialog_name)
		await get_tree().create_timer(5).timeout
		camera_controller.set_active_camera("camera6")
		$Panel.visible = false
		$Congratulations.visible = true
		
	
func _on_rabbit_button_pressed():
	
	choose_the_murderer(false)
	
func _on_owl_button_pressed():
	choose_the_murderer(false)

func _on_badger_button_pressed():
	choose_the_murderer(false)

func _on_squirrel_button_pressed():
	choose_the_murderer(true)
