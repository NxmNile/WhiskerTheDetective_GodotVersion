extends Control
#const intro = preload("res://scenes/intro.tscn")
#const police_intro = preload("res://scenes/police_intro.tscn")
#var intro_instance = intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
@export var conversation: Array
var index: int = 0
var dialog_name: Array
var translate_key: String
var key_name: String
var is_typing: bool = false
var continue_typing: bool = true
var current_text: String = ""
@onready var Line1 = $Panel/Label
@onready var Line2 = $Panel/Label2
@onready var Line3 = $Panel/Label3
@onready var Line4 = $Panel/Label4
@onready var Line5 = $Panel/Label5
@export var type_speed: float = 0.02

# Called when the node enters the scene tree for the first time.
func _ready():
	if Keepdata.language =="en":
		TranslationServer.set_locale("en")
	elif Keepdata.language=="jp":
		TranslationServer.set_locale("jp")
	Keepdata.scene_name ="Intro"
	#var button_node = find_child("PlayButton")
	#button_node.connect("pressed",_on_play_button_pressed.bind())
	$"Sound Controller/PhoneRigging".play()
	await get_tree().create_timer(1).timeout
	$"Sound Controller/PhonePickedup".play()
	await get_tree().create_timer(0.5).timeout
	$"Sound Controller/BGM".play()
	await get_tree().create_timer(1).timeout
	start_conversation()
func _process(delta):
	if Input.is_action_just_pressed("NextDialog"):
		_on_play_button_pressed()
func start_conversation() -> void:
	var sentence : String
	for i in range(conversation.size()):
		# Add a newline before starting the next line in the conversation
		if i > 0:
			current_text += "\n"
		if i == 0:
			sentence = tr("Intro1")
			start_typewriter_effect(sentence,Line1)
		elif i==1:
			sentence = tr("Intro2")
			start_typewriter_effect(sentence,Line2)
		elif i==2:
			sentence = tr("Intro3")
			start_typewriter_effect(sentence,Line3)
		elif i==3:
			sentence = tr("Intro4")
			start_typewriter_effect(sentence,Line4)
		elif i==4:
			sentence = tr("Intro5")
			start_typewriter_effect(sentence,Line5)
		await get_tree().create_timer(2).timeout
	$Panel/SettingButton.visible = true
	$Panel/PlayButton.visible = true
	pass

func start_typewriter_effect(line: String,label) -> void:
	is_typing = true
	continue_typing = true
	var final_text = line
	var current_text=""
	for char in line:
		if !continue_typing:
			break
		current_text += char
		label.text = current_text
		await get_tree().create_timer(type_speed).timeout
	
	is_typing = false

func change_to_en():
	TranslationServer.set_locale("en")
	$Panel/Label.text = tr("Intro1")
	$Panel/Label2.text = tr("Intro2")
	$Panel/Label3.text = tr("Intro3")
	$Panel/Label4.text = tr("Intro4")
	$Panel/Label5.text = tr("Intro5")

func change_to_jp():
	TranslationServer.set_locale("jp")
	$Panel/Label.text = tr("Intro1")
	$Panel/Label2.text = tr("Intro2")
	$Panel/Label3.text = tr("Intro3")
	$Panel/Label4.text = tr("Intro4")
	$Panel/Label5.text = tr("Intro5")
func _on_setting_button_pressed():
	$Panel/SettingPanel.visible = true
	pass # Replace with function body.


func _on_play_button_pressed():
	Keepdata.scene_name = "PoliceStation2"
	#const intro = preload("res://scenes/intro.tscn")
	#intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
	get_tree().change_scene_to_file("res://scenes/police_intro.tscn")
	
	pass # Replace with function body.
