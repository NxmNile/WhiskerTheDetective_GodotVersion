extends Control
const police_station = preload("res://scenes/police_interia.tscn")
const intro = preload("res://scenes/intro.tscn")
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
var next_button : bool = false
var close_button : bool = true
signal typing_finished
func _ready():
	$"../Sound/BGM".play()
	Keepdata.scene_name == "PoliceStation2"
	set_text()
	set_language(Keepdata.language)
	

func _process(delta):
	if next_button == true && Input.is_action_pressed("NextDialog"):
		_on_next_button_pressed()
	if close_button == true && Input.is_action_pressed("ESC"):
		_on_close_button_pressed()
	pass

func _on_close_button_pressed():
	close_button = false
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
		
		if Keepdata.npc_num <4 :
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
	print(index)
	if index < dialog_name.size() - 1:
		next_button=true
		$Panel/NextButton.visible = true
	else:
		close_button = true
		$Panel/CloseButton.visible = true
	if index ==dialog_name.size()-1 && !(key_name =="Police4"||key_name=="Squirrel"||key_name=="Police3"):
		close_button = true
		$Panel/CloseButton.visible = true
	if key_name == "Police2":
		next_button = false
		$Panel/NextButton.visible = false
	if key_name =="Police4"||key_name=="Squirrel2"||key_name=="Police3":
		close_button = false
		$Panel/CloseButton.visible = false
func _on_next_button_pressed():
	next_button = false
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
	set_text()
	if continue_typing:
		change_language()
func change_to_jp():
	TranslationServer.set_locale("jp")
	set_text()
	if continue_typing:
		change_language()
	
func set_text():
	$Panel/YesNo/YesButton/Label.text = tr("Yes")
	$Panel/YesNo/NoButton/Label.text = tr("No")
	$Panel/Choice/RabbitButton/Label.text = tr("Choice1")
	$Panel/Choice/OwlButton/Label.text = tr("Choice2")
	$Panel/Choice/SquirrelButton/Label.text = tr("Choice3")
	$Panel/Choice/BadgerButton/Label.text = tr("Choice4")
	$Congratulations/ExitButton/Label.text = tr("ExitButton")
	$Failed/ExitButton/Label.text = tr("ExitButton")
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
	camera_controller.set_active_camera("camera1")
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
		$"../Sound/Lose".play()
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
		$"../Sound/Win".play()
	
func _on_rabbit_button_pressed():
	choose_the_murderer(false)
	
func _on_owl_button_pressed():
	choose_the_murderer(false)

func _on_badger_button_pressed():
	choose_the_murderer(false)

func _on_squirrel_button_pressed():
	choose_the_murderer(true)


func _on_try_again_button_pressed():
	reset_data()
	police_station.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
	get_tree().change_scene_to_packed(intro)



func _on_play_again_button_pressed():
	reset_data()
	police_station.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
	get_tree().change_scene_to_packed(intro)

func reset_data():
	Keepdata.scene_name = "Menu"
	Keepdata.language = "jp"
	Keepdata.cluses = [false,false,false,false,false,false,false,false]
	Keepdata.npc = [false,false,false,false]
	Keepdata.npc_num =0
	Keepdata.clue_num = 0
	Keepdata.police_station_entering = 0
	Keepdata.house_entering = 0


func _on_exit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
