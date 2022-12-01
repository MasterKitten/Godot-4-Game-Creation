extends Area2D
# Time it takes to remove the stupid out.
@export var DespawnTime = 10
var speed = 0.0

var timer = 0.0

# Move and set the despawning part
func _process(delta):
	self.translate(Vector2(-speed * delta, 0))
	timer += delta
	
	speed = get_parent().get("BaseObjectSpeedSpeed")
	
	if timer >= DespawnTime:
		self.free()

# Time to kill!
func _on_body_entered(body):
	body.free()
