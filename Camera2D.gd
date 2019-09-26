extends Camera2D


var player
var score
# Called when the node enters the scene tree for the first time.
#func _ready():
	#set_process(true)

func _process(delta):
	global_position.y = min(global_position.y, player.global_position.y)
	score = abs(int(global_position.y))
	
func _input(event):
	if event.is_action_pressed("ui_end"):
		get_tree().paused = true