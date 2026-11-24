class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var speed := 40.0
var look_dir := "down"

var direction: Vector2 = Vector2.ZERO
var diagonalMovement
var move_dir: Array

enum directions {UP, DOWN, LEFT, RIGHT, UPLEFT, UPRIGHT, DOWNLEFT, DOWNRIGHT}
enum value {POSITIVE, NEGATIVE, ZERO}

func tick(delta: float) -> void:
	if body == null:
		return
	
	# Top Down Movement
	body.move_and_slide()
	body.velocity.x = direction.x * speed
	body.velocity.y = direction.y * speed
	
	move_dir = setDirectionValues(Vector2(-direction.x, -direction.y))
	print(move_dir)
	
	## Face Movement Direction
	if direction.length_squared() > 0.001:
			match move_dir:
				[value.POSITIVE , value.ZERO]: look_dir = "left"
				[value.NEGATIVE, value.ZERO]: look_dir = "right"
				[value.ZERO, value.POSITIVE]: look_dir = "up"
				[value.ZERO, value.NEGATIVE]: look_dir = "down"
				[value.POSITIVE, value.POSITIVE]: look_dir = "left-up" 
				[value.NEGATIVE, value.POSITIVE]: look_dir = "right-up"
				[value.POSITIVE, value.NEGATIVE]: look_dir = "left-down"
				[value.NEGATIVE, value.NEGATIVE]: look_dir = "right-down"

func setDirectionValues(direction: Vector2) -> Array:
	var result = [direction.x, direction.y]
	
	for n in 2:
		if result[n] > 0:
			result[n] = value.POSITIVE
		elif result[n] == 0:
			result[n] = value.ZERO
		else:
			result[n] = value.NEGATIVE
	
	return result
