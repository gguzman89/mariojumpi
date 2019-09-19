extends KinematicBody2D

const ACCEL = 1500
const MAX_SPEED = 500
const FRICTION = -500

const GRAVITY = 2000
#export (int) var JUMP_SPEED = 5000

var acc = Vector2()
var vel = Vector2()

func _ready():
	set_physics_process(true)
	#pass
	
func _physics_process(delta):
	#acc.x = Vector2.ZERO.x
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
	
	vel += acc * delta
	# vel.y += acc.y 
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)
	vel = move_and_slide(vel, Vector2.UP)
	