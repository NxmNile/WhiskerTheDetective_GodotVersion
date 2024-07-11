extends Control
@onready var interrogate = $"../InteractionCol"
@export var Rabbit : Array
@export var Owl : Array
@export var Squirrel : Array
@export var Squirrel2 : Array
@export var Badger : Array
@export var Police :Array
@export var Police2 : Array
@export var Police3 : Array
@export var Police4 : Array
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_button_pressed():
	$Panel.visible = false
	interrogate.is_in_collider=false

func display_description(name):
	
	pass
