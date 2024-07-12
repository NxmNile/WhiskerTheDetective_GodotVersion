extends Control

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

func _ready():
	set_language(Keepdata.language)
	choose_dialog("Rabbit")

func _process(delta):
	pass

func _on_close_button_pressed():
	index = 0
	$Panel/CloseButton.visible = false
	$Panel.visible = false
	interrogate.is_in_collider = false
	camera_controller.set_active_camera("camera1")

func choose_dialog(name):
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
		key_name = "Police"
		if Keepdata.npc_num < 4 :
			dialog_name = Police 
		else:
			dialog_name = Police2 

	display_dialog(dialog_name)

func clear_dialog():
	$Panel/descriptionLabel.text = ""

func display_dialog(dialog):
	translate_key = key_name + str(index + 1)
	print(translate_key)
	var display_text = dialog[index]
	display_text = tr(translate_key)
	#print(display_text)
	start_typewriter_effect(display_text)

func start_typewriter_effect(line: String) -> void:
	for char in line:
		$Panel/descriptionLabel.text += char
		await get_tree().create_timer(type_speed).timeout
	if index < dialog_name.size() - 1:
		$Panel/NextButton.visible = true
	else:
		$Panel/CloseButton.visible = true

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
