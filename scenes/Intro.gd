extends Control

@export var conversation: Array = ["Hello there!", "How are you?", "Welcome to the game!"]
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
	else:
		TranslationServer.set_locale("jp")
	Keepdata.scene_name ="Intro"
	start_conversation()

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
