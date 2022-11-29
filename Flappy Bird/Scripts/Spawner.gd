extends Node2D

@export var pipes: PackedScene
@export var spawn_time = 0.0
var timer = 0.0

# This value is what scripts grab to set the value
var Value = 0

func _ready():
	SpawnPipe()

func _process(delta):
	timer += delta
	if timer >= spawn_time:
		SpawnPipe()

#Pipe Spawner
func SpawnPipe():
	var the_child = pipes.instantiate()
	self.add_child(the_child)
	the_child.set("position", Vector2(0, randf_range(-150, 150)))
	timer = 0
