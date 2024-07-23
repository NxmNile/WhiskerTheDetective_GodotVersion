extends Area3D

@onready var character = $"../Character"
@onready var interaction = $"../InteractionCol"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform =character.transform
	rotation = character.rotation
	#print("Extra"+ str(rotation))


func _on_area_entered(area):
	#print(area.name)
	character.move_speed =0
	pass # Replace with function body.


func _on_area_exited(area):
	print("Exit")
	character.can_move()
	
	pass # Replace with function body.
