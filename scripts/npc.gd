extends Node3D
@export var delayf : float
var npc
@export var action_name : String
var finish_delay
# Called when the node enters the scene tree for the first time.
func _ready():
	finish_delay = false
	# Call a function after a delay of 2 seconds
	call_function_with_delay("delayed_function", delayf)

func call_function_with_delay(func_name: String, delay: float) -> void:
	var timer = get_tree().create_timer(delay)
	await timer.timeout
	call_deferred(func_name)

func delayed_function() -> void:
	finish_delay = true
	print("Function called after delay")

func _process(delta):
	if finish_delay:
		$AnimationPlayer.play(action_name)
