extends Area3D
@onready var character = $"../Character"
@onready var UI = $"../Control"
var object_name : String
var is_in_collider =false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = character.transform
	if Input.is_action_pressed("F")&&is_in_collider:
		$"../Control/Panel".visible = true
		character.stop_move()
		deactive_UI()
		UI.display_description(object_name)
	pass


func _on_area_entered(area):
	#print(area.name)
	object_name = area.name
	is_in_collider = true
	if object_name =="Rabbit":
		$"../Control/InterrogatePanel".visible =true
		$"../Control/InterrogatePanel2".visible =false
		$"../Control/InterrogatePanel3".visible = false
		$"../Control/InterrogatePanel4".visible = false
	elif object_name =="Owl":
		$"../Control/InterrogatePanel".visible =  false
		$"../Control/InterrogatePanel2".visible = true
		$"../Control/InterrogatePanel3".visible = false
		$"../Control/InterrogatePanel4".visible = false
	elif  object_name == "squirrel":
		$"../Control/InterrogatePanel".visible = false
		$"../Control/InterrogatePanel2".visible =false
		$"../Control/InterrogatePanel3".visible = true
		$"../Control/InterrogatePanel4".visible = false
	elif object_name =="badger":
		$"../Control/InterrogatePanel".visible = false
		$"../Control/InterrogatePanel2".visible =false
		$"../Control/InterrogatePanel3".visible = false
		$"../Control/InterrogatePanel4".visible = true
	elif object_name == "CatOfficer":
		$"../Control/Talk".visible = true

func _on_area_exited(area):
	if object_name== area.name:
		is_in_collider= false
	if area.name =="Rabbit":
		$"../Control/InterrogatePanel".visible = false
	elif area.name =="Owl":
		$"../Control/InterrogatePanel2".visible = false
	elif  area.name == "squirrel":
		$"../Control/InterrogatePanel3".visible = false
	elif area.name =="badger":
		$"../Control/InterrogatePanel4".visible = false
	elif area.name == "CatOfficer":
		$"../Control/Talk".visible = false
	pass # Replace with function body.

func deactive_UI():
	$"../Control/InterrogatePanel".visible = false
	$"../Control/InterrogatePanel2".visible =false
	$"../Control/InterrogatePanel3".visible = false
	$"../Control/InterrogatePanel4".visible = false
	$"../Control/Talk".visible = false
