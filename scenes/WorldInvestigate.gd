extends Area3D

@onready var Character = $"../Character"
var object_name : String
var is_in_collider : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform = Character.transform
	pass


func _on_area_entered(area):
	print(area.name)
	object_name = area.name
	is_in_collider = true
	$"../Camera3D/Control/InvestigatePanel".visible = true
	if object_name=="Door":
		$"../Camera3D/Control/InvestigatePanel/InvestigateText".text = "Enter"
	else:
		$"../Camera3D/Control/InvestigatePanel/InvestigateText".text = "Investigate"
	pass # Replace with function body.


func _on_area_exited(area):
	$"../Camera3D/Control/InvestigatePanel".visible = false
	pass # Replace with function body.
