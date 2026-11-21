class_name Player extends CharacterBody2D

@onready var input_component: InputComponent = %InputComponent
@onready var movement_component: MovementComponent = %MovementComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Read Controls
	input_component.update()
	
	# Read Movement Component
	movement_component.direction = input_component.move_dir
	movement_component.tick(delta)
	
	var looking_dir := movement_component.look_dir
	print(looking_dir)
	
	if input_component.is_moving:
		
		if looking_dir == "left" || looking_dir == "right":
			animated_sprite_2d.animation = "walk_side"
			animated_sprite_2d.flip_h = looking_dir == "left"
			
		else:
			animated_sprite_2d.animation = "walk_" + String(looking_dir)

	else:
		if looking_dir == "left" || looking_dir == "right":
			animated_sprite_2d.animation = "idle_side"
			animated_sprite_2d.flip_h = looking_dir == "left"
			
		else:
			animated_sprite_2d.animation = "idle_" + String(looking_dir)
