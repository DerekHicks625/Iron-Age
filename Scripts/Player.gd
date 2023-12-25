extends KinematicBody2D


#Physics
var Speed = 250
var Velocity = Vector2()

#Manual Character Smoothing
var MouseSmooth = Vector2()
var MouseSpeed = 100

#Load In Custom Cursors
var Cursor1 = load("res://ExtAssets/GUI/Cursor/CrossHair1.png")
var Cursor2 = load("res://ExtAssets/GUI/Cursor/CrossHair2.png")
var Cursor3 = load("res://ExtAssets/GUI/Cursor/MainCursor.png")

func _ready():
	Input.set_custom_mouse_cursor(Cursor1)

func _physics_process(delta):
	Velocity = Vector2()
	
	if Input.get_action_strength("Down"):
		Velocity.y += Speed
	if Input.get_action_strength("Up"):
		Velocity.y -= Speed
	if Input.get_action_strength("Left"):
		Velocity.x -= Speed
	if Input.get_action_strength("Right"):
		Velocity.x += Speed
	
	if Input.is_action_just_pressed("Block"):
		Input.set_custom_mouse_cursor(Cursor2)
	if Input.is_action_just_released("Block"):
		Input.set_custom_mouse_cursor(Cursor1)
	
	if Input.is_action_pressed("Sprint"):
		Speed = 350
	else:
		Speed = 250
	
	move_and_slide(Velocity)

func _process(delta):
	MouseSmooth = lerp(MouseSmooth, get_global_mouse_position(), 0.15)
	look_at(MouseSmooth)

func _input(event):
	pass
