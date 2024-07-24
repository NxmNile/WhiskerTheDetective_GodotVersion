extends Control
#const menu = preload("res://scenes/menu.tscn")
#const intro = preload("res://scenes/intro.tscn")
#var menu_instance = menu.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
#var intro_instance = intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)

func _ready():
	$Sound/BGM.play()
	Keepdata.scene_name = "Menu"
	if Keepdata.language == "jp":
		_change_to_jp()
	else:
		_change_to_en()
	var button_node = find_child("StartButton")
	button_node.connect("pressed",_on_start_button_pressed.bind())

func set_language():
	$StartButton/Label.text = tr("StartButton")
	$ExitButton/Label.text = tr("ExitButton")
	$CreditButton/Label.text = tr("CreditButton")

func _change_to_en():
	TranslationServer.set_locale("en")
	set_language()
func _change_to_jp():
	TranslationServer.set_locale("jp")
	set_language()



func _on_exit_button_pressed():
	get_tree().quit()


func _on_setting_button_pressed():
	$SettingPanel.visible =true


func _on_credit_button_pressed():
	$CreditPanel.visible = true

func _on_button_pressed():
	$CreditPanel.visible = false
	pass # Replace with function body.


func _on_start_button_pressed():
	Keepdata.scene_name = "Intro"
	#menu_instance.queue_free()
	get_tree().change_scene_to_file("res://scenes/intro.tscn")
	pass # Replace with function body.
