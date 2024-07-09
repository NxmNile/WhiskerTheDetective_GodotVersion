extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if Keepdata.language == "en":
		TranslationServer.set_locale("en")
	else:
		TranslationServer.set_locale("jp")
	$NumberofClues2.text = ": "+str(Keepdata.clue_num)+" / 8"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func change_to_en():
	TranslationServer.set_locale("en")
func change_to_jp():
	TranslationServer.set_locale("jp")

func _on_setting_button_pressed():
	$SettingPanel.visible = true
	pass # Replace with function body.
