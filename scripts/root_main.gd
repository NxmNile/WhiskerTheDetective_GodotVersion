extends Node3D
const menu = preload("res://scenes/main_menu.tscn")
const muder_room = preload("res://scenes/murder_case.tscn")

var menu_instance = menu.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var room_instance = muder_room.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(menu_instance)
	var button_node = menu_instance.find_child("PlayButton")
	button_node.connect("button_down",change_to_play.bind())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_to_play():
	menu_instance.queue_free()
	add_child(room_instance)
	print("called")
	pass
