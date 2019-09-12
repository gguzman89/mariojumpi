extends KinematicBody2D

# Declare member variables here. Examples:
const ACCEL = 1500
const MAX_SPEED = 500
const FRICTION = 0.5
export(int) var GRAVITY = 400
export (int) var JUMP_SPEED = 5000

var acc = Vector2()
var vel = Vector2() # *

# Called when the node enters the scene tree for the first time.
func _ready():
	#set_process(true)
	pass
	
func _physics_process(delta):
	acc.y = GRAVITY
	
	if Input.is_action_pressed("ui_left"):
		acc.x = -ACCEL
	else:
		acc.x = 0
		
	if acc.x == 0:
		#acc.x = vel.x * FRICTION * delta
		vel.x = max(abs(vel.x)* FRICTION, 0) * sign(vel.x)
	else:
		vel.x -= -acc.x
		
	if Input.is_action_pressed("ui_right"):
		acc.x = ACCEL
	else: 
		acc.x = 0
		
	if acc.x == 0:
		#acc.x = vel.x * FRICTION * delta
		vel.x = max(abs(vel.x)* FRICTION, 0) * sign(vel.x)
	else:
		vel.x += acc.x
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		vel.y = -JUMP_SPEED
		
	#vel += acc * delta
	vel.y += acc.y 
	vel.x = clamp(vel.x, -MAX_SPEED, MAX_SPEED)
	vel = move_and_slide(vel, Vector2.UP)