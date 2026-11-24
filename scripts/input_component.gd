class_name InputComponent extends Node

var move_dir: Vector2 = Vector2.ZERO
var interacted_pressed := false
var pause_pressed := false
var is_moving := false
var directionInputsPressed := [false, false, false, false]
var doubleInput := false

func update() -> void:
	move_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	interacted_pressed = Input.is_action_just_pressed("interact")
	pause_pressed = Input.is_action_just_pressed("pause")
	directionInputsPressed = [Input.is_action_pressed("move_down"), Input.is_action_pressed("move_up"), Input.is_action_pressed("move_left"), Input.is_action_pressed("move_right")]
	
	if Input.is_action_pressed("move_down") || Input.is_action_pressed("move_up") || Input.is_action_pressed("move_left") || Input.is_action_pressed("move_right") :
		is_moving = true
	else:
		is_moving = false
		
	if directionInputsPressed == [true, false, true, false] || directionInputsPressed == [true, false, false, true] || directionInputsPressed == [false, true, true, false] || directionInputsPressed == [false, true, false, true]:
		doubleInput = true
	else:
		doubleInput = false
