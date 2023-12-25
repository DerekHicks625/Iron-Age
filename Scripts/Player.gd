extends KinematicBody2D


#Physics
var Speed : int
export var SpeedWalking : int = 250
export var SpeedSprint : int = 350

var Velocity : Vector2 = Vector2()

#Manual Character Smoothing
var MouseSmooth : Vector2 = Vector2()
var MouseSpeed : int = 100

#Load In Custom Cursors
var Cursor1 = load("res://ExtAssets/GUI/Cursor/CrossHair1.png")
var Cursor2 = load("res://ExtAssets/GUI/Cursor/CrossHair2.png")
var Cursor3 = load("res://ExtAssets/GUI/Cursor/MainCursor.png")

func _ready() -> void:
	Speed = SpeedWalking
	Input.set_custom_mouse_cursor(Cursor1)

func _physics_process(delta) -> void:
	Velocity = Vector2()

	sprint()
	movement()
	block()
	
	move_and_slide(Velocity)

func _process(delta) -> void:
	MouseSmooth = lerp(MouseSmooth, get_global_mouse_position(), 0.15)
	look_at(MouseSmooth)

func _input(event) -> void:
	pass

func movement() -> void:
	if Input.get_action_strength("Down"):
		Velocity.y += Speed
	if Input.get_action_strength("Up"):
		Velocity.y -= Speed
	if Input.get_action_strength("Left"):
		Velocity.x -= Speed
	if Input.get_action_strength("Right"):
		Velocity.x += Speed

func block() -> void:
	if Input.is_action_just_pressed("Block"):
		Input.set_custom_mouse_cursor(Cursor2)
	if Input.is_action_just_released("Block"):
		Input.set_custom_mouse_cursor(Cursor1)

func sprint() -> void:
	if Input.is_action_pressed("Sprint"):
		Speed = SpeedSprint
	else:
		Speed = SpeedWalking
