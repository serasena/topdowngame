class_name MovementComponent extends Node

@export var body: CharacterBody2D
@export var speed := 60.0
var look_dir := "down"

var direction: Vector2 = Vector2.ZERO

func tick(delta: float) -> void:
	if body == null:
		return
	
	# Top Down Movement
	body.move_and_slide()
	body.velocity.x = direction.x * speed
	body.velocity.y = direction.y * speed
	
	## Face Movement Direction
	if direction.length_squared() > 0.001:
		
		match Vector2(-direction.x, -direction.y).normalized():
			Vector2(1.00, 0.00): look_dir = "left"
			Vector2(-1.00, 0.00): look_dir = "right"
			Vector2(0.00, 1.00): look_dir = "up"
			Vector2(0.00, -1.00): look_dir = "down"
