extends KinematicBody2D

const ACCEL = 1500
const MAX_SPEED = 500
const FRICTION = -500 #

const GRAVITY = 4000
const JUMP_SPEED = -1500

var acc = Vector2()
var vel = Vector2()

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	acc.y = GRAVITY
		
	if Input.is_action_pressed("ui_right"):
		acc.x = Vector2.RIGHT.x
	elif Input.is_action_pressed("ui_left"):
		acc.x = Vector2.LEFT.x
	else:
		acc.x = 0
		
	acc.x *= ACCEL
	if acc.x == 0:
		acc.x = vel.x * FRICTION * delta
	
	if is_on_floor():
		vel.y = JUMP_SPEED
	
	vel += acc * delta
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)
	vel = move_and_slide(vel, Vector2.UP)
	

func _on_viewport_exited(viewport):
	print("Game Over!")
