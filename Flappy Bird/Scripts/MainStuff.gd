extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# get the value and make it available
	get_node("Label").set("text", "Score: " + str(get_node("Spawner").get("Value")))
