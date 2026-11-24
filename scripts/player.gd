class_name Player extends CharacterBody2D

@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interaction_component: InteractionComponent = %InteractionComponent

func _physics_process(delta: float) -> void:
	
	# Read Controls
	input_component.update()
	
	# Read Movement Component
	movement_component.direction = input_component.move_dir
	movement_component.diagonalMovement = input_component.doubleInput
	movement_component.tick(delta)
	
	var looking_dir = movement_component.look_dir
	var diagonalMove = movement_component.diagonalMovement
	
	if input_component.is_moving:
		if looking_dir == "left" || looking_dir == "right":
			animated_sprite_2d.animation = "walk_side"
			animated_sprite_2d.flip_h = looking_dir == "left"
		
		elif looking_dir == "left-up" || looking_dir == "right-up":
			animated_sprite_2d.animation = "walk_side-up"
			animated_sprite_2d.flip_h = looking_dir == "right-up"
			
		elif looking_dir == "left-down" || looking_dir == "right-down":
			animated_sprite_2d.animation = "walk_side-down"
			animated_sprite_2d.flip_h = looking_dir == "left-down"
		
		else:
			animated_sprite_2d.animation = "walk_" + String(looking_dir)
			animated_sprite_2d.flip_h = false

	else:
		if looking_dir == "left" || looking_dir == "right":
			animated_sprite_2d.animation = "idle_side"
			animated_sprite_2d.flip_h = looking_dir == "left"
				
		elif looking_dir == "left-up" || looking_dir == "right-up":
			animated_sprite_2d.animation = "idle_side-up"
			animated_sprite_2d.flip_h = looking_dir == "left-up"
			
		elif looking_dir == "left-down" || looking_dir == "right-down":
			animated_sprite_2d.animation = "idle_side-down"
			animated_sprite_2d.flip_h = looking_dir == "left-down"
				
		else:
			animated_sprite_2d.animation = "idle_" + String(looking_dir)
			animated_sprite_2d.flip_h = false
