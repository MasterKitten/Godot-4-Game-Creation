extends CharacterBody2D

@export var PlatformStupid = false

@export var Speed = 300.0

@export var Jump = 400.0
@export var CanJump = false

@export var CanFire = true
var guntimer = 0

var AbleToMove = false
var direction = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta
	else:
		AbleToMove = true
	
	# Handles Jump
	if is_on_wall() and is_on_floor() && CanJump:
		velocity.y = -Jump
	
	# AI movement
	if AbleToMove:
		velocity.x = direction * Speed
	
	move_and_slide()
	
	# Handles the gun
	var gun = get_node("Body/Gun")
	if gun.is_colliding():
		guntimer += delta
		if guntimer >= 1:
			var object = gun.get_collider()
			object.free()
	else:
		guntimer = 0

# Switch direction if there is no more platform. Made this way so it doesn't brick itself!
func _on_right_sensor_body_exited(_body):
	if !PlatformStupid:
		direction = -1
		get_node("Body").set("scale", Vector2(direction, self.scale.y))
func _on_left_sensor_body_exited(_body):
	if !PlatformStupid:
		direction = 1
		get_node("Body").set("scale", Vector2(direction, self.scale.y))
