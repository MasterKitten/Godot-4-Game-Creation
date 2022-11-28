extends RigidBody2D

@export var speed = 0.0

func _process(_delta):
	if Input.get_action_raw_strength("flap") && self.linear_velocity.y >= -100:
		self.linear_velocity.y = -speed
		get_node("AnimationPlayer").set("current_animation", "[stop]")
		get_node("AnimationPlayer").set("current_animation", "Flap")
