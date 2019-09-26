extends Camera2D

var player

# Called when the node enters the scene tree for the first time.
#func _ready():
	#set_process(true)

func _process(delta):
	global_position.y = min(global_position.y, player.global_position.y)
	print(abs(int(global_position.y)))
	
