extends Node3D

# Preload scenes
const menu = preload("res://scenes/main_menu.tscn")
const murder_room = preload("res://scenes/murder_case.tscn")
const intro = preload("res://scenes/intro.tscn")
const environment = preload("res://scenes/environment.tscn")
const police_station = preload("res://scenes/police_interia.tscn")
const police_intro = preload("res://scenes/police_intro.tscn")

var menu_instance = menu.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var room_instance = murder_room.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var env_instance = environment.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var intro_instance = intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var police_instance = police_station.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var policeint_instance = police_intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)

var current_scene: Node = null


# Function to change scenes
func change_scene(scene_name):
	var scene_resource
	if scene_name == "Menu":
		scene_resource = menu
	elif scene_name == "Intro":
		scene_resource = intro
	elif scene_name == "Environment2":
		scene_resource = environment2
	elif scene_name == "Murder_room":
		scene_resource = murder_room
	elif scene_name == "Environment":
		scene_resource = environment
	elif scene_name == "PoliceIntro":
		scene_resource=police_intro
	else:
		scene_resource=police_station
	# If there's a current scene, remove it
	if current_scene:
		current_scene.queue_free()
	# Instantiate and add the new scene
	current_scene = scene_resource.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	#add_child(current_scene)
	
func set_first_scene():
	current_scene = menu_instance
