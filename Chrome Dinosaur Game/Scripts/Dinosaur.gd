extends CharacterBody2D

@export var speed = 500

func _process(delta):
	var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
	if !is_on_floor():
		velocity.y += gravity * delta
	
	# Handling the jumping as well as the stomping
	if Input.is_action_just_pressed("Jump") && is_on_floor():
		velocity.y = -speed
	if Input.is_action_just_pressed("Stomp"):
		velocity.y = speed * 2
	
	
	
	move_and_slide()
