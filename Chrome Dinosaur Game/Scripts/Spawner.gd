extends Node2D

@export var Obstacles: Array[PackedScene] = []
@export var SpawnInterval = 0.0
@export var SpeedInterval = 0.0

var timer = 0

# Spawner functionality
func _process(delta):
	timer += delta
	if timer >= SpawnInterval:
		var object = Obstacles[randi_range(0, Obstacles.size() - 1)].instantiate()
		get_parent().add_child(object)
		object.set("speed", SpeedInterval)
		object.set("position", self.position)
		timer = 0
