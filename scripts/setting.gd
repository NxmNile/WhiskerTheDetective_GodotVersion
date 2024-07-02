extends Node

@onready var parent_node = $".."

func _ready():
	TranslationServer.set_locale("en")
	pass

func _on_en_button_pressed():
	TranslationServer.set_locale("en")
	$Panel/ENButton/Panel.visible = true
	$Panel/JPButton/Panel2.visible = false
	parent_node._change_to_english()

func _on_jp_button_pressed():
	TranslationServer.set_locale("jp")
	$Panel/ENButton/Panel.visible = false
	$Panel/JPButton/Panel2.visible = true
	parent_node._change_to_japanese()

func _on_close_button_pressed():
	$".".visible = false
	pass
