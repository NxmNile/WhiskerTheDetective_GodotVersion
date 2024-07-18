extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	if Keepdata.language =="en":
		change_to_en()
	else:
		change_to_jp()
	Keepdata.scene_name = "PoliceStation2"
	$"../Control/Exit/InterrogateText".text = tr("Exit")


func change_to_en():
	TranslationServer.set_locale("en")
	label_translatation()
	
func change_to_jp():
	TranslationServer.set_locale("jp")
	label_translatation()
	
func label_translatation():
	$Exit/InterrogateText.text = tr("Exit")
	$Panel/descriptionLabel.text = tr("Intro6")
	$Panel2/Name.text = tr("Choice1")
	$Panel2/Description.text = tr("RabbitRelation")
	$Panel2/Name2.text = tr("Choice2")
	$Panel2/Description2.text = tr("OwlRelation")
	$Panel2/Name3.text = tr("Choice4")
	$Panel2/Description3.text = tr("BadgerRelation")
	$Panel2/Name4.text = tr("Choice3")
	$Panel2/Description4.text = tr("SquirrelRelation")
