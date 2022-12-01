extends CharacterBody2D

@export var Speed = 300.0
@export var Jump = 400.0
@export var CanFire = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = -Jump

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * Speed
		get_node("Body").set("scale", Vector2(direction, self.scale.y))
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
	
	move_and_slide()
	
	#Handles the gun
	# SET THE GUN HERE!
	var gun = get_node("Body/Gun")
	if Input.is_action_just_pressed("Shoot") and CanFire:
		if gun.is_colliding():
			var object = gun.get_collider()
			object.free()
