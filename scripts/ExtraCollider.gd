extends Area3D
@export var index: int
@onready var character = $"../Character"
@onready var interaction = $"../InteractionCol"
var raycast_collide = false
var exit_all = true
var check_collider = [true,true]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform =character.transform
	if !raycast_collide&&exit_all:
		character.can_move()
func _on_area_entered(area):
	print("enter")
	check_collider[index]=false
	check()
func _on_area_exited(area):
	print("exit")
	check_collider[index]=true
	check()
func check():
	if check_collider[0]&&check_collider[1] == true:
		character.move_speed = 6
		exit_all=true
		raycast_collide = false
	else:
		exit_all = false
		character.move_speed=0
	print(exit_all)
