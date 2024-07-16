extends Node3D

# Preload scenes
const menu = preload("res://scenes/main_menu.tscn")
const murder_room = preload("res://scenes/murder_case.tscn")
const intro = preload("res://scenes/intro.tscn")
const environment = preload("res://scenes/environment.tscn")
#const environment2 = preload("res://scenes/first_en.tscn")
const police_station = preload("res://scenes/police_interia.tscn")
const police_intro = preload("res://scenes/police_intro.tscn")

var menu_instance = menu.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var room_instance = murder_room.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var env_instance = environment.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
#var env2_instance = environment2.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var intro_instance = intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var police_instance = police_station.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
var policeint_instance = police_intro.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)

var current_scene: Node = null

# Called when the node enters the scene tree for the first time.
func _ready():
	Keepdata.scene_name = "Menu"
	change_scene(menu)

# Function to change scenes
func change_scene(scene_resource: PackedScene):
	# If there's a current scene, remove it
	if current_scene:
		current_scene.queue_free()

	# Instantiate and add the new scene
	current_scene = scene_resource.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	add_child(current_scene)
	
	# Connect button signals for the appropriate scenes
	if scene_resource == menu:
		var button_node = current_scene.find_child("PlayButton", true, false)
		if button_node:
			button_node.connect("pressed", Callable(self, "change_to_intro"))

	elif scene_resource == intro:
		var button_node = current_scene.find_child("PlayButton", true, false)
		if button_node:
			button_node.connect("pressed", Callable(self, "change_to_policeintro"))

# Function to change to the intro scene
func change_to_intro():
	Keepdata.scene_name = "Intro"
	change_scene(intro)

# Function to change to the police intro scene
func change_to_policeintro():
	Keepdata.scene_name = "PoliceStation2"
	change_scene(police_intro)
