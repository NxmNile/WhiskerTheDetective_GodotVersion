extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	# Your initialization code
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_exit_button_pressed():
	pass

func _on_play_button_pressed():
	pass

func _on_setting_button_pressed():
	$SettingPanel.visible = true

func _change_to_english():
	TranslationServer.set_locale("en")
	$PlayButton/PlayButtonBG/Label.text = tr("PlayButton")
	$ExitButton/ExitButtonBG/Label.text = tr("ExitButton")

func _change_to_japanese():
	TranslationServer.set_locale("jp")
	$PlayButton/PlayButtonBG/Label.text = tr("PlayButton")
	$ExitButton/ExitButtonBG/Label.text = tr("ExitButton")
