extends Area2D

@export var DespawnTime = 10
var speed = 0.0

var timer = 0.0


func _process(delta):
	self.translate(Vector2(-speed * delta, 0))
	timer += delta
	if timer >= DespawnTime:
		self.free()

# Time to kill!
func _on_body_entered(body):
	body.free()
