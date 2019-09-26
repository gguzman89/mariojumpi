extends Node

onready var plataform = preload("res://Level/plataforma.tscn")
onready var plataform_container = get_node("plataform_container")

onready var p0 = get_node("StaticBody2D")

onready var p10 = get_node("StaticBody2D10")

var pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Camera2D.player = $KinematicBody2D
	pos.x = $StaticBody2D10.position.x
	pos.y = $StaticBody2D10.position.y
	
func _process(delta):
	if plataform_container.get_child_count() <= 5:
		spawn_plataform(3)
		
func spawn_plataform(num):
	for i in range(num):
		var p = plataform.instance()
		plataform_container.add_child(p)
		p.set_position(Vector2(pos.x, pos.y - 243))
		pos.y -= 243

func _on_viewport_exited(viewport):
	spawn_plataform(5)
	p0.queue_free()

func _on_exited_left(viewport):
#	queue_free()
	print("salio de la vista")
