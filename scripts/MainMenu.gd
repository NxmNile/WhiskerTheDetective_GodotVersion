extends Node
const menu = preload("res://scenes/main_menu.tscn")
const intro = preload("res://scenes/intro.tscn")
func _ready():
	Keepdata.scene_name == "Menu"
	$PlayButton/PlayButtonBG/Label.text = tr("StartButton")
	$ExitButton/ExitButtonBG/Label.text = tr("ExitButton")
func _on_exit_button_pressed():
	pass

func _on_play_button_pressed():
	menu.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
	get_tree().change_scene_to_packed(intro)
	pass

func _on_setting_button_pressed():
	$SettingPanel.visible = true

func _change_to_english():
	TranslationServer.set_locale("en")
	$PlayButton/PlayButtonBG/Label.text = tr("StartButton")
	$ExitButton/ExitButtonBG/Label.text = tr("ExitButton")

func _change_to_japanese():
	TranslationServer.set_locale("jp")
	$PlayButton/PlayButtonBG/Label.text = tr("StartButton")
	$ExitButton/ExitButtonBG/Label.text = tr("ExitButton")
