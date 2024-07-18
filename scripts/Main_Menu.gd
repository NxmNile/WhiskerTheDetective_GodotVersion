extends Node
const menu = preload("res://scenes/MainMenu.tscn")
const intro = preload("res://scenes/intro.tscn")

func _ready():
	$SoundController/BGMusic.play()
	Keepdata.scene_name = "Menu"
	$StartButton/Label.text = tr("StartButton")
	$Exit/Label.text = tr("ExitButton")


func _on_setting_button_pressed():
	$SettingPanel.visible = true

func _change_to_english():
	TranslationServer.set_locale("en")
	$StartButton/Label.text = tr("StartButton")
	$Exit/Label.text = tr("ExitButton")

func _change_to_japanese():
	TranslationServer.set_locale("jp")
	$StartButton/Label.text = tr("StartButton")
	$Exit/Label.text = tr("ExitButton")


func _on_start_button_pressed():
	Keepdata.scene_name = "Intro"
	menu.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE).queue_free()
	get_tree().change_scene_to_packed(intro)


func _on_exit_pressed():
	get_tree().quit()

