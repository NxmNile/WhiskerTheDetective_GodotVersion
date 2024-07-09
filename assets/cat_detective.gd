extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("back")||Input.is_action_pressed("forward")||Input.is_action_pressed("left")||Input.is_action_pressed("right"):
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.play("Ide")

	pass
