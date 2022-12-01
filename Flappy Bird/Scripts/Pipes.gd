extends Node2D

@export var speed = 0.0
# Despawns the pipe. Not needed for the VULCAN renderer, but it works.
@export var despawn_speed = 0.0
var timer = 0.0

func _process(delta):
	timer += delta
	self.translate(Vector2(-speed * delta, 0))
	if timer >= despawn_speed:
		self.free()

# Murder system for the bird
func _on_pipe_body_entered(body):
	get_node("Die").play()
	body.free()

# This function is used to count the value of how many times you did a thing!
func _on_area_body_entered(_body):
	get_node("Score").play()
	get_parent().set("Value", get_parent().get("Value") + 1)
