extends Control

#const menu_scene = preload("res://scenes/menu.tscn")
const intro = preload("res://scenes/intro.tscn")

func _ready():
	$Sound/BGM.play()
	Keepdata.scene_name = "Menu"
	if Keepdata.language == "jp":
		_change_to_jp()
	else:
		_change_to_en()


func set_language():
	$StartButton/Label.text = tr("StartButton")
	$ExitButton/Label.text = tr("ExitButton")

func _change_to_en():
	TranslationServer.set_locale("en")
	set_language()
func _change_to_jp():
	TranslationServer.set_locale("jp")
	set_language()
func _process(delta):
	if Input.is_action_pressed("NextDialog"):
		_on_start_button_pressed()
	elif Input.is_action_just_pressed("ESC"):
		_on_exit_button_pressed()
	
func _on_start_button_pressed():
	Keepdata.scene_name = "Intro"
	
	#menu_scene.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
	#get_tree().change_scene_to_packed(intro)
	pass


func _on_exit_button_pressed():
	get_tree().quit()


func _on_setting_button_pressed():
	$SettingPanel.visible =true
