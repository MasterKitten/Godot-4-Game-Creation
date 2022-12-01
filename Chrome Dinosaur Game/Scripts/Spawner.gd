extends Node2D

@export var Obstacles: Array[PackedScene] = []

# Rnage for how long it takes for the thing to spawn
@export var MinSpawnInterval = 1.0
@export var MaxSpawnInterval = 2.5
# This is how the spawner knows when to spawn.
var SpawnInterval = 0.0

var timer = 0
var Points = 0

# Spawner functionality
func _process(delta):
	timer += delta
	Points += delta * 10
	if timer >= SpawnInterval:
		var object = Obstacles[randi_range(0, Obstacles.size() - 1)].instantiate()
		get_parent().add_child(object)
		object.set("position", self.position)
		timer = 0
		SpawnInterval = randf_range(MinSpawnInterval, MaxSpawnInterval)
