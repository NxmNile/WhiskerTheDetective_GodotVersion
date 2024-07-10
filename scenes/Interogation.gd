extends Area3D
@onready var character = $"../Character"
var object_name : String
var is_in_collider =false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = character.transform
	pass


func _on_area_entered(area):
	object_name = area.name
	is_in_collider = true
	if object_name =="Rabbit":
		$"../Control/InterrogatePanel".visible =true
	elif object_name =="owl2":
		$"../Control/InterrogatePanel2".visible = true
	elif  object_name == "squirrel":
		$"../Control/InterrogatePanel3".visible = true
	elif object_name =="badger":
		$"../Control/InterrogatePanel4".visible = true
	elif object_name == "CatOfficer":
		$"../Control/Talk".visible = true

func _on_area_exited(area):
	is_in_collider = false
	$"../Control/InterrogatePanel".visible =false
	$"../Control/InterrogatePanel2".visible = false
	$"../Control/InterrogatePanel3".visible = false
	$"../Control/InterrogatePanel4".visible = false
	$"../Control/Talk".visible = false
	pass # Replace with function body.
