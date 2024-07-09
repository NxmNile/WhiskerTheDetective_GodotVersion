extends Node
#const data = preload("res://scripts/keepdata.gd")
@onready var owl_house_UI = $".."
@onready var parent_node = $".."
@onready var worldUI = $".."
func _ready():
	if Keepdata.language == "en":
		TranslationServer.set_locale("en")
		$Panel/ENButton/Panel.visible = true
		$Panel/JPButton/Panel2.visible = false
	else:
		TranslationServer.set_locale("jp")
		$Panel/ENButton/Panel.visible = false
		$Panel/JPButton/Panel2.visible = true
	$Panel/LabelSound.text = tr("LabelSound")
	pass

func _on_en_button_pressed():
	TranslationServer.set_locale("en")
	Keepdata.language = "en"
	$Panel/ENButton/Panel.visible = true
	$Panel/JPButton/Panel2.visible = false
	$Panel/LabelSound.text = tr("LabelSound")
	if Keepdata.scene_name =="Menu":
		parent_node._change_to_english()
	elif Keepdata.scene_name =="OwlHouse":
		owl_house_UI.change_to_eng()
	elif Keepdata.scene_name == "World1":
		worldUI.change_to_en()
	

func _on_jp_button_pressed():
	TranslationServer.set_locale("jp")
	Keepdata.language = "jp"
	$Panel/ENButton/Panel.visible = false
	$Panel/JPButton/Panel2.visible = true
	$Panel/LabelSound.text = tr("LabelSound")
	if Keepdata.scene_name =="Menu":
		parent_node._change_to_japanese()
	elif Keepdata.scene_name =="OwlHouse":
		owl_house_UI.change_to_jp()
	elif Keepdata.scene_name == "World1":
		worldUI.change_to_jp()
		pass

func _on_close_button_pressed():
	$".".visible = false
	pass
